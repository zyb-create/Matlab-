% [x,y]=meshgrid(-25:1:25,-25:1:25);
% 
% z=sqrt(x.^2/4+y.^2/6);
% 
% surf(x,y,z)
% 
% title('����')
% 
% grid off
[x,y]=meshgrid(linspace(-15,15));%�趨xy��Χ
z=sin((x.^2+y.^2).^0.5)./((x.^2+y.^2).^0.5);

figure(1);
surf(x,y,z);
xlabel('X'),ylabel('Y'),zlabel('Z');

% figure(2);
% surf(x,y,z,'LineStyle','none');
% alpha(0.7)%�趨͸����
% xlabel('X'),ylabel('Y'),zlabel('Z');