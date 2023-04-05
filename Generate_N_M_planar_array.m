function f=Generate_N_M_planar_array(N,M,theta,fai,d)
% theta是俯仰角 fine是方位角
lamda=1;  % 波长
% d=lamda/2;   % 阵元间距
% M=10;N=10;     % 8*8的矩阵
% 波束指向角度(theta0,fine0)=（45,180）
theta0=45;
fai0=180;
% theta=1:1:90;   % 俯仰角取值范围
% fai=1:1:360;   % 方位角取值范围
x=d*(0:M-1);
y=d*(0:N-1);
% z=0; % 阵元位置（x，y,z）

r=0;f=[];

for i=1:length(theta)      % 俯仰角取值范围
    for j=1:length(fai)   % 方位角取值范围
        % 64个阵元功率叠加
        for p=1:M  % x
            for q=1:N  % y
                 r=r+exp(1i*2*pi/lamda*(x(p)*(sind(i)*cosd(j)-sind(theta0)*cosd(fai0))+y(q)*(sind(i)*sind(j)-sind(theta0)*sind(fai0))));
            end
        end
        f(i,j)=r; % 将64个阵元的合成场强放到对应的扫描角度上
        r=0;      % 每扫描一个角度时，将上一个角度的64个阵元功率清0
    end
end
f=abs(f);      % 取实部
f=f/max(max(f));
% mesh(fai,theta,f); hold on;
% xlabel('方位角');ylabel('俯仰角');zlabel('方向图');
end
