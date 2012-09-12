function val = playnote(data, freqnum, freqamp, tab)
% plays the note and graphs plot corresponding to vector data
% data corresponds to the superimposed pitch data
% freqnum corresponds to a vector of the individual frequencies
% tab corresponds to a toggle of the graphs

% globals
SR = 44100; % sampling rate for music/audio (Hz)
TF = 0.75; % duration of simulation (s)

% variables & calculations
k = 1/SR; % time step
Ns = floor(TF*SR); % duration of simulation (samples)

% play sound
soundsc(data,SR);

% plot graph
if (tab>0) % checks if tab was hit and if so toggles the value 
    figure(1);
    % give the corresponding output t = [0:Ns-1]*k;
    t = [0:round(Ns/64)]*k;
    % k plots in black plot([0:Ns-1]*k, data, 'k');
    subplot(3,1,1), plot([0:round(Ns/64)]*k, data(1:round(Ns/64)+1), 'k');
    xlabel('Time');
    ylabel('Amplitude');
    title('Pitch Plot');
    axis tight;
    subplot(3,1,2);
    stem(freqnum, freqamp);
    axis([0 12000 0 1.5]); 
    subplot(3,1,3);
    h = spectrum.welch; % Create a Welch spectral estimator. 
    Hpsd = psd(h,data(1:round(Ns/500)+1),'Fs',Ns); % Calculate the PSD 
    plot(Hpsd) % Plot the PSD.
    %plot([0:(round(Ns/1024))]*k,fft(data(1:(round(Ns/1024)+1))),'k');
    xlabel('Frequency'); 
    ylabel('Normalized Amplitude');
    title('Frequency Spectrum'); % or else it does not plot
else
    close;
end