function f=Generate_N_linear_array(lam,beta,d,theta,n)
k=2*pi/lam;
posai=beta+k*d*sin(theta);
f1=abs(sin(n*posai/2));
f2=abs(n*sin(posai/2));
f=f1./f2;
end