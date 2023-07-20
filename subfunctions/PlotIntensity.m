function PlotIntensity(I,velocity, format)
    plot(I(:,3),I(:,2));
    t=title('Turbulence Intensity profile');
    t.FontSize=12;
    subtitle(velocity);
    xlabel('Turbulence Intensity Ix (%)');
    ylabel('Y position (mm)');
    cd('PIV_results');
    ax = gca;
    exportgraphics(ax,format);
    cd ..;
end