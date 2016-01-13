winsize = 1024;
fc = 44100;
sinc = 1/fc;

binsize = fc/winsize;

winsizequarti = winsize/4;

f = zeros(1, winsize);

Ffreq = [-fc/2:binsize:(fc/2)-1];

f(winsizequarti+1 : 3*winsizequarti) = 1;

F = fft(f);

FF = fftshift(F);

dbFF = 20*log10(2*abs(FF)/winsize);

plot (Ffreq, dbFF)
