function PlotCorrHistogram(data,leg)
    rng(0);
    % generate data for histograms: 1 histogram per column
    edges = [0:0.1:1]; % bin edges
    counts = histc(data, edges, 2); % specify dim 2 to act column-wise
    % plot results
    hf = figure;
    ha = axes;
    hb = bar3(edges, counts.'); % note the transpose to get the colors right
    xlabel('case number');
    ylabel('correlation values');
    zlabel('pixel quantity');
    legend(leg);
    t=title('Correlation Histogram');
    t.FontSize = 12;
    cd('PIV_results');
    savefig('histogram.fig');
    cd ..;
end