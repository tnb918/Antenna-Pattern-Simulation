clc;
close all;
clear all;
global theta_1D theta_2D k lam beta fai a b;
theta_1D=0:pi/180:2*pi;
theta_2D=meshgrid(0:pi/180:2*pi);
k=1/2;lam=1;beta=pi/2;
fai=meshgrid(0:pi/180:2*pi)';
a=0:1:90;b=0:1:360;

%%%%%%%%%%线阵*对称振子的极坐标图和三维方向图 改变阵元间距、阵元数目%%%%%%%%%%
% subplot(2,4,1);F(0.1,5,2,2,1/2,0); %'2,2,1/2' case0用不到随便设
% subplot(2,4,2);F(0.3,5,2,2,1/2,0);
% subplot(2,4,3);F(0.5,5,2,2,1/2,0);
% subplot(2,4,4);F(1.0,5,2,2,1/2,0);
% subplot(2,4,5);F(0.1,5,2,2,1/2,1);
% subplot(2,4,6);F(0.3,5,2,2,1/2,1);
% subplot(2,4,7);F(0.5,5,2,2,1/2,1);
% subplot(2,4,8);F(1.0,5,2,2,1/2,1);
% figure;
% subplot(2,4,1);F(0.5,3,2,2,1/2,0);
% subplot(2,4,2);F(0.5,5,2,2,1/2,0);
% subplot(2,4,3);F(0.5,10,2,2,1/2,0);
% subplot(2,4,4);F(0.5,14,2,2,1/2,0);
% subplot(2,4,5);F(0.5,3,2,2,1/2,1);
% subplot(2,4,6);F(0.5,5,2,2,1/2,1);
% subplot(2,4,7);F(0.5,10,2,2,1/2,1);
% subplot(2,4,8);F(0.5,14,2,2,1/2,1);
%%%%%%%%%% N元均匀直线阵的极坐标图和三维方向图 改变阵元间距、阵元数目%%%%%%%%%
% subplot(2,4,1);F(0.1,5,2,2,1/2,3); 
% subplot(2,4,2);F(0.3,5,2,2,1/2,3);
% subplot(2,4,3);F(0.5,5,2,2,1/2,3);
% subplot(2,4,4);F(1.0,5,2,2,1/2,3);
% subplot(2,4,5);F(0.1,5,2,2,1/2,4);
% subplot(2,4,6);F(0.3,5,2,2,1/2,4);
% subplot(2,4,7);F(0.5,5,2,2,1/2,4);
% subplot(2,4,8);F(1.0,5,2,2,1/2,4);
% figure;
% subplot(2,4,1);F(0.5,3,2,2,1/2,3);
% subplot(2,4,2);F(0.5,5,2,2,1/2,3);
% subplot(2,4,3);F(0.5,10,2,2,1/2,3);
% subplot(2,4,4);F(0.5,14,2,2,1/2,3);
% subplot(2,4,5);F(0.5,3,2,2,1/2,4);
% subplot(2,4,6);F(0.5,5,2,2,1/2,4);
% subplot(2,4,7);F(0.5,10,2,2,1/2,4);
% subplot(2,4,8);F(0.5,14,2,2,1/2,4);

%%%%%%%%%% 面阵*对称振子的三维方向图 改变阵元间距、阵元数目%%%%%%%%%
% subplot(2,4,1);F(1,5,2,2,1/2,2); 
% subplot(2,4,2);F(1,5,5,5,1/2,2);
% subplot(2,4,3);F(1,5,8,8,1/2,2);
% subplot(2,4,4);F(1,5,12,12,1/2,2);
% subplot(2,4,5);F(1,5,8,8,1/0.5,2);
% subplot(2,4,6);F(1,5,8,8,1/1,2);
% subplot(2,4,7);F(1,5,8,8,1/2,2);
% subplot(2,4,8);F(1,5,8,8,1/8,2);

%%%%%%%%% N元均匀平面阵的三维方向图 改变阵元间距、阵元数目%%%%%%%%%
% subplot(2,4,1);F(1,5,2,2,1/2,5); 
% subplot(2,4,2);F(1,5,5,5,1/2,5);
% subplot(2,4,3);F(1,5,8,8,1/2,5);
% subplot(2,4,4);F(1,5,12,12,1/2,5);
% subplot(2,4,5);F(1,5,8,8,1/0.5,5);
% subplot(2,4,6);F(1,5,8,8,1/1,5);
% subplot(2,4,7);F(1,5,8,8,1/2,5);
% subplot(2,4,8);F(1,5,8,8,1/8,5);

% F(0.5,5,5,8,8,1/2);
%d-阵元间距 n、M、N-阵元数 l-均匀面阵阵元间距
function [f1,f2,f3,x,y,z]=F(d,n,M,N,l,s) 
global theta_1D theta_2D k lam beta fai a b;
f11=Generate_N_linear_array(lam,beta,d,theta_1D,n);
f12=Generate_Symmetric_Oscillators(k,lam,theta_1D);
f1=f11.*f12;
f21=Generate_N_linear_array(lam,beta,d,theta_2D,n);
f22=Generate_Symmetric_Oscillators(k,lam,theta_2D);
f2=f21.*f22;
f2max=max(max(f2));[x1,y1,z1]=sph2cart(fai,pi/2-theta_2D,f2/f2max);
f21max=max(max(f21));[x2,y2,z2]=sph2cart(fai,pi/2-theta_2D,f21/f21max);

f31=Generate_Symmetric_Oscillators(k,lam,theta_1D);
f32=Generate_N_M_planar_array(M,N,a,b,l);
f3=f31.*f32;
switch(s)
    case 0 %线阵*对称振子 极坐标图
        polarplot(theta_1D,f1,'b');title(sprintf('d=%.2f,n=%d',d,n));
    case 1 %线阵*对称振子 三维方向图
        mesh(x1,y1,z1);title(sprintf('d=%.2f,n=%d',d,n));axis([-1 1 -1 1 -1 1]); 
    case 2 %面阵*对称振子 三维方向图
        mesh(b,a,f3); hold on;xlabel('方位角');ylabel('俯仰角');zlabel('方向图');title(sprintf('MxN=%dx%d,d=%.3f',M,N,l));
    case 3 %线阵极坐标图
        polarplot(theta_1D,f11,'b');title(sprintf('d=%.2f,n=%d',d,n));   
    case 4 %线阵三维方向图
        mesh(x2,y2,z2);title(sprintf('d=%.2f,n=%d',d,n));axis([-1 1 -1 1 -1 1]); 
    case 5 %面阵三维方向图
        mesh(b,a,f32); hold on;xlabel('方位角');ylabel('俯仰角');zlabel('方向图');title(sprintf('MxN=%dx%d,d=%.3f',M,N,l));
%     case 6 %面阵平面增益
%         plot(a,10*log10(f32(:,floor(length(b)/2))));xlabel('俯仰角');ylabel('增益/dB');axis([0 90 -80 0]);figure
%         plot(b,10*log10(f32(floor(length(a)/2),:)));xlabel('方位角');ylabel('增益/dB');axis([0 360 -80 0]);   
end
end