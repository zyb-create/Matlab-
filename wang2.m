clear
clc
i0=5.83;r=0.367;pg=7;   %主减速器传动比，车轮半径，
n=[815 1207 1614 2012 2603 3006 3403 3804]';
b=zeros(length(n),1);
ig=[5.56 2.769 1.644 1.00 0.793]';
   %拟合系数矩阵，每个转速对应一列
B=[1326.8 1354.7 1284.4 1122.9 1141.0 1051.2 1233.9 1129.7;
    -416.46 -303.98 -189.75 -121.59 -98.893 -73.714 -84.478 -45.291;
    72.379 36.657 14.524 7.0035 4.4763 2.8593 2.9788 0.71113;
    -5.8629 -2.0553 -0.51184 -0.18517 -0.091077 -0.05138 -0.047449 -0.00075215;
    0.17768 0.043072 0.0068164 0.0018555 0.00068906 0.00035032 0.00028230 -0.000038568];
 for m=4:5
     Ig=ig(m);
     ua=zeros(8,1);
     pe=zeros(8,1);
     for j=1:8
        ua(j)=0.377*n(j)*r/Ig/i0;
        f=494.312+0.131*ua(j)^2;
        pe(j)=f*ua(j)/3600;
        b(j)=B(1,j)+B(2,j)*pe(j)+B(3,j)*pe(j)^2+B(4,j)*pe(j)^3+B(5,j)*pe(j)^4;
     end
      b=b';
      nn=600:0.01:4000;           %连续转速区间
      bb=interp1(n,b,nn,'spline');         %对油耗b进行三次样条插值
      ttt=(4000-600)/size(nn,2);
      for i=1:8
         %Qs(i)=sum((pe(i)*bb(1,(i-1)*42498+1:i*42498)/ua(i)/pg/1.02).*0.0001);
         Q=(pe(i)*bb(1,(i-1)*42498+1:i*42498)/ua(i)/pg/1.02);
         Qs(i)=(Q(1)+Q(size(Q,2)))/2;
      end
%       Qs=(pe).*bb./(ua)./pg/1.02;         %百公里油耗 
      disp('档位=');
      disp(m);
      plot(ua,Qs);
      xlabel('车速');ylabel('百公里油耗');title('等速百公里油耗曲线');
      if m==4
          text(60,16,'档位=4');
      else
          text(60,12,'档位=5');
      end
      
      hold on;
  end