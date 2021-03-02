function [x , t ] = key_to_musical_note ( key , Xs , dur , fs )
% key_to_musical_note : Produces a musical node corresponding
% to a given piano key number
%
% Input Args :
% key : number of the note ( key ) on piano keyboard
% Xs : A vector contains the phasors of harmonics starting
% from the 1 st harmonic
% dur : duration of note ( in seconds )
% fs : A scalar indicating the sampling rate ( in Hz )
%
% Output :
% x : waveform of the note
% t : optional time vector
t = 0:1/ fs : dur; % Time vector
f = 440*2^((key-69)/12);
x = zeros(1, length(t)); % creates a zero filled vector for our
                         % sinusoid/note we are making
num_harmonics = length(Xs); % gets the number of harmonics we want to use

% Add comment here to explain what the loop does
% The loop makes a sinusoid for harmonic 'n' and adds the result to our
% end result sinusoid that we are returning.
    for n =1: num_harmonics
    x = x + real (Xs(n)*exp(j*2*pi*n*f*t));
    end
end