function env_note = adsr ( note )
% This makes the note sound 'smoother'
% It does this by incremently increasing the amplitude from 0 - original
% value. Then it decrements the amplitude until it it is slightly lower
% than the original amplitude. The amplitude stays constant until the end
% of the note where it then decrements down to 0 over some time.
% Below are the parameters that specify the ADSR envelope
Pattack = .2; % Length of attack ( proportion )
Pdecay = .1; % Length of decay ( proportion )
Prelease = .3; % Length of release ( proportion )
Vattack = 1; % Attack maximum value
Vsustain = 0.75; % Sustain value
L = length ( note ) ; % Length of note signal
Lattack = floor ( L * Pattack ) ; % Length of attack
Ldecay = floor ( L * Pdecay ) ; % Length of decay
Lrelease = floor ( L * Prelease ) ; % Legnth of release
Lsustain = L - Lattack - Ldecay - Lrelease ; % length of sustain
% Generate the ADSR portions of the time weights
attack = linspace (0 , Vattack , Lattack ) ;
decay = linspace ( Vattack , Vsustain , Ldecay ) ;
sustain = linspace ( Vsustain , Vsustain , Lsustain ) ;
release = linspace ( Vsustain , 0 , Lrelease ) ;
% Concatenate to get time weight vector
weight = [ attack , decay , sustain , release ];
env_note = weight .* note ; % Apply ADSR envelop to note
end