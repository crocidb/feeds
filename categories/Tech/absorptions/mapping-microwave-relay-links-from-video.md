---
title = "Mapping microwave relay links from video"
description = "Radio networks are often at least partially based on microwave relay links. They're those little mushroom-like appendices growing out of cell towers and building-mounted base stations. Technically, they"
date = "2014-07-14T13:05:00.002Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-2006790626506027838"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.914766266Z"
seen = true
---

Radio networks are often at least partially based on [microwave relay links](https://en.wikipedia.org/wiki/Microwave_transmission#Microwave_radio_relay). They're those little mushroom-like appendices growing out of cell towers and building-mounted base stations. Technically, they're carefully directed dish antennas linking such towers together over a line-of-sight connection. I'm collecting a little map of nearby link stations, trying to find out how they're interconnected and which network they belong to.

### Circling around ###

We can find a rough direction for any link antenna by approximating a tangent for the dish shroud surface from position-stamped video footage taken while circling the tower. Optimally we would have a drone make a full circle around the tower at a constant distance and elevation to map all antennas at once; but if our DJI Phantom has run out of battery, a GPS positioned still camera at ground level will also do.

[![[Image: Five photos of the same directional microwave antenna, taken from different angles, and edge-detection and elliptical Hough transform results from each one, with a large and small circle for all ellipses.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEht212L91KY_9TT2hZspfeS6LE70CXC2KxPCK56Y7HVyFJmOw7QYNEKJaIVQ4XR_qggDXRS2ufY_WjMYp_A7qIxwKSjCF6A_HwMi0CmR2KRSDKVxL2zOmySCabC0qorKIKLeyMMQfWn6K71/s480/linkitylink.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEht212L91KY_9TT2hZspfeS6LE70CXC2KxPCK56Y7HVyFJmOw7QYNEKJaIVQ4XR_qggDXRS2ufY_WjMYp_A7qIxwKSjCF6A_HwMi0CmR2KRSDKVxL2zOmySCabC0qorKIKLeyMMQfWn6K71/s1600/linkitylink.png)

The rest can be done manually, or using Hough transform and centroid calculation from OpenCV. In these pictures, the ratio of the diameters of the concentric circles is a sinusoid function of the angle between the antenna direction and the camera direction. At its maximum, we're looking straight at the beam. (The ratio won't max out at unity in this case, because we're looking at the antenna slightly from below.) We can select the frame with the maximum ratio from high-speed footage, or we can interpolate a smooth sinusoid to get an even better value.

[![[Image: Diagram showing how the ratio of the diameters of the large and small circle is proportional to the angle of the antenna in relation to the camera.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjBWQ8ZWP0iIFBS6javYIrLqtpiyKlWCRq-FPdN6myGibuaV_ntX2dkDqct5k_6dCNbObsskvlBLkaivN1oKYj9KBN6_mb65fPZvKDxShcvj6BgK0lrPUVt1ebQ8mw1KP2mV1qHyBdb-aY-/s400/dish.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjBWQ8ZWP0iIFBS6javYIrLqtpiyKlWCRq-FPdN6myGibuaV_ntX2dkDqct5k_6dCNbObsskvlBLkaivN1oKYj9KBN6_mb65fPZvKDxShcvj6BgK0lrPUVt1ebQ8mw1KP2mV1qHyBdb-aY-/s1600/dish.png)

This particular antenna is pointing west-northwest with an azimuth of 290°.

### What about distance? ###

Because of the line-of-sight requirement, we also know the maximum possible distance to the linked tower, using the formula 7140 × √(4 / 3 × h) where h is the height of the antenna from ground. If the beam happens to hit a previously mapped tower closer than this distance, we can assume they're connected!

This antenna is communicating to a tower not further away than 48 km. Judging from the building it's standing on, it belongs to a government trunked radio network.