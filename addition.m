clc;
clear all;
close all;
% posai=-5:0.01:5;
% plot(posai,F(2,posai),posai,F(3,posai),posai,F(5,posai),posai,F(10,posai));
% legend('N=2','N=3','N=5','N=10');xlabel('posai');ylabel('F(posai)')
% title('N元均匀直线阵归一化因子随posai变化曲线');

%面阵因子平面增益
a=0:1:90;b=0:1:360;
%改变阵元数
f1=Generate_N_M_planar_array(2,2,a,b,1/2);
f2=Generate_N_M_planar_array(5,5,a,b,1/2);
f3=Generate_N_M_planar_array(8,8,a,b,1/2);
f4=Generate_N_M_planar_array(12,12,a,b,1/2);

plot(a,10*log10(f1(:,floor(length(b)/2))),a,10*log10(f2(:,floor(length(b)/2))),a,10*log10(f3(:,floor(length(b)/2))),a,10*log10(f4(:,floor(length(b)/2))));
xlabel('俯仰角');ylabel('增益/dB');axis([0 90 -50 0]);
legend('M*N=2*2','M*N=5*5','M*N=8*8','M*N=12*12');figure;
plot(b,10*log10(f1(floor(length(a)/2),:)),b,10*log10(f2(floor(length(a)/2),:)),b,10*log10(f3(floor(length(a)/2),:)),b,10*log10(f4(floor(length(a)/2),:)));
xlabel('方位角');ylabel('增益/dB');axis([0 360 -80 0]); 
legend('M*N=2*2','M*N=5*5','M*N=8*8','M*N=12*12');figure;
 
%改变阵元间距
f5=Generate_N_M_planar_array(8,8,a,b,1/0.5);
f6=Generate_N_M_planar_array(8,8,a,b,1/1);
f7=Generate_N_M_planar_array(8,8,a,b,1/2);
f8=Generate_N_M_planar_array(8,8,a,b,1/8);
plot(a,10*log10(f5(:,floor(length(b)/2))),a,10*log10(f6(:,floor(length(b)/2))),a,10*log10(f7(:,floor(length(b)/2))),a,10*log10(f8(:,floor(length(b)/2))));
xlabel('俯仰角');ylabel('增益/dB');axis([0 90 -50 0]);
legend('d/lam=2','d/lam=1','d/lam=1/2','d/lam=1/8');figure;
plot(b,10*log10(f5(floor(length(a)/2),:)),b,10*log10(f6(floor(length(a)/2),:)),b,10*log10(f7(floor(length(a)/2),:)),b,10*log10(f8(floor(length(a)/2),:)));
xlabel('方位角');ylabel('增益/dB');axis([0 360 -80 0]); 
legend('d/lam=2','d/lam=1','d/lam=1/2','d/lam=1/8');

function f=F(n,posai)
f=abs((sin(n*posai/2))./(n*sin(posai/2)));
end
