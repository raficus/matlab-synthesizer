function val = freqdata(f0, inum, oct)

% generates numerical data corresponding to frequency f0
% f0 is the fundamental frequency
% inum is the instrument number, ranging 0-9

% globals
SR = 44100; % sampling rate for music/audio (Hz)
TF = 1.0; % duration of simulation (s) - STUB
u0 = 0; % initial displacement of zero
v0 = 1; % initial velocity (derivative) of 1 

if(SR<=2*f0) % check for frequencies to adhere to Nyquist rate
    error('Too high a frequency');
end

% variables & calculations
k = 1/SR; % time step
u1 = u0+k*v0; % derive value of time series at n=1;
coef = 2-k^2*(2*pi*f0*(2.^oct/2))^2;% scheme update coefficient 
Ns = floor(TF*SR); % duration of simulation (samples)
tmax = 2*floor(Ns/(f0*(2.^oct/2))); % bound for plot (for 2 full periods)

% initialize sinusoid
u=0; % current value of time series
u_last = u1; % last value of time series
u_last2 = u0; % one before last value of time series

% initialize readout
x = zeros(Ns,1);
x(1) = u0; 
x(2) = u1;

% determine exponential decay factor
switch(inum)
    case 1; m = 4000; % xylophone
    case 2; m = 15000; % clarinet
    case 3; m = 10000; % flute
    case 4; m = 10000; % oboe
    case 5; m = 8000; % trumpet
    case 6; m = 8000;
    case 7; m = 15000;
    case 8; m = 7000;
    case 9; m = 6000; % guitar
    otherwise; m = 10000; % piano
end;

for n=3:Ns
    u=coef*u_last-u_last2; % difference scheme calculation
    %x(n) = u; % old value for x(n)
    x(n) = oct*u.*exp(-n/m); % exponential decay over time
    u_last2 = u_last; u_last = u; % update state of difference scheme
end

val = x;