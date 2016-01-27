function ffts=myFFT(w, fftw, fc)

    sinc=1/fc;
    winsize=size(w, 2);
    fftw=8192;
    binsize=fc/fftw;
    
    fftf=zeros(1,fftw);
    
    windiff=floor((fftw-winsize)/2);
    fftf(windiff+1:fftw-windiff-1)=w;
    
    FF=[fftf(round(fftw/2)+1:fftw) fftf(1:round(fftw/2))];
    F=fft(FF, fftw);
    
    
    dBFF=20*log10(abs(F)/winsize);
    ffts=fftshift(dBFF);
end

