+++
title = "You gotta think outside the hypercube"
description = "A closer look at the tesseract and the ways we can render it on the screen."
date = "2026-01-26T23:05:38Z"
url = "https://lcamtuf.substack.com/p/you-gotta-think-outside-the-hypercube"
author = "lcamtuf"
text = ""
lastupdated = "2026-02-11T20:17:01.296853276Z"
seen = false
+++

If you’re a nerd, you probably have encountered visualizations of a *tesseract:* a four-dimensional equivalent of a cube. Heck, various representations of the shape have made it into blockbuster sci-fi films, music videos, and more.

What might be harder to grasp is what these images mean or how they’re generated. You can find a handful of tesseract rendering demos on GitHub, but they all take different approaches, produce different results, and don’t really explain what’s going on.

In this article, we’ll take a look at the hypercube from first principles — and then, figure out how to map this beast to a computer screen.

### It’s hip to be square ###

To build a mathematical model of the hypercube, let’s start with a square. If we get it right, our approach will generalize to three dimensions and produce a cube; if it does, it ought to extend to the hyperspace too.

More specifically, we’ll try to model the *edges* of a square — i.e., the line segments that connect the vertices in the four corners. For our purposes, a see-through wireframe model will work better than a solid.

For a 2D square with dimensions *a×a*, the horizontal edges can be described as a collection of points that satisfy two criteria:

In essence, we’re saying that we want to include points for which the *y* coordinate is equal to either *-a* (the lower edge) or *+a* (the upper edge); and where the *x* coordinate spans anywhere between *-a* and *+a*:

[

<img src="https://substackcdn.com/image/fetch/$s_!alK2!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbb299481-ef67-4d13-baca-b0344fd8ce57_2000x1111.jpeg" width="1456" height="809" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/bb299481-ef67-4d13-baca-b0344fd8ce57_2000x1111.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:809,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:730300,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/185802725?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbb299481-ef67-4d13-baca-b0344fd8ce57_2000x1111.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!alK2!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbb299481-ef67-4d13-baca-b0344fd8ce57_2000x1111.jpeg 424w, https://substackcdn.com/image/fetch/$s_!alK2!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbb299481-ef67-4d13-baca-b0344fd8ce57_2000x1111.jpeg 848w, https://substackcdn.com/image/fetch/$s_!alK2!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbb299481-ef67-4d13-baca-b0344fd8ce57_2000x1111.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!alK2!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fbb299481-ef67-4d13-baca-b0344fd8ce57_2000x1111.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!alK2!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/bb299481-ef67-4d13-baca-b0344fd8ce57_2000x1111.jpeg)*One half of a square.*

To construct the remaining vertical edges, we can just flip the criteria around, constraining *x* to one of two values and allowing *y* to span a range. This nets us the following combined formula:

The method is easy to generalize to a cube. We start by constructing a rectangle in the *x-y* plane using the earlier approach, except we add a third modulo constraint so that we end up with two images at the *-a* and *+a* offsets in the *z* axis:

What’s still missing are four edges oriented in the *z* direction that connect the corresponding corners of the two squares. We can add this with a third rule:

Note that each of these rules produces four line segments because there 2<sup>2 </sup>possible combinations for the coordinates constrained by the equality relationship. For example, for horizontal lines, we can have the following pairs of *y* and *z* values: (*-a, -a)*, (*-a, +a)*, (*+a, -a)*, and (*+a, +a)*.

From here, the extension to the fourth dimension should be clear. I’m going to sensibly label the dimension 🌀; with this done, we just add a fourth constraint to each of the existing 3D rules and then add connecting segments in the fourth dimension:

This time around, each rule nets us 2<sup>3 </sup>= 8 line segments, so the tesseract has 4·8 = 32 edges. These edges connect 16 vertices.

### Defining rotations ###

Most visualization of the tesseract spin the figure around. This allows the shape to be examined from different angles and makes for some mind-bending visuals. But what does it mean to rotate an object in 4D?

In a two-dimensional space, there’s only one type of rotation; it transposes coordinates in the XY plane. The following demonstrates the effect of rotating a point originally placed on the *x* axis around the center of the coordinate system:

[

<img src="https://substackcdn.com/image/fetch/$s_!TRvf!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5086b2ef-7009-4fdd-a620-da86a71bfac1_2000x1300.jpeg" width="1456" height="946" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/5086b2ef-7009-4fdd-a620-da86a71bfac1_2000x1300.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:946,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:836146,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/185802725?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5086b2ef-7009-4fdd-a620-da86a71bfac1_2000x1300.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!TRvf!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5086b2ef-7009-4fdd-a620-da86a71bfac1_2000x1300.jpeg 424w, https://substackcdn.com/image/fetch/$s_!TRvf!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5086b2ef-7009-4fdd-a620-da86a71bfac1_2000x1300.jpeg 848w, https://substackcdn.com/image/fetch/$s_!TRvf!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5086b2ef-7009-4fdd-a620-da86a71bfac1_2000x1300.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!TRvf!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F5086b2ef-7009-4fdd-a620-da86a71bfac1_2000x1300.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!TRvf!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/5086b2ef-7009-4fdd-a620-da86a71bfac1_2000x1300.jpeg)*The trigonometric solution to the simplest case of XY rotation.*

From basic trigonometry, the new *x* coordinate of the rotated point is the adjacent of a right triangle with an angle *α* and a hypotenuse of *x<sub>orig</sub>*. The new *y* is the opposite of that same triangle. If we want to start with a non-zero *y* coordinate for the point, we need add a small tweak:

In three dimensions, we have a lot more freedom. We can obviously spin things around in the XY plane (around the *z* axis), XZ (around *y*), or in YZ (around *x*). It is also possible to dream up more complex rotations that touch all three coordinates at once, but they don’t add much value. They can be deconstructed into a sequence of planar rotations in XY, XZ, and YZ.

Given this observation, in four dimensions, we should probably still stick to the primitive of planar rotations that modify just two axes at a time. The only difference is that we get additional X🌀, Y🌀, and Z🌀 planes to use.

For ease of viewing and for consistency with 3D models, we’ll focus on spinning things in the XZ plane — a “turntable” animation:

That said, we’ll also pay a brief visit the Z🌀 rotation plane. It plays by similar rules:

### Projecting 4D to 2D ###

Our next challenge is figuring out how to project four-dimensional coordinates onto a two-dimensional drawing surface, such as a computer screen.

In standard geometries, Cartesian axes are orthogonal to each other — that is, there is a 90° rotation that can take you between any two dimensions. On a two-dimensional surface, we can only pull this off with two axes; that said, there are several imperfect ways to make do.

#### Cavalier projection ####

If we were to ask a random person to come up with a 3D-to-2D projection on the spot, they would probably suggest drawing the *z* axis as a diagonal line on a 2D plane, as shown below:

[

<img src="https://substackcdn.com/image/fetch/$s_!9iRJ!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fde4d7fcc-2d16-4081-83d4-bd779a54a9f1_2000x1300.jpeg" width="1456" height="946" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/de4d7fcc-2d16-4081-83d4-bd779a54a9f1_2000x1300.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:946,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:881500,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/185802725?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fde4d7fcc-2d16-4081-83d4-bd779a54a9f1_2000x1300.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!9iRJ!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fde4d7fcc-2d16-4081-83d4-bd779a54a9f1_2000x1300.jpeg 424w, https://substackcdn.com/image/fetch/$s_!9iRJ!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fde4d7fcc-2d16-4081-83d4-bd779a54a9f1_2000x1300.jpeg 848w, https://substackcdn.com/image/fetch/$s_!9iRJ!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fde4d7fcc-2d16-4081-83d4-bd779a54a9f1_2000x1300.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!9iRJ!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2Fde4d7fcc-2d16-4081-83d4-bd779a54a9f1_2000x1300.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!9iRJ!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/de4d7fcc-2d16-4081-83d4-bd779a54a9f1_2000x1300.jpeg)*The cavalier projection.*

To convert the model-space *z* value to screen coordinates, we can use trigonometry to project the component onto the real *x* and *y* axes:

Alas, if you attempt this projection with a regular three-dimensional cube, you will immediately notice that it looks off:

[

<img src="https://substackcdn.com/image/fetch/$s_!rzAm!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F876874d9-f4be-43e2-b5f4-7b92f47c83be_1080x1080.png" width="1080" height="1080" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/876874d9-f4be-43e2-b5f4-7b92f47c83be_1080x1080.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1080,&quot;width&quot;:1080,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:61339,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/185802725?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F876874d9-f4be-43e2-b5f4-7b92f47c83be_1080x1080.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!rzAm!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F876874d9-f4be-43e2-b5f4-7b92f47c83be_1080x1080.png 424w, https://substackcdn.com/image/fetch/$s_!rzAm!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F876874d9-f4be-43e2-b5f4-7b92f47c83be_1080x1080.png 848w, https://substackcdn.com/image/fetch/$s_!rzAm!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F876874d9-f4be-43e2-b5f4-7b92f47c83be_1080x1080.png 1272w, https://substackcdn.com/image/fetch/$s_!rzAm!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F876874d9-f4be-43e2-b5f4-7b92f47c83be_1080x1080.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!rzAm!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/876874d9-f4be-43e2-b5f4-7b92f47c83be_1080x1080.png)*The problem with cavalier.*

The viewer-facing edges in the XY plane are exactly the same length as the *z* edge; nevertheless, it’s hard to shake the impression that the dimensions are off and the cube is stretched.

#### Cabinet projection ####

To address this issue, we need to shorten the projected *z*-axis edges, crudely approximating the length contraction that we expect in real life. To do this, we divide the *z* component by an ad hoc scaling factor, typically 2:

The cabinet projection is ubiquitous in informal sketches and technical drawings, and it does look good at first blush. That said, consider the following video of a cube that is rotated in the XZ plane:

<iframe src="https://player.vimeo.com/video/1158291426?autoplay=0&amp;h=ceb514aba6" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

Note that the shape looks OK at first, but then gets weirdly squished near the rotation angle of 70°; this is because the projection gives us incorrect visual cues that the shape is facing us — the back edges are tucked squarely behind while in reality, the shape is still at an angle in relation to the viewer.

The root of the problem is that the axes are not oriented in a way that would be possible in real life. If we constructed a model of 3D axes out of sticks, the only way for the *z* axis to appear at a 45° angle — or indeed, to be visible at all — is if at least one of the other axes is not parallel to the camera plane*:*

[

<img src="https://substackcdn.com/image/fetch/$s_!uwHh!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F026f5fbe-cbcd-424c-a6e6-4cc9a1e50239_2000x1281.jpeg" width="1456" height="933" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/026f5fbe-cbcd-424c-a6e6-4cc9a1e50239_2000x1281.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:933,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:418439,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/185802725?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F026f5fbe-cbcd-424c-a6e6-4cc9a1e50239_2000x1281.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!uwHh!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F026f5fbe-cbcd-424c-a6e6-4cc9a1e50239_2000x1281.jpeg 424w, https://substackcdn.com/image/fetch/$s_!uwHh!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F026f5fbe-cbcd-424c-a6e6-4cc9a1e50239_2000x1281.jpeg 848w, https://substackcdn.com/image/fetch/$s_!uwHh!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F026f5fbe-cbcd-424c-a6e6-4cc9a1e50239_2000x1281.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!uwHh!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F026f5fbe-cbcd-424c-a6e6-4cc9a1e50239_2000x1281.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!uwHh!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/026f5fbe-cbcd-424c-a6e6-4cc9a1e50239_2000x1281.jpeg)*An issue with the cabinet projection.*

#### Isometric projection ####

This brings us to the isometric projection — a physically-plausible arrangement that places the model axes 60° apart:

[

<img src="https://substackcdn.com/image/fetch/$s_!tEXA!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F19fdb5e5-3e55-438f-8ba8-e56998cad6ba_2000x1264.jpeg" width="1456" height="920" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/19fdb5e5-3e55-438f-8ba8-e56998cad6ba_2000x1264.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:920,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:842278,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/185802725?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F19fdb5e5-3e55-438f-8ba8-e56998cad6ba_2000x1264.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!tEXA!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F19fdb5e5-3e55-438f-8ba8-e56998cad6ba_2000x1264.jpeg 424w, https://substackcdn.com/image/fetch/$s_!tEXA!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F19fdb5e5-3e55-438f-8ba8-e56998cad6ba_2000x1264.jpeg 848w, https://substackcdn.com/image/fetch/$s_!tEXA!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F19fdb5e5-3e55-438f-8ba8-e56998cad6ba_2000x1264.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!tEXA!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F19fdb5e5-3e55-438f-8ba8-e56998cad6ba_2000x1264.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!tEXA!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/19fdb5e5-3e55-438f-8ba8-e56998cad6ba_2000x1264.jpeg)*One of the possible isometric views.*

The math for this projection is still simple. The screen *x* coordinate is dictated by model *x* multiplied by *cos(*30°*)* — that’s the angle between the model *x* axis and the real one. The value is also influenced in the same way but with an opposite sign by the model *z* axis, so we get:

Meanwhile, on the *y* side, we need to account for the projected sine component of *x* and *z:*

Both cosine expressions can be further divided by √2 if the goal is to match the model- and screen-lengths of a horizontal line drawn in the model XY plane and then rotated by 45° around the *y* axis. That said, it’s seldom a necessity.

The following video shows a cube rotated in the XZ plane in an isometric projection:

<iframe src="https://player.vimeo.com/video/1158291473?autoplay=0&amp;h=63977fe203" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

This looks great and it seems natural to extend the scheme to four dimensions simply by cramming another axis, giving us a progression of *x, y, z,* and 🌀 axes spaced 45° apart:

[

<img src="https://substackcdn.com/image/fetch/$s_!xkVm!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F823c4b22-c1d4-4a11-9625-bf4ea63cc9ec_2000x1300.jpeg" width="1456" height="946" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/823c4b22-c1d4-4a11-9625-bf4ea63cc9ec_2000x1300.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:946,&quot;width&quot;:1456,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:874444,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/185802725?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F823c4b22-c1d4-4a11-9625-bf4ea63cc9ec_2000x1300.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!xkVm!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F823c4b22-c1d4-4a11-9625-bf4ea63cc9ec_2000x1300.jpeg 424w, https://substackcdn.com/image/fetch/$s_!xkVm!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F823c4b22-c1d4-4a11-9625-bf4ea63cc9ec_2000x1300.jpeg 848w, https://substackcdn.com/image/fetch/$s_!xkVm!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F823c4b22-c1d4-4a11-9625-bf4ea63cc9ec_2000x1300.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!xkVm!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F823c4b22-c1d4-4a11-9625-bf4ea63cc9ec_2000x1300.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!xkVm!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/823c4b22-c1d4-4a11-9625-bf4ea63cc9ec_2000x1300.jpeg)*An extension of isometric projection to 4D?*

Yet, some readers might notice that with this modification, we’re back to the earlier “cavalier” scenario: our *x, y,* and *z* axes are now separated by an impossible angle of 45°. In other words, the projection should give us *something*, but it will distort some 3D shapes in undesirable ways.

Still, let’s keep going. In the new model, we calculate screen *x* as:

The projected model *y* axis is orthogonal to to screen *x*, so it doesn’t appear in this formula. As for the *y* coordinate, we need:

As before, since the projected model 🌀 axis is orthogonal to screen *y*, it doesn’t appear in the second equation.

Let’s put this projection to real use. Here’s the video of a tesseract rotating in the XZ plane:

<iframe src="https://player.vimeo.com/video/1158291528?autoplay=0&amp;h=88cd7a1c9c" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

It looks pretty, but it isn’t particularly informative: the projection makes the object change shape in ways that seem difficult to parse. The shape appears to be intersecting itself, but it’s hard to pinpoint what’s what.

#### Rectilinear one-point perspective ####

A simpler but surprisingly powerful projection method is to keep model *x* and *y* in the same plane as the screen, but divide the values of these coordinates in proportion to the distance in *z*. This produces a familiar vanishing-point perspective:

<iframe src="https://player.vimeo.com/video/1158291581?autoplay=0&amp;h=a3b67bb275" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

A fairly natural extension of this technique to the fourth dimension is to divide the *x* and *y* coordinates twice: first by a *z-*dependent factor and then by a 🌀-dependent one. This nets probably the most recognizable visualization of a tesseract:

<iframe src="https://player.vimeo.com/video/1158291610?autoplay=0&amp;h=6ac04381ba" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

If you want food for thought, consider the real-world appearance of a wireframe 3D cube when its shadow from a nearby overhead light is cast onto a 2D surface:

[

<img src="https://substackcdn.com/image/fetch/$s_!Punz!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F73d9c28a-f287-4b29-abc2-40d701fcdf60_1409x1012.jpeg" width="1409" height="1012" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/73d9c28a-f287-4b29-abc2-40d701fcdf60_1409x1012.jpeg&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1012,&quot;width&quot;:1409,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:243045,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/jpeg&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/185802725?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F73d9c28a-f287-4b29-abc2-40d701fcdf60_1409x1012.jpeg&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!Punz!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F73d9c28a-f287-4b29-abc2-40d701fcdf60_1409x1012.jpeg 424w, https://substackcdn.com/image/fetch/$s_!Punz!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F73d9c28a-f287-4b29-abc2-40d701fcdf60_1409x1012.jpeg 848w, https://substackcdn.com/image/fetch/$s_!Punz!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F73d9c28a-f287-4b29-abc2-40d701fcdf60_1409x1012.jpeg 1272w, https://substackcdn.com/image/fetch/$s_!Punz!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F73d9c28a-f287-4b29-abc2-40d701fcdf60_1409x1012.jpeg 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!Punz!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/73d9c28a-f287-4b29-abc2-40d701fcdf60_1409x1012.jpeg)*It’s deja vu all over again.*

This both helps make some sense of the nested-cube visualization of the tesseract, and signals that our algorithm is directionally correct. That said, the approach we’ve taken is also a bit of a cop-out: by commingling model *z* and 🌀, we make these dimensions indistinguishable.

#### Fisheye perspective ####

At first blush, the tesseract visualization might look just like two nested 3D cubes connected in the corners. To reduce edge overlaps and better hint at the underlying shenanigans, we can switch to a curvilinear “fisheye” perspective, reminiscent of what you can see through a peephole or other low-quality, wide-angle lens. In this approach, point coordinates are reduced based on their Euclidean distance from a single reference point representing the camera. For a regular cube, we get:

<iframe src="https://player.vimeo.com/video/1158291659?autoplay=0&amp;h=753a9d265a" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

But of course, we’re here to look at the tesseract:

<iframe src="https://player.vimeo.com/video/1158291705?autoplay=0&amp;h=28175f8114" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

The shading and the drawing order of the points is decided by the Euclidean distance to the viewing plane; this allows us to spot that the edges of the smaller, “inner” cube appear to pass behind the edges of the larger one:

[

<img src="https://substackcdn.com/image/fetch/$s_!ngOa!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F925bb8c4-fbbc-4661-9bfb-ce76d7bce0ce_1080x1080.png" width="1080" height="1080" data-attrs="{&quot;src&quot;:&quot;https://substack-post-media.s3.amazonaws.com/public/images/925bb8c4-fbbc-4661-9bfb-ce76d7bce0ce_1080x1080.png&quot;,&quot;srcNoWatermark&quot;:null,&quot;fullscreen&quot;:null,&quot;imageSize&quot;:null,&quot;height&quot;:1080,&quot;width&quot;:1080,&quot;resizeWidth&quot;:null,&quot;bytes&quot;:109231,&quot;alt&quot;:null,&quot;title&quot;:null,&quot;type&quot;:&quot;image/png&quot;,&quot;href&quot;:null,&quot;belowTheFold&quot;:true,&quot;topImage&quot;:false,&quot;internalRedirect&quot;:&quot;https://lcamtuf.substack.com/i/185802725?img=https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F925bb8c4-fbbc-4661-9bfb-ce76d7bce0ce_1080x1080.png&quot;,&quot;isProcessing&quot;:false,&quot;align&quot;:null,&quot;offset&quot;:false}" class="sizing-normal" alt="" srcset="https://substackcdn.com/image/fetch/$s_!ngOa!,w_424,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F925bb8c4-fbbc-4661-9bfb-ce76d7bce0ce_1080x1080.png 424w, https://substackcdn.com/image/fetch/$s_!ngOa!,w_848,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F925bb8c4-fbbc-4661-9bfb-ce76d7bce0ce_1080x1080.png 848w, https://substackcdn.com/image/fetch/$s_!ngOa!,w_1272,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F925bb8c4-fbbc-4661-9bfb-ce76d7bce0ce_1080x1080.png 1272w, https://substackcdn.com/image/fetch/$s_!ngOa!,w_1456,c_limit,f_auto,q_auto:good,fl_progressive:steep/https%3A%2F%2Fsubstack-post-media.s3.amazonaws.com%2Fpublic%2Fimages%2F925bb8c4-fbbc-4661-9bfb-ce76d7bce0ce_1080x1080.png 1456w" sizes="100vw" loading="lazy">

](https://substackcdn.com/image/fetch/$s_!ngOa!,f_auto,q_auto:good,fl_progressive:steep/https://substack-post-media.s3.amazonaws.com/public/images/925bb8c4-fbbc-4661-9bfb-ce76d7bce0ce_1080x1080.png)*Could it be…?*

Still, as noted earlier, the disappointing part of the mapping is that it commingles two dimensions; can we distinguish them better without ending up with a visual disaster?

#### Mixed isometric + vanishing point ####

Sort of?… Instead of trying to come up with a single projection for all four axes, we could always use a conventional isometric view for *x, y,* and *z,* and then use the vanishing-point approach to represent 🌀.

The result is a remarkably stable and easy-to-parse view of the tesseract when rotated in the YZ plane:

<iframe src="https://player.vimeo.com/video/1158291772?autoplay=0&amp;h=5b50aae66c" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

This also brings us to a somewhat less-correct rendering of the hypercube spinning in the *Z*🌀 plane that can be found on Wikipedia and in some YouTube videos. If we change screen depth calculations to only account for the *z* coordinate (i.e., completely ignore model 🌀), we obtain the following:

<iframe src="https://player.vimeo.com/video/1158333836?autoplay=0&amp;h=68d61f648c" frameborder="0" gesture="media" allow="autoplay; fullscreen" allowautoplay="true" allowfullscreen="true" loading="lazy"></iframe>

If you squint your eyes, this appears to show the tesseract passing through itself back-to-front as it rotates in the fourth dimension. I altered the proportions of the projection to make the effect easier to see.

[Subscribe now](https://lcamtuf.substack.com/subscribe?)

*👉 For more weird math, [click here](https://lcamtuf.substack.com/p/algorithms-and-math-trivia).*