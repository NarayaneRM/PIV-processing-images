function PlotMeanCorr(x_values, y_values,err,leg)
    [~,d]=size(x_values);
    for index=1:d
        errorbar(x_values(index),y_values(index),err(index),'o');
        hold on;
    end
    t=title('Mean Correlation');
    t.FontSize = 12;
    grid on;
    legend(leg, 'Location','best outside');
    hold off;
    cd('PIV_results');
    ax = gca;
    exportgraphics(ax,'mean_correlation.png');
    cd ..;
end