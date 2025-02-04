clf; clear all;
figure

X=linspace(-1,100,1000);
a=5;
s0=5e-9;
s=s0;
t=0.1
  s=s0.*sqrt(1+t.^2);
                R=cos(atan(t)./2)
                Amp1=(pi.^(.25).*(s0+s0.*t.^2).^(.5));
                Gauss1=exp(-(X-a.*t).^2./(2.*(1+t.^2)));
                psi = R./Amp1.*Gauss1.*cos((2.*a.*X+t.*(X.^2-a.^2))./(2.*(1+t.^2)));

%psi2=1./(sqrt(pi).*s).*exp(-(X-a.*t).^2/(1.*(1+t.^2)))
l=max(psi)
clc;

h=plot(X,psi)
axis([0 100 -l l])
while ishandle(h)
    for t=linspace(0.1,20,100)
        psi = R./(pi.^(.25).*(s0+s0.*t.^2).^(.5)).*exp(-(X-a.*t).^2./(2.*(1+t.^2))).*cos((2.*a.*X+t.*(X.^2-a.^2))./(2.*(1+t.^2)));
        set(h,'YData',psi)
        pause(0.05)
    end
end
