---
title = "The microphone bioamplifier"
description = "As the in-ear microphone in the previous post couldn't detect a signal that would suggest objective tinnitus, the next step would be to examine EMG signals from facial muscles. This is usually done using "
date = "2015-10-02T11:53:00.001Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-2465868036412677183"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.900862296Z"
seen = true
---

As the in-ear microphone [in the previous post](http://www.windytan.com/2015/07/case-study-tinnitus-with-distortion.html) couldn't detect a signal that would suggest objective tinnitus, the next step would be to examine EMG signals from facial muscles. This is usually done using a special-purpose device called a bioamplifier, special-purpose electrodes, and contact gel, none of which I have at hand. A perfect opportunity for home-baking, that is!

There's an Instructable called [How to make ECG pads & conductive gel](http://www.instructables.com/id/How-to-make-ECG-pads-conductive-gel/?ALLSTEPS). Great! Aloe vera gel and table salt for the conductive gel are no problem, neither are the snap buttons for the electrodes. I don't have bottle caps, though, so instead I cut circular pieces out of some random plastic packaging.

[![[Image: An electrode made out of transparent plastic.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi-IFvsNBn7XwU4rXB823E2AWw8EPwR64TasHFdYmCYeSdOzd7eJCk1uc41pCZVZblYPgzBtv8tyWAQfdO0JlMekMzeL_Rscoonfv_LjJOW-GwXFbwTkdnbx3EsNOuiwEIYvfvTi7lAWCmN/s400/IMG_4855-1.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi-IFvsNBn7XwU4rXB823E2AWw8EPwR64TasHFdYmCYeSdOzd7eJCk1uc41pCZVZblYPgzBtv8tyWAQfdO0JlMekMzeL_Rscoonfv_LjJOW-GwXFbwTkdnbx3EsNOuiwEIYvfvTi7lAWCmN/s1600/IMG_4855-1.jpg)

As for the bioamplifier, why can't we just use the microphone preamplifier that was used for amplifying audio in the previous post? Both are weak low-frequency signals. There's no apparent reason for why it couldn't amplify EMG, if only a digital filter was used to suppress the mains hum.

### It's a signal, but it's noise ###

First, a little disclaimer. It's unwise to just plug yourself into a random electric circuit, even if Oona survived. Mic preamps, for example, are not mere passive listeners; instead they will in some cases try to apply [phantom power](https://en.wikipedia.org/wiki/Phantom_power) to the load. This can be up to 48 volts DC at 10 mA. There's anecdotal evidence of people getting palpitations from experiments like this. Or maybe not. But you wouldn't want to take the risk.

[![[Image: Photo of my cheek with an electrode attached to it.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8ZwKtWTgsN0jdLYOFdX0FEP6GkEytmI7VHseOPMYGuKlR5KvaZU9iy56ENKmiGCMB1nEEUfVj6vw369ad_ffxlIqTQwvKdl1BiRnPdV0OAoEcDE3PKItVWcPPhQL1XRYO5v-wt_6G2HHo/s260/IMG_2923-1.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEh8ZwKtWTgsN0jdLYOFdX0FEP6GkEytmI7VHseOPMYGuKlR5KvaZU9iy56ENKmiGCMB1nEEUfVj6vw369ad_ffxlIqTQwvKdl1BiRnPdV0OAoEcDE3PKItVWcPPhQL1XRYO5v-wt_6G2HHo/s1600/IMG_2923-1.jpg)

So I attached myself into some leads, soldered into a stereo miniplug, using the home-made pads that I taped on opposite sides of my face. I plugged the whole assembly into the USB sound card's mic preamp and recorded the signal at a pretty low sampling rate.

[![[Image: Spectrogram.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEid_rsFra0OFNOqpe0vXgQkUkYylgUyeX_7UWwtFVB01TZk-_p3M63Hltk51RO8z3uk_caghPvRLyHwWNTNaKfWXrHfzWSDpxPOOVjWnT5lni_pi5hIAk4X51D3a1_PSuf4stmqNN1tFeSd/s500/lihas2.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEid_rsFra0OFNOqpe0vXgQkUkYylgUyeX_7UWwtFVB01TZk-_p3M63Hltk51RO8z3uk_caghPvRLyHwWNTNaKfWXrHfzWSDpxPOOVjWnT5lni_pi5hIAk4X51D3a1_PSuf4stmqNN1tFeSd/s1600/lihas2.jpg)

The signal, shown here from 0 to 700 Hz, is dominated by a mains hum (colored red-brown), as I suspected. There is indeed a strong signal present during contraction of jaw muscles (large green area). Moving the jaw left and right produces a very low-frequency signal instead (bright green splatter at the bottom).

It's fun to watch but still a bit of a disappointment; I was really hoping for a clear narrow-band signal near the 65 Hz frequency of interest.

### Einthoven's triangle ###

At this point I was almost ready to ditch the EMG thing as uninteresting, but decided to move the electrodes around and see what kind of signals I could get. When one of them was moved far enough, a pulsating low-frequency signal would appear:

[![[Image: Spectrogram with a regularly pulsating signal.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj4SM3lSCjDjXS7zIXOJFWXFRa2R-oxGCLU6RazEyh0GEnOOXooIvU2EIR_2xaRJo0k5BcSD16PdHStJR5JsyXPKsb3sE9TgWzZc2PELQkvvnIJn9sl3jprdfvx7q5H23V7wR9VzZ1sTEp0/s500/pulsating.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj4SM3lSCjDjXS7zIXOJFWXFRa2R-oxGCLU6RazEyh0GEnOOXooIvU2EIR_2xaRJo0k5BcSD16PdHStJR5JsyXPKsb3sE9TgWzZc2PELQkvvnIJn9sl3jprdfvx7q5H23V7wR9VzZ1sTEp0/s1600/pulsating.jpg)

Could this be what I think it is? To be sure about it I changed the positions of the electrodes to match Lead II in [Einthoven's triangle](https://en.wikipedia.org/wiki/Einthoven's_triangle), as used in electrocardiography. The signal from Lead II represents potential difference between my left leg and right arm, caused by the heart.

After I plugged the leads in the amp already did this:

![[Image: Animation of the signal indicator LEDs of an amplifier blinking in a rhythmic manner.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhVKNcorTRIpmXogOkQi4tukKw1GYDhQjfKDe0JxG1mDEsAczybHqSP9ddPGO29y2gQjdav6pXDtJ1kJLmBZuxvJSot1tK1hUOjWTeRp6zf9_goJ6usTBO5sFRtBk_Nc8571yspwN7b9K0J/s200/pulssi.gif)

Looks promising! The mains hum was really irritating at this point, but I could get completely rid of it by rejecting all frequencies above 45 Hz, since the signal of interest was below that.

The result is a beautiful view of the iconic QRS complex, caused by ventricular depolarization in the heart:

[![[Image: Oscillogram with strong triple-pointed spikes at regular intervals.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhlBDXiUU66rtGlYmP4tXO9T_AcIqoA_BiqR9SVyozwbMNLvNoPL5BzkaiJRBHUZErx-JKSvv4kyC5qupKQM0Aaa39IG5xW2Q3bV7bqr1GKaLxMfxxw0RGh9bJQ7_kRrw84W6xv3a3e7WnX/s500/screenshot-ekg.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEhlBDXiUU66rtGlYmP4tXO9T_AcIqoA_BiqR9SVyozwbMNLvNoPL5BzkaiJRBHUZErx-JKSvv4kyC5qupKQM0Aaa39IG5xW2Q3bV7bqr1GKaLxMfxxw0RGh9bJQ7_kRrw84W6xv3a3e7WnX/s1600/screenshot-ekg.png)

Quite a side product!