clc,clear;
% digital(6);
format long g
path1='E:\数据\RUN_00000';
path2='E:\数据\RUN_0000';
no='NO              =';
temp='temperature =';
data=zeros(1,2);
% x=litcount('E:\数据\RUN_000001\reactor_network__gas_turbine_c4.out','NO              =','temperature =');
for i=1:2
    if i<10
        path=strcat(path1,int2str(i),'\reactor_network__gas_turbine_c4.out');
    else
        path=strcat(path2,int2str(i),'\reactor_network__gas_turbine_c4.out');
    end
    x=litcount(path,no,temp);
    data(i,1)=x(1,1);
    data(i,2)=x(1,2);
end
% data=vpa(data,6);


function y = litcount(filename, literal,temp)

fid = fopen(filename, 'r');

y = '';
x='';

while feof(fid) == 0
    tline = fgetl(fid);
    matches = strfind(tline, literal);
    num = length(matches);
    if num > 0
        y=tline;
    end
    if contains(tline,temp)
        x=tline;
    end
end
fclose(fid);
s=sscanf(y,'    NO              =  %s');
t=sscanf(x,'          Peak gas temperature =    %f     K');
% t=sscanf(t,'%f');
% vpa(t,6)
y=vpa(s,6);
y=[y,t];

end

