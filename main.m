%%
clear
clc
close all

%% Zero Image Processing and Feature Measurements
Z = getNumbers('mnist_train0.jpg');
Areas = arrayfun(@(a) getRegionProps(a.nums,'Area'),Z);
FilledAreas = arrayfun(@(a) getRegionProps(a.nums,'FilledArea'),Z);
Perimeters = arrayfun(@(a) getRegionProps(a.nums,'Perimeter'),Z);
Eccentricity = arrayfun(@(a) getRegionProps(a.nums,'Eccentricity'),Z);
Orientation = arrayfun(@(a) getRegionProps(a.nums,'Orientation'),Z);
Circularity = (4*pi*Areas)./(Perimeters.^2);
MinorAxis = arrayfun(@(a) getRegionProps(a.nums,'MinorAxisLength'),Z);

%% One Image Processing and Feature Measurements
O = getNumbers('mnist_train1.jpg');
OnesAreas = arrayfun(@(a) getRegionProps(a.nums,'Area'),O);
OnesFilledAreas = arrayfun(@(a) getRegionProps(a.nums,'FilledArea'),O);
OnesPerimeters = arrayfun(@(a) getRegionProps(a.nums,'Perimeter'),O);
OnesEccentricity = arrayfun(@(a) getRegionProps(a.nums,'Eccentricity'),O);
OnesCircularity = (4*pi*OnesAreas)./(OnesPerimeters.^2);
OnesMinorAxis = arrayfun(@(a) getRegionProps(a.nums,'MinorAxisLength'),O);

%% Two Image Processing and Feature Measurements
T = getNumbers('mnist_train2.jpg');
TwosAreas = arrayfun(@(a) getRegionProps(a.nums,'Area'),T);
TwosFilledAreas = arrayfun(@(a) getRegionProps(a.nums,'FilledArea'),T);
TwosPerimeters = arrayfun(@(a) getRegionProps(a.nums,'Perimeter'),T);
TwosOrientation = arrayfun(@(a) getRegionProps(a.nums,'Orientation'),T);
TwosCircularity = (4*pi*TwosAreas)./(TwosPerimeters.^2);
TwosMinorAxis = arrayfun(@(a) getRegionProps(a.nums,'MinorAxisLength'),T);

%% Zero vs One Histograms
figure(1)
histogram(Areas)
hold on
histogram(OnesAreas)
hold off
legend('Zeros','Ones');
xlabel('Area (sq. px)');
ylabel('Frequency');
title('Zeros and Ones Area Feature Shape Measurement Histograms');

figure(2)
histogram(Perimeters)
hold on
histogram(TwosMinorAxis)
hold off
legend('Zeros','Ones');
xlabel('Perimeter (px)');
ylabel('Frequency');
title('Zeros and Ones Perimeter Feature Shape Measurement Histograms');

figure(3)
histogram(MinorAxis)
hold on
histogram(OnesMinorAxis)
hold off
legend('Zeros','Ones');
xlabel('Minor Axis Length (px)');
ylabel('Frequency');
title('Zeros and Ones Minor Axis Length Feature Shape Measurement Histograms');

%% Zero vs One Scatter Plot
figure(4)
scatter(Areas, MinorAxis,'.');
hold on;
scatter(OnesAreas,OnesMinorAxis,'.');
hold off;
legend('Zeros','Ones');
xlabel('Area (sq. px)');
ylabel('Minor Axis Length (px)');
title('Zeros and Ones Minor Axis Length vs Area Classifier Scatter Plots')

%% Zero vs Two Histograms
figure(5)
histogram(Perimeters);
hold on;
histogram(TwosPerimeters);
hold off;
legend('Zeros','Twos');
xlabel('Perimeter (px)')
ylabel('Frequency');
title('Zeros and Twos Perimeter Feature Shape Measurement Histograms');

figure(6)
histogram(FilledAreas);
hold on;
histogram(TwosFilledAreas);
hold off;
legend('Zeros','Twos');
xlabel('Filled Area (sq. px)')
ylabel('Frequency');
title('Zeros and Twos Filled Area Feature Shape Measurement Histograms');

figure(7)
histogram(Areas);
hold on;
histogram(TwosAreas);
hold off;
legend('Zeros','Twos');
xlabel('Area (px)')
ylabel('Frequency');
title('Zeros and Twos Area Feature Shape Measurement Histograms');

figure(8)
histogram(Circularity);
hold on;
histogram(TwosCircularity);
hold off;
legend('Zeros','Twos');
xlabel('Circularity')
ylabel('Frequency');
title('Zeros and Twos Circularity Feature Shape Measurement Histograms');

figure(9)
histogram(MinorAxis);
hold on;
histogram(TwosMinorAxis);
hold off;
legend('Zeros','Twos');
xlabel('Minor Axis Length (px)')
ylabel('Frequency');
title('Zeros and Twos Minor Axis Length Feature Shape Measurement Histograms');

%% Zero vs Two Scatter Plot
figure(10)
scatter(Perimeters, FilledAreas, '.');
hold on;
scatter(TwosPerimeters, TwosFilledAreas, '.');
hold off;
legend('Zeros','Twos');
xlabel('Perimeter (px)')
ylabel('Filled Area (sq. px)')
title('Zeros and Twos Filled Area vs Perimeter Classifier Scatter Plots')
