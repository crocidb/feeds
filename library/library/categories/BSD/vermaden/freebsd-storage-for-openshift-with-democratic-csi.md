+++
title = "FreeBSD Storage for OpenShift with Democratic CSI"
description = "Today quite different topic, using ZFS/NFS on FreeBSD as backend storage for containers/pods running on OpenShift platform. Serving storage for OpenShift is not as simple as OpenShift will not just consume NFS or iSCSI volumes “just like that” … OpenShift requires a special CSI d"
date = "2026-08-09T20:25:26Z"
url = "https://vermaden.wordpress.com/2026/08/09/freebsd-openshift-democratic-csi/"
author = "vermaden"
text = ""
lastupdated = "2026-08-10T12:13:26.794655558Z"
seen = false
+++

Today quite different topic, using ZFS/NFS on FreeBSD as backend storage for containers/pods running on OpenShift platform.

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/freebsd-openshift-logo.png)

Serving storage for OpenShift is not as simple as OpenShift will not just consume NFS or iSCSI volumes *“just like that”* … OpenShift requires a special CSI driver in between to make that even work.

My first association with *CSI* is of course *CSI* series like *CSI: Miami* … but the real name is *Container Storage Interface* of course :

![](https://vermaden.wordpress.com/wp-content/uploads/2026/08/csi-miami.jpg)

While the [**Democratic CSI**](https://github.com/democratic-csi/democratic-csi) driver is suited mostly for Linux based systems like TrueNAS SCALE for example – its **zfs-generic-nfs** driver also works with FreeBSD – and this is what we will use today. The FreeBSD setup is very simple – its just NFSv4 only server and a dedicated NFS share for OpenShift along with dedicated ZFS dataset. One can also use any regular user with added ZFS permissions done via **zfs allow** command or a regular user with **sudo(8)** to lift up the permissions.

The FreeBSD/ZFS/NFS part was done my be – as I am not expert in the OpenShift domain – the OpenShift commands were done by [**luckyonesl**](https://github.com/luckyonesl) and shared with his approval – thank You for help.

FreeBSD Server ZFS/NFS Setup
==========

Latest FreeBSD 15.1-RELEASE was used for installation with **Auto (ZFS)** option. One can also use ready to download one of the FreeBSD [**VM-IMAGES**](https://download.freebsd.org/releases/VM-IMAGES/15.1-RELEASE/amd64/Latest/) that project also creates – in that case something ZFS based is needed. Just set the **root** password to something You will later use in the config. Using SSH keys instead of password is also possible. FreeBSD will use **10.0.0.9** IP address.

```
freebsd # echo "something+VERY-insecure-123" | pw usermod -n root -h 0

```

First create the ZFS dataset – as this is only for demonstration purposes I will just create **zroot/openshift** with **/zroot/openshift** as its mountpoint.

```
freebsd # zfs create -o mountpoint=/zroot/openshift zroot/openshift

```

As **/etc/rc.conf** is very basic – I will only focus on the NFS part here.

```
nfsv4_server_enable=YES
nfsv4_server_only=YES
mountd_enable=YES
nfs_server_enable=YES
nfs_server_flags="-t -n 64"
nfs_server_maxio=131072

```

The **/etc/exports** file for the NFS share. The hosts **10.0.0.10-13** are the nodes of OpenShift cluster.

```
V4: /            -sec=sys
/zroot/openshift -sec=sys -maproot=root 10.0.0.10 10.0.0.11 10.0.0.12 10.0.0.13

```

Now start the NFS server.

```
freebsd # service nfsd start

```

OpenShift Setup
==========

Next are the needed OpenShift commands which were done by [**luckyonesl**](https://github.com/luckyonesl) and shared with his approval as I am not that proficient in OpenShift.

One can use **privateKey:** instead of **password:** for more security – this is only for demonstration purposes.

Now the installation of [**Democratic CSI**](https://github.com/democratic-csi/democratic-csi) driver with **helm(8)** command.

```
openshift # cat /root/democratic-csi-install.yaml
image:
  repository: ghcr.io/democratic-csi/democratic-csi
  tag: v1.9.3
csiDriver:
  name: "org.democratic-csi.controller-zfs-generic"

controller:
  hostNetwork: true
  dnsPolicy: ClusterFirstWithHostNet

driver:
  config:
    logLevel: debug
    driver: zfs-generic-nfs
    sshConnection:
      host: 10.0.0.9
      port: 22
      username: root
      password: something+VERY-insecure-123
    zfs:
      cli:
        paths:
          zfs: /sbin/zfs
          zpool: /sbin/zpool
          sudo: /usr/local/bin/sudo     
      datasetParentName: "zroot/openshift"
      detachedSnapshots:
        enabled: false
      datasetPermissionsMode: "0777"
    nfs:
      shareStrategy: "setDatasetProperties"
      shareStrategySetDatasetProperties:
        properties:
          sharenfs: "on"
      shareHost: 10.0.0.9

storageClasses:
  - name: democratic-nfs
    defaultClass: false
    reclaimPolicy: Delete
    volumeBindingMode: Immediate
    allowVolumeExpansion: true

volumeSnapshotClasses:
  - name: democratic-nfs-snapshots
    parameters:
      detachedSnapshots:
        enabled: false

openshift # helm repo add democratic-csi https://democratic-csi.github.io/charts/

openshift # helm repo update

openshift # helm upgrade \
              --install democratic-csi democratic-csi/democratic-csi \
              -n democratic-csi \
              --create-namespace \
              -f /root/democratic-csi-install.yaml

```

Next check how the installation went.

```
openshift # oc get deployment,ds -n democratic-csi -o yaml | grep -iE 'hostNetwork'

openshift # oc get deployment,ds -n democratic-csi -o yaml | grep -iE 'hostNetwork|mountPropergation|privileged'

```

Sometimes additional polices/privileges are needed – so here are the commands for them.

```
openshift # oc adm policy add-scc-to-user privileged system:serviceaccount:democratic-csi:democratic-csi-controller-sa

openshift # oc adm policy add-scc-to-user privileged system:serviceaccount:democratic-csi:democratic-csi-node-ss

```

Tests on OpenShift
==========

Now the [**Democratic CSI**](https://github.com/democratic-csi/democratic-csi) driver seems to be installed – lets use it as storage for OpenShift containers and create some snapshot(s). First the YAML files that will be used.

```
openshift # cat /root/csi-snapshot-test.yaml
apiVersion: v1
kind: Namespace
metadata:
  name: csi-test
---
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: source-pvc
  namespace: csi-test
spec:
  storageClassName: democratic-nfs
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: writer
  namespace: csi-test
spec:
  replicas: 1
  selector:
    matchLabels:
      app: writer
  template:
    metadata:
      labels:
        app: writer
    spec:
      containers:
      - name: writer
        image: busybox:1.36
        command:
        - sh
        - -c
        - |
          mkdir -p /data
          echo "Hello from FreeBSD snapshot test." > /data/test.txt
          date >> /data/test.txt
          echo "Sleeping..."
          sleep 3600
        volumeMounts:
        - name: storage
          mountPath: /data
      volumes:
      - name: storage
        persistentVolumeClaim:
          claimName: source-pvc

openshift # cat /root/restore-pvc.yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: restored-pvc
  namespace: csi-test
spec:
  accessModes:
    - ReadWriteMany
  storageClassName: democratic-nfs
  resources:
    requests:
      storage: 1Gi
  dataSource:
    name: source-snapshot
    kind: VolumeSnapshot
    apiGroup: snapshot.storage.k8s.io

openshift # cat /root/restore-reader.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: restore-reader
  namespace: csi-test
spec:
  replicas: 1
  selector:
    matchLabels:
      app: restore-reader
  template:
    metadata:
      labels:
        app: restore-reader
    spec:
      containers:
      - name: shell
        image: alpine
        command:
        - /bin/sh
        - -c
        - sleep 3600
        volumeMounts:
        - name: data
          mountPath: /data
      volumes:
      - name: data
        persistentVolumeClaim:
          claimName: restored-pvc

openshift # cat /root/snapshot.yaml
apiVersion: snapshot.storage.k8s.io/v1
kind: VolumeSnapshot
metadata:
  name: source-snapshot
  namespace: csi-test
spec:
  volumeSnapshotClassName: democratic-nfs-snapshots
  source:
    persistentVolumeClaimName: source-pvc

```

… and now to messing with them.

```
openshift # oc apply -f /root/csi-snapshot-test.yaml

openshift # oc get pods -n csi-test

openshift # oc exec -n csi-test deploy/writer -- cat /data/test.txt

openshift # oc exec -n csi-test deploy/writer -- mount | grep /data

openshift # oc apply -f /root/snapshot.yaml

openshift # oc exec -n csi-test deploy/writer -- sh -c 'echo after-snapshot >> /data/test.txt'

openshift # oc get volumesnapshot -n csi-test -w

openshift # oc exec -n csi-test deploy/writer -- cat /data/test.txt

openshift # oc scale deployment -n csi-test writer --replicas=0

openshift # oc apply -f /root/restore-pvc.yaml

openshift # oc apply -f /root/restore-reader.yaml

openshift # oc exec -ti deployment/restore-reader -n csi-test  -- sh -c 'cat /data/test.txt'

openshift # oc exec -ti deployment/writer -n csi-test  -- sh -c 'cat /data/test.txt'

```

Sorry that I do not have output of the commands but it was some fast try to find out if and how it will work on FreeBSD …

Results on FreeBSD
==========

Now this is how the FreeBSD system changed within these OpenShift operations. Just after NFS server startup and before any of these OpenShift commands were executed the ZFS datasets and snapshots looked like that:

```
freebsd # zfs list -t all
NAME                 USED  AVAIL  REFER  MOUNTPOINT
zroot               20.3G  68.6G    96K  /zroot
zroot/ROOT          3.03G  68.6G    96K  none
zroot/ROOT/default  3.03G  68.6G  3.03G  /
zroot/home            96K  68.6G    96K  /home
zroot/openshift     15.4G  68.6G   112K  /zroot/openshift
zroot/snaps           96K  68.6G    96K  /zroot/snaps
zroot/tmp            128K  68.6G   128K  /tmp
zroot/usr           1.88G  68.6G    96K  /usr
zroot/usr/ports       96K  68.6G    96K  /usr/ports
zroot/usr/src       1.88G  68.6G  1.88G  /usr/src
zroot/var           1.41M  68.6G    96K  /var
zroot/var/audit       96K  68.6G    96K  /var/audit
zroot/var/crash      100K  68.6G   100K  /var/crash
zroot/var/log        880K  68.6G   880K  /var/log
zroot/var/mail       172K  68.6G   172K  /var/mail
zroot/var/tmp         96K  68.6G    96K  /var/tmp

```

Next – as OpenShift requested the storage new ZFS datasets have been created and also requested snapshots.

```
freebsd # zfs list -t all
NAME                                                                                                     USED  AVAIL  REFER  MOUNTPOINT
zroot                                                                                                   20.3G  68.6G    96K  /zroot
zroot/ROOT                                                                                              3.03G  68.6G    96K  none
zroot/ROOT/default                                                                                      3.03G  68.6G  3.03G  /
zroot/home                                                                                                96K  68.6G    96K  /home
zroot/openshift                                                                                         15.4G  68.6G   112K  /zroot/openshift
zroot/openshift/pvc-5455ae63-a585-4865-a875-50f53e936a87                                                  56K  68.6G   100K  /zroot/openshift/pvc-5455ae63-a585-4865-a875-50f53e936a87
zroot/openshift/pvc-de5515f3-8b0e-42ed-ba51-8ea7a347c815                                                15.4G  68.6G  15.4G  /zroot/openshift/pvc-de5515f3-8b0e-42ed-ba51-8ea7a347c815
zroot/openshift/pvc-de5515f3-8b0e-42ed-ba51-8ea7a347c815@snapshot-c96db74d-7ec2-420b-8fab-53a01119d4b7    68K      -   100K  -
zroot/openshift/pvc-de5515f3-8b0e-42ed-ba51-8ea7a347c815@snapshot-4d5582dd-7e34-411f-924c-163487ba6160    68K      -  9.77G  -
zroot/openshift/pvc-de5515f3-8b0e-42ed-ba51-8ea7a347c815@snapshot-1dc2ba05-668d-44dc-bd29-063600a85eaa    60K      -  25.2G  -
zroot/snaps                                                                                               96K  68.6G    96K  /zroot/snaps
zroot/tmp                                                                                                128K  68.6G   128K  /tmp
zroot/usr                                                                                               1.88G  68.6G    96K  /usr
zroot/usr/ports                                                                                           96K  68.6G    96K  /usr/ports
zroot/usr/src                                                                                           1.88G  68.6G  1.88G  /usr/src
zroot/var                                                                                               1.41M  68.6G    96K  /var
zroot/var/audit                                                                                           96K  68.6G    96K  /var/audit
zroot/var/crash                                                                                          100K  68.6G   100K  /var/crash
zroot/var/log                                                                                            880K  68.6G   880K  /var/log
zroot/var/mail                                                                                           172K  68.6G   172K  /var/mail
zroot/var/tmp                                                                                             96K  68.6G    96K  /var/tmp

freebsd # find /zroot/openshift
/zroot/openshift
/zroot/openshift/pvc-de5515f3-8b0e-42ed-ba51-8ea7a347c815
/zroot/openshift/pvc-de5515f3-8b0e-42ed-ba51-8ea7a347c815/test.txt
/zroot/openshift-5455ae63-a585-4865-a875-50f53e936a87
/zroot/openshift/pvc-5455ae63-a585-4865-a875-50f53e936a87/test.txt

```

Not sure what else I should add here – as the topic is still fresh I will update and maybe add more things when they come.

EOF