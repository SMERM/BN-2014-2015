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


fft_der=ffts(2:size(ffts,2))-ffts(1:size(ffts,2)-1);
figure(2)
plot(Ffreq(1:size(Ffreq,2)-1), fft_der)
axis ([-xzoom xzoom -30 +30])

hsz=size(Ffreq,2)/2;
sz=size(Ffreq,2);
peaks=[];
for k=hsz-5:sz
    if(fft_der(k-1)>0 && fft_der(k)<0)
        peaks(end+1)=k;
    end
end
ffts(peaks(2))-ffts(peaks(1))
figure(1)
plot(Ffreq, ffts, Ffreq(peaks(1)), ffts(peaks(1)), "*",Ffreq(peaks(2)), ffts(peaks(2)), "*")
axis ([-xzoom xzoom -140 0])
title ("RETTANGOLARE")

