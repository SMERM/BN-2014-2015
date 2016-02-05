clear all;

fc=44100;
sinc=1/fc;
winsize=1001;
fftwinsize=8192;
binsize=fc/fftwinsize;
xzoom=100*binsize;

fftf=zeros(1,fftwinsize);

t=[0:fftwinsize-1];

%rettangolare
eps=0.0001;
winsizequarti=winsize/4;
f = zeros(1, winsize);
f = f+eps;
f(round(winsizequarti)+1 : 3*round(winsizequarti))=1;

ffts=myFFT(f,fftwinsize, fc);
Ffreq=[-fc/2:binsize:fc/2-1];
figure(3)
plot(Ffreq, ffts)
axis ([-xzoom xzoom -140 0])


%hann
f1=0.5*(1-cos(2*pi*(0:winsize-1)/(winsize-1)));
ffts=myFFT(f1,fftwinsize, fc);
figure(4)
plot(Ffreq, ffts)
axis ([-xzoom xzoom -140 0])

%hamming
f2=0.54-0.46*(cos(2*pi*(0:winsize-1)/(winsize-1)));
ffts=myFFT(f2,fftwinsize, fc);
figure(5)
plot(Ffreq, ffts)
axis ([-xzoom xzoom -140 0])

%blackman
alfa=0.16;
a0=(1-alfa)/2;
a1=1/2;
a2=alfa/2;
f3=a0-a1*(cos(2*pi*(0:winsize-1)/(winsize-1)))+a2*(cos(4*pi*(0:winsize-1)/(winsize-1)));
ffts=myFFT(f3,fftwinsize, fc);
figure(6)
plot(Ffreq, ffts)
axis ([-xzoom xzoom -140 0])

%blackman-harris
a0=0.35875;
a1=0.48829;
a2=0.14128;
a3=0.01168;
f4=a0-a1*(cos(2*pi*(0:winsize-1)/(winsize-1)))+a2*(cos(4*pi*(0:winsize-1)/(winsize-1)))-a3*(cos(6*pi*(0:winsize-1)/(winsize-1)));
ffts=myFFT(f4,fftwinsize, fc);
figure(7)
plot(Ffreq, ffts)

axis ([-xzoom xzoom -140 0])