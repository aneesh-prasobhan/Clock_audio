clear all;
clc;


%% ReadSound2 = [ 0x1 0x0 0x0 0x0 0x0 0x0 0x1 0x0 0x0 ];

fp = fopen('Westminster_edited.h', 'rt');       %% ENTER FILE NAME HERE
C = textscan(fp, '%s', 'CommentStyle', '#', 'Delimiter', '');
fclose(fp);

C = regexp(C{:}, '\w+', 'match');
C = cellfun(@(x)strrep(x,'0x',''), C, 'UniformOutput', false);
C = cellfun(@(x)hex2dec(x), C, 'UniformOutput', false);
result=cell2mat(C)'
allOneString = sprintf('%d, ' , result);

int_result = uint8(result);     % To convert from double to uint8

final_result = typecast(int_result,'int16')

% result_LSB = int_result(1:2:896894)           % enter the last number of int_result
% result_MSB = int_result(2:2:896894)           % enter the last number of int_result

audiowrite('Westminster_20K_signed16bit_FINAL.wav',final_result,20000,'BitsPerSample',16)        %% ENTER AUDIO O/P FILES NAME HERE WITH SAMPLING RATE AND BITS PER SAMPLE

%audiowrite (audio_test.wav, result, 20000)

%% Looks like sampling rate is around 48000 and there is indeed a lot of noise.

%% Matlab shows a lot of 255 values at the end of the files where there shouldn't be any noise