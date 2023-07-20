function x=FormatData(txt)
    %Correct first line
    fid = fopen(txt, 'r'); % Open source file.
    fgetl(fid) ;% Read/discard line.
    buffer = fread(fid, Inf) ;% Read rest of the file.
    fclose(fid);
    fid = fopen('buffer_file.txt', 'w');% Open destination file.
    fwrite(fid, buffer);% Save to file.
    fclose(fid);    
    %Read text data
    file_truncated='buffer_file.txt';
    T= readtable(file_truncated, 'Format', 'auto');
    %Format as number considering commas
    for i=1:4
        T.(i) = NumForComma(string(T{:,i}));
    end
    x=[T.Var1, T.Var2, T.Var3,T.Var4];
    return;
end