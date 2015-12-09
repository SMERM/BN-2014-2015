fc = 44100;
dur = 0.1;
sinc = 1/fc;
T = [0:sinc:dur-sinc];

winsize = 1023;
binsize = fc/winsize;

f = 4000;

w = 2*pi*f;

nsamples = fc*dur;

T1 = T (1:winsize);
%y = exp(i*w*T1); %funz. complessa

y = cos (w*T1); %funz. reale
figure (1)
subplot (2,1,1)
plot (T1, real(y))

subplot (2,1,2)
plot (T1, imag(y))

F = [0:binsize:fc-binsize];
ybuf= [y(round(winsize/2)+1:winsize) y(1:round(winsize/2))];
DFT = zeros (size(F));

for k = 1:winsize
  anal = exp(-i*F(k)*2*pi*T1); 
  mult = anal .* ybuf;
  DFT(k) = sum(mult);
end

figure (2)
plot (F, abs(DFT)/winsize)
