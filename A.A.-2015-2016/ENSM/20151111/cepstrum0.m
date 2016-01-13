fc=44100;
winsize=4096;
binsize=fc/winsize;
f=20*binsize;
sinc=1/fc;
dur=0.1;
t=[0:sinc:(dur-sinc)];
h=hanning(winsize);


Fondbin=20;
S=zeros(1, winsize);

curfreq=1; 

n=1; 


while (curfreq<(fc/2))
curfreq = (Fondbin*n);
S += ((1/n)*sin(2*pi*curfreq*t(1:winsize))); 
n=n+1;

end



C= ifft(log(abs(fft(h' .* S(1:winsize)))));


figure (1);
plot (t(1:winsize), S);

figure (2);
plot (abs (C));

