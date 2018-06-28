x=[3.71e-03,
   1.85e-03,
   9.22e-04,
   4.60e-04,
   2.30e-04,
   1.15e-04]

y=[9.42e-04, 
   4.69e-04, 
   2.34e-04, 
   1.17e-04, 
   5.83e-05, 
   2.92e-05]

figure
%gradient(x,y)
%hold on
heatmap(x,y,'Colormap',jet)
pause
