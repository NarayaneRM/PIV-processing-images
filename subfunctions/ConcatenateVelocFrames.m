function x = ConcatenateVelocFrames(folder,select_frames,mask_text_line)
    cd('PIV_data');
    cd(folder);
    [~,q1]=size(select_frames);
    for w1=1:q1
        if(select_frames(w1)<10)
            file="B0000"+select_frames(w1)+".txt";
        else
            file="B000"+select_frames(w1)+".txt";
        end
        x(:,:,w1)= ReadText(file);
    end
    total_positions=unique(x(:,2,1));
    [~,r1]=size(mask_text_line);
    [r2,~,~]=size(x);
    for i=1:r1
        y_positions(i) = interp1(total_positions,total_positions,mask_text_line(i),'nearest');
    end
    k=1;
    for i=1:r2
        if(x(i,2,1)<y_positions(2) && x(i,2,1)>y_positions(1))
            x_with_mask(k,:,:)=x(i,:,:);
            k=k+1;
        end
    end
    x=x_with_mask;
    cd ..;
    cd ..;
    return;
end