function [y , Fs ] = timescale ( inputFile , outputFile , scaleFactor )
[y , Fs ] = audioread ( inputFile ) ;
Fs = Fs * scaleFactor ;
audiowrite ( outputFile ,y , Fs ) ;
end