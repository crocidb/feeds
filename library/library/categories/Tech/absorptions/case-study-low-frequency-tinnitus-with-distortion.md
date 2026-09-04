---
title = "Case study: low-frequency tinnitus with distortion"
description = "[![[Image: A pure tone audiogram of both ears indicating no hearing loss.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgUf6rqi-WaY6GsAMciuY1RwdK1XoL1M0KzBcPXzR3XzX3mN26qru8QhMUcDK4s4jGBYfnNUEP3ITgSuAwXzZvPPevQDob5MnY8FW8levIw5Kq5xwSIsApVQBouyKAv_8a3gKu-syNzZIvL/s2"
date = "2015-07-11T07:39:00.003Z"
url = "tag:blogger.com,1999:blog-5096278891763426276.post-2566419698350597758"
author = "Oona Räisänen"
text = ""
lastupdated = "2025-10-22T08:59:03.903629380Z"
seen = true
---

[![[Image: A pure tone audiogram of both ears indicating no hearing loss.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgUf6rqi-WaY6GsAMciuY1RwdK1XoL1M0KzBcPXzR3XzX3mN26qru8QhMUcDK4s4jGBYfnNUEP3ITgSuAwXzZvPPevQDob5MnY8FW8levIw5Kq5xwSIsApVQBouyKAv_8a3gKu-syNzZIvL/s200/pta.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgUf6rqi-WaY6GsAMciuY1RwdK1XoL1M0KzBcPXzR3XzX3mN26qru8QhMUcDK4s4jGBYfnNUEP3ITgSuAwXzZvPPevQDob5MnY8FW8levIw5Kq5xwSIsApVQBouyKAv_8a3gKu-syNzZIvL/s1600/pta.png)

A periodically appearing low-frequency tinnitus is one of my least favorite signals. A doctor's visit only resulted in a WONTFIX and the audiogram shown here, which didn't really answer any questions. Also, the sound comes with some pecularities that warrant a deeper analysis. So it shall become one of my *absorptions*.

The possible subtype[ (Vielsmeier et al. 2012)](#Vielsmeier2012) of tinnitus I have, related to a joint problem, is apparently even more poorly understood than the classical case[ (Vielsmeier et al. 2011)](#Vielsmeier2011), which of course means I'm free to make wild speculations! And maybe throw a supporting citation here and there.

Here's a simulation of what it sounds like. The occasional frequency shifts are caused by head movements. (There's only low-frequency content, so headphones will be needed; otherwise it will sound like silence.)

(HTML5 audio: computer-generated low-frequency tone on the right channel with some frequency shifts.)

It's nothing new, save for the somewhat uncommon frequency. Sounds a bit like a car left idling outside the house. Now to the weird stuff.

### Real-life audio artifacts! ###

This analysis was originally sparked by a seemingly unrelated observation. I listen to podcasts and documentaries a lot, and sometimes I've noticed the voice sounding like it had shifted up in frequency, for just a small amount. It would resemble an across-the-spectrum linear shift that breaks the harmonic relationships, much like when listening to a SSB transmission. (Simulated sound sample from a podcast below.)

[HTML5 audio: excerpt from a science news podcast with distorted speech.]

I always assumed this was a compression artifact of some kind. Or maybe broken headphones. But one day I also noticed it in real life, when a friend was talking to me! I had to ask her repeat, even though I had heard her well. Surely not a compression artifact. Of course I immediately associated it with the tinnitus that had been quite strong that day. But how could a pure tone alter the whole spectrum so drastically?

### Amplitude modulation? ###

It's known that a signal gets frequency-shifted when amplitude-modulated, i.e. multiplied in the time domain, by a steady sine wave signal. This is a useful effect in the realm of radio, where it's known as heterodyning. My tinnitus happens to be a near-sinusoidal tone at 65 Hz; if this got somehow multiplied with part of the actual sound somewhere in the auditory pathway, it could explain the distortion.

[![[Image: Oscillograms of a wideband signal and a sinusoid tone, and a multiplication of the two.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjD0WvVnLRiPh7HrR9y3cXDceGHJ-RiiljtpX2FE-G3SkBiFLS9rfgr5w78a9cf6MuFdW_NN9JkPT4B2vEII16_yiDRnvPummJXI5kl2oFUV_8L8VAeX4GMRgkv7bFb93xxdndcLc6w5CjO/s500/multiply.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjD0WvVnLRiPh7HrR9y3cXDceGHJ-RiiljtpX2FE-G3SkBiFLS9rfgr5w78a9cf6MuFdW_NN9JkPT4B2vEII16_yiDRnvPummJXI5kl2oFUV_8L8VAeX4GMRgkv7bFb93xxdndcLc6w5CjO/s1600/multiply.png)

Where could such a multiplication take place physically? I'm guessing it should be someplace where the signal is still represented as a single waveform. The basilar membrane in the cochlea already mechanically filters the incoming sound into frequency bands one sixth of an octave wide for neural transmission[ (Schnupp et al. 2012)](#AuditoryNeuroscience). Modulating one of these narrow bands would likely not affect so many harmonics at the same time, so it should either happen before the filtering or at a later phase, where the signal is still being handled in a time-domain manner.

I've had several possibilities in mind:

1. The low frequency tone could have its origins in actual physical vibration around the inner ear that would cause displacement of the basilar membrane. This is supported by a subjective physical sensation of pressure in the ear accompanying the sound. How it could cause amplitude modulation is discussed later on.
2. A somatosensory neural signal can cause inhibitory modulation of the auditory nerves in the dorsal cochlear nucleus[ (Young et al. 1995)](#Young1995). If this could happen fast enough, it could lead to amplitude modulation of the sound by modulating the amount of impulses transmitted; assuming the auditory nerves still carry direct information about the waveform at this point (they sort of do). Some believe the dorsal cochlear nucleus is exactly where the perceived sound in this type of tinnitus also originates[ (Sanchez & Rocha 2011)](#Sanchez2011).

### Guinea pigs know the feeling ###

Already in the 1970s, it was demonstrated that human auditory thresholds are modulated by low frequency tones[ (Zwicker 1977)](#Zwicker1977). In a 1984 paper the mechanism was investigated further in Guinea pigs[ (Patuzzi et al. 1984)](#Patuzzi1984). A low-frequency tone (anywhere from 33 up to 400 Hz) presented to the ear modulated the sensitivity of the cochlear hair cell voltage to higher frequency sounds. This modulation tracked the waveform of the low tone, such that the greatest amplitude suppression was during the peaks of the low tone amplitude, and there was no suppression at its zero crossings. In other words, a low tone was capable of amplitude-modulating the ear's response to higher tones.

This modulation was observed already in the *mechanical velocity* of the basilar membrane, even before conversion into neural voltages. Some kind of an electro-mechanical feedback process was thought to be involved.

### Hints towards a muscular origin ###

So, probably a 65 Hz signal exists somewhere, whether physical vibration or neural impulses. Where does it come from? Tinnitus with vascular etiology is usually pulsatile in nature[ (Hofmann et al. 2013)](#Hofmann2013), so it can be ruled out. But what about muscle cramps? After all, I know there's a problem with the temporomandibular joint and nearby muscles might not be happy about that. We could get some hints by studying the frequencies related to a contracting muscle.

A 1974 study of EEG contamination caused by various muscles showed that the surface EMG signal from the masseter muscle during contraction has its peak between 50 and 70 Hz[ (O'Donnell et al. 1974)](#ODonnell1974); just what we're looking for. (The masseter is located very close to the temporomandibular joint and the ear.) Later, there has been initial evidence that central neural motor commands to small muscles may be rhythmic in nature and that this rhythm is also reflected in EMG and the synchronous vibration of the contracting muscle[ (McAuley et al. 1997)](#McAuley1997).

Sure enough, in my case, applying firm pressure to the deep masseter or the posterior digastric muscle temporarily silences the sound.

### Recording it ###

Tinnitus associated with a physical sound detectable by an outside observer, a rare occurrence, is described as *objective*[ (Hofmann et al. 2013)](#Hofmann2013). My next plan was to use a small in-ear microphone setup to try and find out if there was an objective sound present. This would shed light on the way the sound is transmitted from the muscles to the auditory system, as if it made any difference.

But before I could do that, I went to this loud open air trance party (with DJ Tristan) that, for some reason, eradicated the whole tinnitus that had been going on for a week or two. I had to wait for a week before it reappeared. (And I noted it being the result of a stressful situation, as people on Twitter and HN have also pointed out.)

[![[Image: Sennheiser earplugs connected to the microphone preamp input of a Xenyx 302 USB audio interface.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj4B5y1VkH6XtRcQ-gsZZMbs18mzyztspQqSW5kPw5CuPgWXwbkwLlRMVvwp1uLwXqrtrsD3XMRFLn6UdWRdkf-WZSl5wO2olOFTBp60mCR7c3iMBuRDWzm_g9jntBJlvFsOzen4tSXvNfA/s200/IMG_4749-1.jpg)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj4B5y1VkH6XtRcQ-gsZZMbs18mzyztspQqSW5kPw5CuPgWXwbkwLlRMVvwp1uLwXqrtrsD3XMRFLn6UdWRdkf-WZSl5wO2olOFTBp60mCR7c3iMBuRDWzm_g9jntBJlvFsOzen4tSXvNfA/s1600/IMG_4749-1.jpg)

Now I could do a measurement. I used my earplugs as a microphone by plugging them into a mic preamplifier using a plug adapter. It's a mono preamp, so I disconnected the left channel of the adapter using cellotape to just record from the right ear.

I set [baudline](http://baudline.com/) for 2-minute spectral integration time and a 600 Hz decimated sample rate, and the preamp to its maximum gain. Even though the setup is quite sensitive and the earplug has very good isolation, I wasn't able to detect even the slightest peak at 65 Hz. So either recording outside the tympanic membrane was an absurd idea to begin with, or maybe the neural explanation is the more likely cause of the sound.

[![[Image: Screenshot of baudline with the result of spectral integration from 0 to 150 Hz, with nothing to note but a slight downward slope towards the higher frequencies.]](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj3wgd9SJLF2ipcP0qQbHXm5ySvnsQvEvirSipnvH0QkzlsC7AUi4K8EMqqhlqcqXIPz1VwOOiawMuhSlocElM30402-Y-0m7qzpUUoIC0pniwtE6Lm5QmBEYTw0Vdl3j67pxFfmIwrauDS/s400/Screen+Shot+2015-07-11+at+17.42.31.png)](https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEj3wgd9SJLF2ipcP0qQbHXm5ySvnsQvEvirSipnvH0QkzlsC7AUi4K8EMqqhlqcqXIPz1VwOOiawMuhSlocElM30402-Y-0m7qzpUUoIC0pniwtE6Lm5QmBEYTw0Vdl3j67pxFfmIwrauDS/s1600/Screen+Shot+2015-07-11+at+17.42.31.png)

My next post, [The microphone bioamplifier](https://www.windytan.com/2015/10/the-microphone-bioamplifier.html), starts by exploring this further.

### References ###

* Hofmann, E., Behr, R., Neumann-Haefelin, T., Schwager, K. (2013): [Pulsatile Tinnitus](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3719451/). Deutsches Ärtzeblatt 110(26): 451–458.
* McAuley, J., Rothwell, J., Marsden, C. (1997): [Frequency peaks of tremor, muscle vibration and electromyographic activity at 10 Hz, 20 Hz and 40 Hz during human finger muscle contraction may reflect rhythmicities of central neural firing](http://www.ncbi.nlm.nih.gov/pubmed/9187289). Experimental Brain Research 114(3): 525–41.
* O'Donnell, R., Berkhout, J., Adey, W.R. (1974): [Contamination of scalp EEG spectrum during contraction of cranio-facial muscles](http://www.ncbi.nlm.nih.gov/pubmed/4135021). Electroencephalography and Clinical Neurophysiology 37(2): 145–51.
* Patuzzi, R., Sellick, P.M., Johnstone, B.M. (1984): [The modulation of the sensitivity of the mammalian cochlea by low frequency tones](http://www.sciencedirect.com/science/article/pii/0378595584900911). Hearing Research 13(1): 19–27.
* Sanchez, T.G., Rocha, C.B. (2011): [Diagnosis and management of somatosensory tinnitus: review article](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3129953/). Clinics 66(6): 1089–1094.
* Schnupp, J., Nelken, I., King, A. (2012), [Auditory Neuroscience – Making sense of sound](http://cognet.mit.edu/book/auditory-neuroscience). 368 pp., MIT Press.
* Vielsmeier, V. et al. (2011): [Tinnitus with temporomandibular joint disorders: a specific entity of tinnitus patients?](http://www.ncbi.nlm.nih.gov/pubmed/21705788) Otolaryngology – Head and Neck Surgery 145(5): 748–52.
* Vielsmeier, V. et al. (2012): [Temporomandibular Joint Disorder Complaints in Tinnitus: Further Hints for a Putative Tinnitus Subtype](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0038887). PLoS ONE 7(6): e38887.
* Young, E.D., Nelken, I., et al. (1995): [Somatosensory effects on neurons in dorsal cochlear nucleus](http://www.ncbi.nlm.nih.gov/pubmed/7760132). Journal of Neurophysiology 73(2): 743–65.
* Zwicker, E. (1977): [Masker period patterns produced by very-low-frequency maskers and their possible relation to basilar-membrane displacement](http://scitation.aip.org/content/asa/journal/jasa/61/4/10.1121/1.381387). Journal of the Acoustical Society of America 61: 1031–1040.