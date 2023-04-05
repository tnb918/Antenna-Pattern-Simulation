%L/lam变化时对称振子的极坐标图和3维方向图变化情况
clc;
close all;
clear all;
lam=1;
theta_1D=0:pi/180:2*pi;
theta_2D=meshgrid(0:pi/180:2*pi);
fai=meshgrid(0:pi/180:2*pi)';
f11=Generate_Symmetric_Oscillators(1/4,lam,theta_1D);
f21=Generate_Symmetric_Oscillators(1/2,lam,theta_1D);
f31=Generate_Symmetric_Oscillators(3/4,lam,theta_1D);
f41=Generate_Symmetric_Oscillators(1,lam,theta_1D);
% 2D极坐标画图
subplot(2,2,1);polarplot(theta_1D,f11,'b');title('L/lam=1/4');
subplot(2,2,2);polarplot(theta_1D,f21,'b');title('L/lam=1/2');
subplot(2,2,3);polarplot(theta_1D,f31,'b');title('L/lam=3/4');
subplot(2,2,4);polarplot(theta_1D,f41,'b');title('L/lam=1');
figure;

f12=Generate_Symmetric_Oscillators(1/4,lam,theta_2D);
f22=Generate_Symmetric_Oscillators(1/2,lam,theta_2D);
f32=Generate_Symmetric_Oscillators(3/4,lam,theta_2D);
f42=Generate_Symmetric_Oscillators(1,lam,theta_2D);
%3D方向图
f1max=max(max(f12));[x1,y1,z1]=sph2cart(fai,pi/2-theta_2D,f12/f1max);
f2max=max(max(f22));[x2,y2,z2]=sph2cart(fai,pi/2-theta_2D,f22/f2max);
f3max=max(max(f32));[x3,y3,z3]=sph2cart(fai,pi/2-theta_2D,f32/f3max);
f4max=max(max(f42));[x4,y4,z4]=sph2cart(fai,pi/2-theta_2D,f42/f4max);
subplot(2,2,1);mesh(x1,y1,z1);title('L/lam=1/4');axis([-1 1 -1 1 -1 1]);
subplot(2,2,2);mesh(x2,y2,z2);title('L/lam=1/2');axis([-1 1 -1 1 -1 1]);
subplot(2,2,3);mesh(x3,y3,z3);title('L/lam=3/4');axis([-1 1 -1 1 -1 1]);
subplot(2,2,4);mesh(x4,y4,z4);title('L/lam=1');axis([-1 1 -1 1 -1 1]);