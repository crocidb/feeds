+++
title = "PHP patches released for two critical RCEs"
description = "The PHP project has published PHP versions 8.5.12, 8.4.27, 8.3.36 an"
date = "2026-10-21T13:53:18Z"
url = "https://lwn.net/Articles/1102014/"
author = "jzb"
text = ""
lastupdated = "2026-10-22T13:34:56.316374637Z"
seen = false
+++

The PHP project has [published](https://www.php.net/archive/2026.php#2026-10-21-5) PHP versions [8.5.12](https://www.php.net/archive/2026.php#2026-10-21-4), [8.4.27](https://www.php.net/archive/2026.php#2026-10-21-3), [8.3.36](https://www.php.net/archive/2026.php#2026-10-21-2) and [8.2.35](https://www.php.net/archive/2026.php#2026-10-21-1) to address two critical vulnerabilities that could allow unauthenticated remote code execution.

> **Who is at risk:** all PHP installations serving web requests, including PHP-FPM, Apache with mod\_php, php-cgi, FrankenPHP and LiteSpeed. We consider the risk highest for mod\_php, with a demonstrated exploit where an unauthenticated request can trigger the attack before any application code runs.
>
>
>
>
>
> **The vulnerabilities:**
>
>
>
> * **RCE via OOM corruption**, CVE-2026-109618 ([GHSA-w8hw-w9fx-j79w](https://github.com/php/php-src/security/advisories/GHSA-w8hw-w9fx-j79w)): out-of-memory handling can interrupt PHP while internal request data is only partially initialized. Request cleanup may then treat the invalid data as valid.
> * **RCE via stale global state**, CVE-2026-109619 ([GHSA-6wmf-4rv5-p3rp](https://github.com/php/php-src/security/advisories/GHSA-6wmf-4rv5-p3rp)): request-owned internal state can survive after its backing memory has been freed. A later request handled by the same worker may use that stale state before normal initialization resets it.
>
>

PHP versions older than 8.1 will not receive updates from the project, though the project has provided some patches for [PHP 7.4](https://github.com/php/php-src/tree/PHP-7.4-CVE-2026-109618-109619), [PHP 8.0](https://github.com/php/php-src/tree/PHP-8.0-CVE-2026-109618-109619), and [PHP 8.1](https://github.com/php/php-src/tree/PHP-8.1-CVE-2026-109618-109619) to assist in creating backports. According to the announcement, Linux distributions and vendors received patches in advance, so updated packages should be coming soon.