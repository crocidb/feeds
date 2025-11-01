---
title = "Animated line drawings with OpenCV"
description = "OpenCV is a pretty versatile C++ computer vision library. Because I use it every day it has also become my go-to tool for creating simple animations at pixel level, for fun, and saving them as video files. This is not one of its core functions but happens to be possible using its"
date = "2017-12-30T12:15:00.003Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-5809977339825271577"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.884118311Z"
seen = true
---

OpenCV is a pretty versatile C++ computer vision library. Because I use it every day it has also become my go-to tool for creating simple animations at pixel level, for fun, and saving them as video files. This is not one of its core functions but happens to be possible using its GUI drawing tools.

Below we'll take a look at some video art I wrote for a music project. It goes a bit further than just line drawings but the rest is pretty much just flavouring. As you'll see, creating images in OpenCV has a lot in common with how you would work with layers and filters in an image editor like GIMP or Photoshop.

### Setting it up ###

It doesn't take a lot of boilerplate to initialize an OpenCV project. Here's my minimal CMakeLists.txt:

```
cmake_minimum_required (VERSION 2.8)
project                (marmalade)
find_package           (OpenCV REQUIRED)
add_executable         (marmalade marmalade.cc)
target_link_libraries  (marmalade ${OpenCV_LIBS})
```

I also like to set compiler flags to enforce the C++11 standard, but this is not necessary.

In the main .cc file I have:

```
#include "opencv2/imgproc/imgproc.hpp"
#include "opencv2/highgui/highgui.hpp"
```

Now you can build the project by just typing cmake . && make in the terminal.

### Basic shapes ###

First, we'll need an empty canvas. It will be a matrix (cv::Mat) with three unsigned char channels for RGB at Full HD resolution:

```
const cv::Size video_size(1920, 1080);
cv::Mat mat_frame = cv::Mat::zeros(video_size, CV_8UC3);
```

This will also initialize everything to zero, i.e. black.

Now we can draw our graphics!

I had an initial idea of an endless cascade of concentric rings each rotating at a different speed. There might be color and brightness variations as well but otherwise it would stay static the whole time. You can't see a circle's rotation around its center, so we'll add some features to them as well, maybe some kind of bars or spokes.

A simplified render method for a ring would look like this:

```
void Ring::RenderTo(cv::Mat& mat_output) const {
  cv::circle(mat_output, 8 * center_, 8 * radius_, color_, 1, CV_AA, 3);
  for (const Bar& bar : bars()) {
    cv::line(mat_output, 8 * (center_ + bar.start), 8 * (center_ + bar.end),
             color_, 1, CV_AA, 3);
  }
}
```

Drawing antialiased graphics at subpixel coordinates can make for some confusing OpenCV code. Here, all coordinates are multiplied by the magic number 8 and the drawing functions are instructed to do a bit shift of 3 bits (2^3 == 8). These three bits are used for the decimal part of the subpixel position.

The coordinates of the bars are generated for each frame based on the ring's current rotation angle.

Here are some rings at different phases of rotation. A bug leaves the innermost circle with no spokes, but it kind of looks better that way.

[![[Image: White concentric circles on a black background, with evenly separated lines connecting them.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEicIPnEytmyXedVbulIXkF378vzJR4EYLKX3ygpqWbJJcn-6p_AGQUB3jt2R4vKotN_0dxB5edNDpQAe4Rc1w6SKiCOyLRbKJR4USqIxof6rgvea29M71-q_0ymcPiuUHtZBZGmOSLLlRZp/s450/spokes.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEicIPnEytmyXedVbulIXkF378vzJR4EYLKX3ygpqWbJJcn-6p_AGQUB3jt2R4vKotN_0dxB5edNDpQAe4Rc1w6SKiCOyLRbKJR4USqIxof6rgvea29M71-q_0ymcPiuUHtZBZGmOSLLlRZp/s1600/spokes.png)

### Eye candy: Glow effect ###

I wanted a subtle vector display look to the graphics, even though I wasn't aiming for any sort of realism with it. So the brightest parts of the image would have to glow a little, or spread out in space. This can be done using Gaussian blur.

Gaussian blur requires convolution, which is very CPU-intensive. I think most of the rendering time was spent calculating blur convolution. It could be sped up using threads (cv::parallel\_for\_) or the GPU (cv::cuda routines) but there was no real-time requirement in this hobby project.

There are a couple of ways to only apply the blur to the brightest pixels. We could blur a copy of the image masked with its thresholded version, for example. But I like to use look-up tables (LUT). This is similar to the curves tool in Photoshop. A look-up table is just a 256-by-1 RGB matrix that maps an 8-bit index to a colour. In this look-up table I just have a linear ramp where everything under 127 maps to black.

```
cv::Mat mat_lut = GlowLUT();
cv::Mat mat_glow;
cv::LUT(mat_frame, mat_lut, mat_glow);
```

Now when blurring, if we add the original image on top of the blurred version, its sharpness is preserved:

```
cv::GaussianBlur(mat_glow, mat_glow, cv::Size(0,0), 3.0);
mat_frame += 2 * mat_glow;
```

![[Image: A zoomed view of a circle, showing the glow effect.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjNAONoJIEObnIVGE-AbyecROvA4VkTER3ic2TDQ5nHXI5GYfvHEejAruFS33WyLTCruuN0lO2Mo4AWXOQL8iQYZLhpvQ9jExSwQmRz2diVCoU3jPWjjB7VqVJwD2Z2oRXRSzM2JHdaAAx7/s450/glow-zoomed.png)

The effect works unevenly on antialiased lines which adds a nice pearl-stringy look.

### Eye candy: Tinted glass and grid lines ###

I created a vignetted and dirty green-yellow tinted look by multiplying the image per-pixel by an overlay made in GIMP. This has the same effect as having a "Multiply" layer mode in an image editor. Perhaps I was thinking of an old glass display, or Vectrex overlays. The overlay also has black grid lines that will appear black in the result. Multiplication doesn't change the color of black areas in the original, but I also added a copy of the overlay at 10% brightness to make it dimly visible in the background.

```
cv::Mat mat_overlay = cv::imread("overlay.png");

cv::multiply(mat_frame, mat_overlay, mat_frame, 1.f/255);
mat_frame += mat_overlay * 0.1f;
```

![[Image: A zoomed view of a circle, showing the color overlay effect.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjnljOUCNrwy85yDcP0YzmqcEFu7f6W0uqegcsrFkhj4jTG9oMivCOJRrCAWgMyjYAAI0TKTXQZ-PwRMmlhrR9BpeBiFh9yFaZCUxI9MXxrIGbfCA78zvSrbs0TcLcmJwOXnCpUrBLJqWd2/s450/overlay-effect.png)

### Eye candy: Flicker ###

Some objects flicker slightly for an artistic effect. This can be headache-inducing if overdone, so I tried to use it in moderation. The rings have a per-frame probability for a decrease in brightness, which I think looks good at 60 fps.

```
if (randf(0.f, 1.f) < .0001f)
  color *= .5f;

```

The spokes will also sometimes blink upon encountering each other, and the whole ring flickers a bit when it first becomes visible.

### Title text ###

An LCD matrix font was used for the title text. This was just a PNG image of 128 characters that was spliced up and rearranged. This can be done in OpenCV by using submatrices and rectangle ROIs:

```
cv::Mat mat_font = cv::imread("lcd_font.png");
const cv::Size letter_size(24, 32);
const std::string text("finally, the end of the "
                       "marmalade forest!");

int cursor_x = 0;
for (char code : text_) {
  int mx = code % 32;
  int my = code / 32;

  cv::Rect font_roi(cv::Point(mx * letter_size.width,
                              my * letter_size.height),
                    letter_size);
  cv::Mat mat_letter = mat_font(font_roi);

  cv::Rect target_roi(text_origin_.x + cursor_x,
                      text_origin_.y,
                      mat_letter.cols, mat_letter.rows)
  mat_letter.copyTo(mat_output(target_roi));

  cursor_x += letter_size.width;
}
```

![[Image: A zoomed view of the text 'finally' with a glow and color overlay effect.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEirmsMDeVOsnMtHYkFwICo5_uXRRFuUEnk_Cyewpe2mqHEJkIWdWt3I3rgMvDdcy0SAM5FNFoYKxekllK3zP53uhHpMLmk_C69yUSLlc_YoR0KlOAy0eaGJb7RWFvXoPS5mpO9-zAt2IdHA/s450/finally.png)

### Encoding the video ###

Now we can save the frames as a video file. OpenCV has a VideoWriter class for just this purpose. But I like to do this a bit differently. I encoded the frame images individually as BMP and just concatenated them one after the other to stdout:

```
std::vector<uchar> outbuf;
cv::imencode(".bmp", mat_frame, outbuf);
fwrite(outbuf.data(), sizeof(uchar), outbuf.size(), stdout);
```

I then ran this program from a shell script that piped the output to ffmpeg for encoding. This way I could also combine it with the soundtrack in a single run.

```
make && \
 ./marmalade -p | \
 ffmpeg -y -i $AUDIOFILE -framerate $FPS -f image2pipe \
        -vcodec bmp -i - -s:v $VIDEOSIZE -c:v libx264 \
        -profile:v high -b:a 192k -crf 23 \
        -pix_fmt yuv420p -r $FPS -shortest -strict -2 \
        video.mp4 && \
 open video.mp4
```

### Result ###

The 1080p/60 version can be viewed by clicking on the gear wheel menu.

[![Embedded YouTube video](https://img.youtube.com/vi/a78ec5YdHbE/0.jpg)](https://www.youtube.com/watch?v=a78ec5YdHbE)