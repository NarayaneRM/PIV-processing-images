function [meanCorr,stdCorr,pixel_corr]=ResolveImageSlot(file,select_frames,mask_image_pixel)
    corr_vx=ConcatenateCorrFrames(file,select_frames,mask_image_pixel);
    mean_corr_vx=mean(corr_vx,3);
    meanCorr=mean(mean(mean(corr_vx,3),2),1);
    stdCorr=std(std(std(corr_vx)));
    pixel_corr=reshape(mean_corr_vx.',1,[]);
    return;
end