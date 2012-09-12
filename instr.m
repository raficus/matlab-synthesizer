function hvals = instr(num)
% takes as an argument a number corresponding to an instrument
% returns an array that effectively changes the instrument
% the return value is a matrix of harmonic coefficients
% scaling the amplitude of individual harmonics affects the timbre

switch(num)
    case 1; fprintf('\n\nInstrument 1: Xylophone\n'); % 1 key
        hvals = [1,0,0,0,0,0,0]; 
    case 2; fprintf('\n\nInstrument 2: Clarinet\n'); % 2 key
        hvals = [1,0,1,0,1,0,1]; 
    case 3; fprintf('\n\nInstrument 3: Flute\n'); % 3 key 
        hvals = [2.54,0.245,0.009,0,0,0,0]; 
    case 4; fprintf('\n\nInstrument 4: Oboe\n'); % 4 key
        hvals = [1,0.8,0.6,0.4,0.2,0,0]; 
    case 5; fprintf('\n\nInstrument 5: Trumpet\n'); % 5 key
        hvals = [0.17,0,0.63,0,0.57,0.98,0]; 
    case 6; fprintf('\n\nInstrument 6: ?\n'); % 6 key
        hvals = [1,1,0,0.25,0.5,0.75,1]; 
    case 7; fprintf('\n\nInstrument 7: ?\n'); % 7 key
        hvals = [1,1,0,0.25,0.5,0.75,1]; 
    case 8; fprintf('\n\nInstrument 8: ?\n'); % 8 key
        hvals = [8.6,0.45,3.4,0.5,0.42,0.13,0.16]; 
    case 9; fprintf('\n\nInstrument 9: 9\n'); % 9 key
        hvals = [1,0.05,0.40,0.06,0.05,0.015,0.02];
    case 0; fprintf('\n\nInstrument 0: Guitar\n'); % 0 key 
        hvals = [1,1,1,1,1,1,1]; 
end;