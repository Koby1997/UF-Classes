function [ x t ] = key_to_note ( key , X , dur , fs )
% key_to_note : Produces a sinusoidal waveform corresponding to a
% given piano key number
%
% Input Args :
% key : number of the note ( key ) on piano keyboard
% X : phasor of sinusoid
% dur : duration of note ( in seconds )
% fs : A scalar indicating the sampling rate ( in Hz )
%
% Output :
% x : sinusoidal waveform of the note
% t : optional time vector
t = 0:1/ fs : dur ; % Time vector
f = 440*2^((key-69)/12);
x = real (X*exp(j*2*pi*f*t));
end