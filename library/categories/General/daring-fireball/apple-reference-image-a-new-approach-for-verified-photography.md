+++
title = "‘Apple Reference Image: A New Approach for Verified Photography’"
description = "Apple Security Research has released a concise, cogent paper describing how Apple Reference Image works, and why they made it. A terrific read. Here’s just one fascinating bit regarding privacy:Other industry solutions require a photographer or institution to vouch for an ima"
date = "2026-09-16T02:38:24Z"
url = "https://security.apple.com/blog/apple-reference-image/"
author = "John Gruber"
text = ""
lastupdated = "2026-09-21T09:42:41.884374736Z"
seen = false
+++

Apple Security Research has released a concise, cogent paper describing how Apple Reference Image works, and why they made it. A terrific read. Here’s just one fascinating bit regarding privacy:

>
>
> Other industry solutions require a photographer or institution to vouch for an image using their own credentials. We are concerned this puts some photographers, such as those operating in conflict zones, in a difficult position; it should not be necessary to forgo anonymity in order to prove image authenticity. We built Apple Reference Image to avoid using an explicit, public credential for photographers, and to avoid even implicit public association between different photos taken by the same sensor. The final reference image is instead signed by Apple’s signing service, after validation by PCC. That signature is backed by Apple’s strongest technical guarantees.
>
>
>
> Our implementation also protects the confidentiality of the image itself, including from Apple. Merely capturing a reference image should never expose the actual pixels to Apple or anyone else. We achieve this through the exceptional privacy properties of PCC — the nodes themselves are architected so that not even Apple can access image data, just as Apple cannot see the information processed for Apple Intelligence in PCC. While the revocation service must maintain a private record of photo GUIDs and associated sensors to allow for revocation, it never has access to the image data, and does not allow for public access to this record. And as final revocation checks occur using on-device lists, a device never reveals to anyone which photo it’s looking at in order to find out whether it’s still valid.
>
>

[ ★ ](https://daringfireball.net/linked/2026/09/15/apple-reference-image)