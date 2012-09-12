function synthesizer
% a function getkey() is used that obtains the ASCII code of the key that is pressed and
% stores it in the variable that its output is assigned to

fprintf('\nMUSICAL SYNTHESIZER!')
helpmenu

h = 0;
instrnum = 0;
hcoeff = instr(0); % default instrument setting
keypress = getkey; % user input 
n=1;
tab=-1;
freqnum = 0; % vector of frequencies
freqamp = 0; % vector of frequency amplitudes

while (keypress ~= 13) % 13 = ASCII code for Enter/Return
    pitch = lookup(keypress); % finds the corresponding pitch
    if (pitch.freq ~= 0) % keypress has a corresponding pitch
        if (pitch.freq > 0)
            for i = 1:7
                % sum up the scaled harmonics for a pitch
                h = h + hcoeff(i)*freqdata(pitch.freq*i, instrnum, n);
                freqnum(i) = pitch.freq*i; % stores frequency
                freqamp(i) = hcoeff(i); % stores its amplitude
            end
        elseif(pitch.freq == -1)
             % -1 flag corresponds to a chord (triad) rather than one note
            for i = 1:7
                h = h + hcoeff(i)*freqdata(pitch.freq1*i, instrnum,n);
                h = h + hcoeff(i)*freqdata(pitch.freq2*i, instrnum,n);
                h = h + hcoeff(i)*freqdata(pitch.freq3*i, instrnum,n);
                freqnum(3*i-2) = pitch.freq1*(3*i-2); 
                freqnum(3*i-1) = pitch.freq2*(3*i-1);
                freqnum(3*i) = pitch.freq3*(3*i);
                freqamp(3*i-2) = hcoeff(i);
                freqamp(3*i-1) = hcoeff(i);
                freqamp(3*i) = hcoeff(i);
            end
        end
        fprintf(pitch.note);
         % function actually plays the sound of all the combined harmonics
        playnote(h, freqnum, freqamp, tab); 
    elseif (keypress == 9) % toggle plot displays 
        tab=-tab;
    else % keypress has no corresponding pitch
        if ((keypress > 47) && (keypress < 58)) % the user pressed a digit key 
            instrnum = keypress - 48;
             % change the instrument: offset by 48 since \ascii(0) = 48
            hcoeff = instr(instrnum);
        elseif (keypress == 96) % help menu
            helpmenu;
        elseif ((keypress == 61) && (n<=2))
            n=n+1;
            fprintf('\nOctave changed to: %i\n',n);
        elseif ((keypress == 45) && (n>1))
            n=n-1;
            fprintf('\nOctave changed to: %i\n',n);
        else
            n=n; % if invalid key, do nothing
        end
    end
    keypress = getkey;
    h = 0;
end

figure(1); % focus to figure 1
close(1); % close figure for good