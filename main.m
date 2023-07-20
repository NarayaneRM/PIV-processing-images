function v_main()
addpath(genpath('subfunctions'));
addpath(genpath('../PIV_data'));
mkdir('PIV_results');

%-----------------------------Input of each slot---------------------------

velocity_test=[10 20 40 60 80 100]; %list the velocities of each experiment
slot_test= [ 1 1 1 1 1 1]; %list the respective slot of each experiment
%lsi
data_test= [ datetime(2023,7,7) 
    datetime(2023,7,7) 
    datetime(2023,7,7) 
    datetime(2023,7,7) 
    datetime(2023,7,7) 
    datetime(2023,7,7)];
select_frames=[1:1:28];
mask_text_line=[-3,44];
mask_image_pixel=[87,684,8,1025];
targetLine=[-20,0,20];
analyse_frame=[12 13 17 14 19 16];

%--------------------------------------------------------------------------

[~,Nslots]=size(velocity_test);
for a=1:Nslots
    if(velocity_test(a)<100)
        txt(a,:) = "Txt_Velocity_V=0" + velocity_test(a) + "_Slot"+ slot_test(a);
        img(a,:) = "Img_Correlation_V=0" + velocity_test(a) + "_Slot"+ slot_test(a);
        save_format(a,:,1)=["Vx_V=0" + velocity_test(a) + "_Slot"+ slot_test(a) + ".png"];
        save_format(a,:,2)=["Ix_V=0" + velocity_test(a) + "_Slot"+ slot_test(a) + ".png"];
    else
        txt(a,:) = "Txt_Velocity_V=" + velocity_test(a) + "_Slot"+ slot_test(a);
        img(a,:) = "Img_Correlation_V=" + velocity_test(a) + "_Slot"+ slot_test(a);
        save_format(a,:,1)=["Vx_V=" + velocity_test(a) + "_Slot"+ slot_test(a) + ".png"];
        save_format(a,:,2)=["Ix_V=" + velocity_test(a) + "_Slot"+ slot_test(a) + ".png"];
    end
    leg(a,:)="V="+velocity_test(a)+" m/s" + "  Slot=" + slot_test(a) + "  Date=" + datestr(data_test(a));
    %ResolveTextSlot(txt(a,:),leg(a,:), targetLine,analyse_frame(a),select_frames,mask_text_line, save_format(a,:,:));
    %StatusUpdate="Correlat_V=0" + velocity_test(a) + "_Slot"+ slot_test(a) + " complete"
    %[meanCorr(:,a),stdCorr(:,a),pixel_corr(a,:)]=ResolveImageSlot(img(a,:),select_frames,mask_image_pixel);
    %StatusUpdate="Velocity_V=0" + velocity_test(a) + "_Slot"+ slot_test(a) + " complete"

end
PlotMeanCorr(velocity_test,meanCorr,stdCorr,leg);
PlotCorrHistogram(pixel_corr,leg);

end