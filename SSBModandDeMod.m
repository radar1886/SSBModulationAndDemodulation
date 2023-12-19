clc;clear;

%Carrier Frequency
fc = 200;

% baseband Frequency
fm = 30;

%sampling frequency
fs = 4000;

%time duration
 t = (0 : 1/fs : 1);
 t = linspace(0,1,1000);

 %cosine wave with time duration t
 m = cos(2*pi*fm*t);

 %hilbert transform of baseband
 mh = imag(hilbert(m));

 % single side band with upper side band
 sb = m.*cos(2*pi*fc*t) -mh.*sin(2*pi*fc*t);

 %demodution by synchronous method 
 em = sb.*m;

 %filterring High frequencies
 [n,w] = buttord(2/1000, 4/1000, .5,5);
 [a,b] = butter(n,w,'low');
 dem = filter(a,b,em);

 %displaying the modulation 
 subplot(3,1,1);
 plot(t,sb);
 title('Single sideband Modulation');
 xlabel('Time(sec)');
 ylabel('Amplitude');

 %displaying the demodulation
 subplot(3,1,2);
 plot(t,em);
 title('Single Sideband Demodulation');
 xlabel('Time(Sec)');
 ylabel('Amplitude');

 %displaying the filtered signal
 subplot(3,1,3);
 plot(t,dem);
 title('Filtered signal');
 xlabel('Time(sec)');
 ylabel('Amplitude');