+++
title = "Testing org.kde.Platform flatpak built in CI"
description = "Very technical post, feel free to ignore if you're not working on KDE stuff.Since I'm on KDE Linux, I use flatpak apps for pretty much everything, such as Kontact suite. I wanted to test out how my Breeze changes would look like in KMail and other apps, but I didn't want to build"
date = "2026-04-09T20:53:56Z"
url = "https://akselmo.dev/posts/flatpak-kdeplatform-ci/"
author = "Akseli"
text = ""
lastupdated = "2026-05-27T23:22:56.979439977Z"
seen = true
+++

Very technical post, feel free to ignore if you're not working on KDE stuff.

Since I'm on KDE Linux, I use flatpak apps for pretty much everything, such as Kontact suite. I wanted to test out how my Breeze changes would look like in KMail and other apps, but I didn't want to build the whole PIM stack.

Here's how I tested it by building the flatpak-kde-runtime in CI, downloading the built files and using it as a repository for testing any changes to `org.kde.Platform` locally.

1. First make changes to the flatpak-kde-runtime, such as this here: [https://invent.kde.org/packaging/flatpak-kde-runtime/-/commits/work%2Fakselmo%2Ftest-breeze](https://invent.kde.org/packaging/flatpak-kde-runtime/-/commits/work/akselmo/test-breeze)
2. Run the CI
3. Check the pipeline ID for `build-runtime-amd64`
   * Click the green checkmark, its something like `#1210828`

4. Download the artifact from here: [https://storage.kde.org/ci-artifacts/packaging/flatpak-kde-runtime/p/PIPELINE\_ID\_HERE/repository-x86\_64.tar.gz](https://storage.kde.org/ci-artifacts/packaging/flatpak-kde-runtime/p/PIPELINE_ID_HERE/repository-x86_64.tar.gz)
5. Extract the tar into some folder after downloading
6. Add it as a repository: `flatpak remote-add --no-gpg-verify kde-platform-testing ./repo-x86_64`
7. Uninstall the current platform: `flatpak uninstall org.kde.Platform --force-remove`
   * The force-remove makes sure we do not install any apps, just the platform

8. Run `flatpak install org.kde.Platform`
9. Select the `kde-platform-testing` as the repo to install from
10. Done!

Now any app that uses the version of platform (6.10 in my example) will utilize your custom built one.

[](https://brid.gy/publish/mastodon)