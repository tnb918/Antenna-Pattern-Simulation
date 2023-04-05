function f=Generate_Symmetric_Oscillators(k,lam,theta)
alpha=2*pi./lam;
L=lam*k;
f=abs((cos(alpha*L*cos(theta))-cos(alpha*L))./sin(theta));
end