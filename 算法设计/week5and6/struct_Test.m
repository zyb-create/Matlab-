clc,clear;
patient(1).name = 'John Doe';
patient(1).billing = 127.00;
patient(1).test = [79, 75, 73; 180, 178, 177.5; 220, 210, 205];

patient(2).name = 'Ann Lane';
patient(2).billing = 28.50;
patient(2).test = [68, 70, 68; 118, 118, 119; 172, 170, 169];

[f,index]=sort([patient.billing]);
patient=patient(index);

x={patient(:).name;patient(:).billing};
x=x';
xlswrite('s.xlsx',x,1);
%cell2mat(patient(1).name||.billing);