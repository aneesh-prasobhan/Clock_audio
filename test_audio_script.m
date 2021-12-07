%% ReadSound2 = [ 0x1 0x0 0x0 0x0 0x0 0x0 0x1 0x0 0x0 ];

fp = fopen('Westminster_edited.h', 'rt');
C = textscan(fp, '%s', 'CommentStyle', '#', 'Delimiter', '');
fclose(fp);

C = regexp(C{:}, '\w+', 'match');
C = cellfun(@(x)strrep(x,'0x',''), C, 'UniformOutput', false);
C = cellfun(@(x)hex2dec(x), C, 'UniformOutput', false);
result=cell2mat(C)'
allOneString = sprintf('%d, ' , result)

%audiowrite (audio_test.wav, result, 20000)