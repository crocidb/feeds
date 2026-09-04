+++
title = "SindriCAD"
description = '<img src="/space/apps/sindricad/large.jpg?v=c3b228e850e3" alt="SindriCAD displaying a multi-material parametric model" width="1280" height="720"SindriCAD displaying a multi-material parametric model[SindriCAD](https://github.com/MakerViking/sindricad?utm_campaign=unsolicited_tra'
date = "2026-08-03T07:48:00Z"
url = "https://taoofmac.com/space/apps/sindricad?utm_content=atom"
author = "Rui Carmo"
text = ""
lastupdated = "2026-08-06T09:52:38.183161648Z"
seen = false
+++

<img src="/space/apps/sindricad/large.jpg?v=c3b228e850e3" alt="SindriCAD displaying a multi-material parametric model" width="1280" height="720">SindriCAD displaying a multi-material parametric model

[SindriCAD](https://github.com/MakerViking/sindricad?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) is an AGPL-licensed, history-based parametric CAD application aimed squarely at 3D printing. It runs on Linux, Windows and macOS, wrapping [build123d](https://github.com/gumyr/build123d?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) and OpenCASCADE in a [Tauri](https://tauri.app?utm_campaign=unsolicited_traffic&utm_medium=web&utm_source=taoofmac.com) desktop UI with constraint-based sketches, editable feature trees, expressions, direct editing and the usual solid-modelling operations.

It imports STEP, BREP, STL, 3MF, OBJ and GLB, and exports STEP, STL, 3MF and GLB. The bit that caught my eye is its integrated [Snapmaker U1](/space/com/snapmaker/u1) workflow, which can hand multi-material models to OrcaSlicer and send the resulting G-code to the printer over the LAN.

The project is still a rolling beta and its authors explicitly warn about rough edges and document compatibility, but it already has packaged releases for all three desktop platforms and looks like an interesting alternative to the usual open-source CAD suspects.