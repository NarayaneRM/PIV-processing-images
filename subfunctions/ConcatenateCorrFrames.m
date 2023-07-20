function x=ConcatenateCorrFrames(folder,select_frames,mask_image_pixel)
    cd('PIV_data');
    cd(folder);
    addpath(genpath('../'));
    [~,q]=size(select_frames);
    for w=1:q
        if(select_frames(w)<10)
            file="B0000"+select_frames(w)+".png";
        else
            file="B000"+select_frames(w)+".png";
        end
        x(:,:,w)= ReadImage(file);
    end
    %putting a mask
    y_top=mask_image_pixel(1);
    y_bottom=mask_image_pixel(2);
    x_left=mask_image_pixel(3);
    x_right=mask_image_pixel(4);
    x_with_mask=x(y_top:y_bottom,x_left:x_right,:);
    x=x_with_mask;
    cd ..;
    cd ..;
    return;
end