function createline(XData1, YData1, Parent1)
%CREATELINE(XDATA1, YDATA1, PARENT1)
%  XDATA1:  line xdata
%  YDATA1:  line ydata
%  PARENT1:  line parent

%  Auto-generated by MATLAB on 03-Dec-2017 16:51:32

% Create line
line(XData1,YData1,'Parent',Parent1,'Tag','varmarker','MarkerSize',10,...
    'Marker','>',...
    'LineWidth',7,...
    'Color',[1 0 0]);

