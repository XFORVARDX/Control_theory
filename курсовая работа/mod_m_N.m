function S=mod_m_N(S0)
syms alfa bet;
eps=0.00001 ;
U=alfa^3 + 1.08*alfa^2*bet - 0.4*alfa*bet^2 - bet^3 +1 ;
V=3*alfa^2*bet + 2.16*alfa*bet^2 + 0.4*bet^3;
f1=subs(U,alfa,S0(1))
f2=subs(V,alfa,S0(1))
F=[subs(f1,bet,S0(2)) subs(f2,bet,S0(2))]'
YAK=[diff(U,alfa) diff(U,bet);diff(V,alfa) diff(V,bet)];
YAK1=subs(YAK,alfa,S0(1));
YAK2=subs(YAK1,bet,S0(2));
YAK_obr=YAK2^-1;
S= S0-YAK_obr*F;
while abs(S-S0)>eps
S0=S;
f1=subs(U,alfa,S0(1));
f2=subs(V,alfa,S0(1));
F=[subs(f1,bet,S0(2)) subs(f2,bet,S0(2))]';
S= S0 - YAK_obr*F;
end