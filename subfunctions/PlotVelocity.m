function PlotVelocity(u,veloc,x_positions,frame,mask,target_leg,format)
    [row,~] = find(u(:,1,1)==x_positions(1));
    [lines,~]=size(row);
    k=0;
    for i=1:lines
        if(u(row(i,1),2,frame)>mask(1) && u(row(i,1),2,frame)<mask(2))
            k=k+1;
            A1(k,:)=u(row(i,1),:,frame);
        end
    end
    plot(A1(:,3,1),A1(:,2,1));
    hold on;
    [row,~] = find(u(:,1,1)==x_positions(2));
    [lines,~]=size(row);
    k=0;
    for i=1:lines
        if(u(row(i,1),2,frame)>mask(1) && u(row(i,1),2,frame)<mask(2))
            k=k+1;
            A2(k,:)=u(row(i,1),:,frame);
        end
    end
    plot(A2(:,3,1),A2(:,2,1));
    hold on;
    [row,~] = find(u(:,1,1)==x_positions(3));
    [lines,~]=size(row);
    k=0;
    for i=1:lines
        if(u(row(i,1),2,frame)>mask(1) && u(row(i,1),2,frame)<mask(2))
            k=k+1;
            A3(k,:)=u(row(i,1),:,frame);
        end
    end
    plot(A3(:,3,1),A3(:,2,1));
    hold on;
    t=title('Velocity profile');
    t.FontSize=12;
    subtitle(veloc);
    xlabel('Velocity Vx (m/s)');
    ylabel('Y position (mm)');
    legend(target_leg,'Location','best outside');
    grid on;
    cd('PIV_results');
    ax = gca;
    exportgraphics(ax,format)
    cd ..;
    hold off;
end