%% ReadSound2 = [ 0x1 0x0 0x0 0x0 0x0 0x0 0x1 0x0 0x0 ];

fp = fopen('Westminster_edited.h', 'rt');       %% ENTER FILE NAME HERE
C = textscan(fp, '%s', 'CommentStyle', '#', 'Delimiter', '');
fclose(fp);

C = regexp(C{:}, '\w+', 'match');
C = cellfun(@(x)strrep(x,'0x',''), C, 'UniformOutput', false);
C = cellfun(@(x)hex2dec(x), C, 'UniformOutput', false);
result=cell2mat(C)'
allOneString = sprintf('%d, ' , result);

int_result = uint8(result)

audiowrite('Westminster.wav',int_result,48000,'BitsPerSample',8)        %% ENTER AUDIO O/P FILES NAME HERE WITH SAMPLING RATE AND BITS PER SAMPLE

%audiowrite (audio_test.wav, result, 20000)

%% Looks like sampling rate is around 48000 and there is indeed a lot of noise.

%% Matlab shows a lot of 255 values at the end of the files where there shouldn't be any noise