%%
clear
clc
close all
%%
Z = getNumbers('mnist_train0.jpg');
Area = arrayfun(@(a) getRegionProps(a.nums,'Area'),Z);
perimeters = arrayfun(@(a) getRegionProps(a.nums,'Perimeter'),Z);
Eccentricity = arrayfun(@(a) getRegionProps(a.nums,'Eccentricity'),Z);
Orientation = arrayfun(@(a) getRegionProps(a.nums,'Orientation'),Z);
Circularity = (4*pi*Area)./(perimeters.^2);
MinorAxis = arrayfun(@(a) getRegionProps(a.nums,'MinorAxisLength'),Z);
%%
O = getNumbers('mnist_train1.jpg');
OnesAreas = arrayfun(@(a) getRegionProps(a.nums,'Area'),O);
OnesPerimeters = arrayfun(@(a) getRegionProps(a.nums,'Perimeter'),O);
OnesEccentricity = arrayfun(@(a) getRegionProps(a.nums,'Eccentricity'),O);
OnesCircularity = (4*pi*OnesAreas)./(OnesPerimeters.^2);
OnesMinorAxis = arrayfun(@(a) getRegionProps(a.nums,'MinorAxisLength'),O);
%%
T = getNumbers('mnist_train2.jpg');
TwosAreas = arrayfun(@(a) getRegionProps(a.nums,'Area'),T);
TwosPerimeters = arrayfun(@(a) getRegionProps(a.nums,'Perimeter'),T);
TwosOrientation = arrayfun(@(a) getRegionProps(a.nums,'Orientation'),T);
TwosCircularity = (4*pi*TwosAreas)./(TwosPerimeters.^2);
TwosMinorAxis = arrayfun(@(a) getRegionProps(a.nums,'MinorAxisLength'),T);
%%
figure(10)
histogram(Circularity)
hold on
histogram(OnesCircularity)
hold off
legend('zeros','ones');
%%
figure(11)
histogram(Area)
hold on
histogram(OnesAreas)
hold off
legend('zeros','ones');
%%
figure(12)
histogram(perimeters)
hold on
histogram(OnesPerimeters)
hold off
legend('zeros','ones');
%%
figure(13)
scatter(perimeters,Circularity,'.');
hold on;
scatter(OnesPerimeters,OnesCircularity,'.');
hold off;
%%
figure(14)
scatter(Area,MinorAxis,'.');
hold on;
scatter(OnesAreas,OnesMinorAxis,'.');
hold off;
legend('zeros','ones');
xlabel('Area')
ylabel('MinorAxisLength');
%%
figure(14)
scatter(Orientation,Circularity,'.');
hold on;
scatter(TwosOrientation,TwosCircularity,'.');
hold off;
legend('zeros','twos');
xlabel('Area')
ylabel('MinorAxisLength');