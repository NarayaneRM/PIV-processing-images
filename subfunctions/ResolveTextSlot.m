function ResolveTextSlot(folder,veloc,targetLine,frame,select_frames,mask_text_line,format)
    v=ConcatenateVelocFrames(folder,select_frames,mask_text_line);
    arr=unique(v(:,1,1));
    [~,r]=size(targetLine);
    
    for i=1:r
    x_positions(i) = interp1(arr,arr,targetLine(i),'nearest');
    end
    
    U = mean(v, 3); %Calculate Avg Velocity
    ufx= abs(v(:,3,:)-U(:,3)); %Calculate velocity fluctuations for each frame in direction x
    ufy= abs(v(:,4,:)-U(:,4)); %Calculate velocity fluctuations for each frame in direction y
    uf=[v(:,1,:),v(:,2,:),ufx,ufy]; %Concatenate velocity fluctuations for both directions
    I=TurbulenceIntensity(uf,U); %Calculate turbulence intense
    PlotIntensity(I,veloc,format(2)); %Plot turbulence intensity (x direction) vs y direction
    target_leg=cellstr(num2str(targetLine', 'x=%-d m'));
    PlotVelocity(v,veloc,x_positions,frame,mask_text_line,target_leg,format(1)); %Plot velocity (x direction) vs y direction


end