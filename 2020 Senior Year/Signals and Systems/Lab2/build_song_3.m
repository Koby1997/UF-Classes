function x = build_song_3 ( keys, Xs, start_times, end_times, fs )
% build_song : Sort of concatinates multiple sinusoids over time into one
% long vector in order to create a song. Continually uses the
% key_to_musical_note function to create each sinusoid. This also uses the 
% adsr function on each not to make it sound smoother.
%
% Input Args :
% keys : A length - N vector of key / note numbers , where
% N = number of notes in song
% Xs : A length - N vector of phasors
% harmonics : a vector containing the harmonics used in each note
% start_times : A length - N vector of start times of notes
% ( in seconds )
% start_times : A length - N vector of end times of notes
% ( in seconds )
% fs : A scalar indicating the sampling rate ( in Hz )
%
% Output :
% x : A vector that holds the signal samples of the song built

    len_in_samples = ceil ( max ( end_times ) * fs ) + 1;
    x = zeros (1 , len_in_samples ) ;

    for count = 1:length(keys)
        note = key_to_musical_note(keys (count), Xs, end_times (count) - start_times (count),fs);
        note = adsr(note);
        start_in_samples = round(start_times(count) * fs ) + 1;
        end_in_samples = start_in_samples + length(note) - 1;
        x(start_in_samples : end_in_samples) = x(start_in_samples : end_in_samples) + note;    
    end

end