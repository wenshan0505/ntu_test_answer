close all;clear all


E = 1;EL=[E];
S = 10;SL=[S];
ES = 0;ESL=[ES];
P = 0;PL=[P];
h = 1;
VL = [];
max_time = 1000;%毫秒记


for i =1:1:max_time
    kE1 = fE(E, S, ES, P);
    kS1 = fS(E, S, ES, P);
    kES1 = fES(E, S, ES, P);
    kP1 = fP(E, S, ES, P);
    VL = [VL;fP(E, S, ES, P)];
    kE2 = fE(E+kE1*h/2, S+kS1*h/2, ES+kES1*h/2, P+kP1*h/2);
    kS2 = fS(E+kE1*h/2, S+kS1*h/2, ES+kES1*h/2, P+kP1*h/2);
    kES2 = fES(E+kE1*h/2, S+kS1*h/2, ES+kES1*h/2, P+kP1*h/2);
    kP2 = fP(E+kE1*h/2, S+kS1*h/2, ES+kES1*h/2, P+kP1*h/2);

    kE3 = fE(E+kE2*h/2, S+kS2*h/2, ES+kES2*h/2, P+kP2*h/2);
    kS3 = fS(E+kE2*h/2, S+kS2*h/2, ES+kES2*h/2, P+kP2*h/2);
    kES3 = fES(E+kE2*h/2, S+kS2*h/2, ES+kES2*h/2, P+kP2*h/2);
    kP3 = fP(E+kE2*h/2, S+kS2*h/2, ES+kES2*h/2, P+kP2*h/2);

    kE4 = fE(E+kE3*h, S+kS3*h, ES+kES3*h, P+kP3*h);
    kS4 = fS(E+kE3*h, S+kS3*h, ES+kES3*h, P+kP3*h);
    kES4 = fES(E+kE3*h, S+kS3*h, ES+kES3*h, P+kP3*h);
    kP4 = fP(E+kE3*h, S+kS3*h, ES+kES3*h, P+kP3*h);

    E = E + (h/6)*(kE1 + 2*kE2 + 2*kE3 + kE4);
    EL = [EL;E];
    S = S + (h/6)*(kS1 + 2*kS2 + 2*kS3 + kS4);
    SL = [SL;S];
    ES = ES + (h/6)*(kES1 + 2*kES2 + 2*kES3 + kES4);
    ESL = [ESL;ES];
    P = P + (h/6)*(kP1 + 2*kP2 + 2*kP3 + kP4);
    PL = [PL;P];
end


plot(EL)
hold on
plot(SL)
plot(ESL)
plot(PL)
legend('E','S','ES','P')
xlabel('time/ms')
ylabel('concentration')
hold off
figure

plot(VL)
xlabel('time/ms')
ylabel('velocity V')
VL


function yE = fE(E, S, ES, P)
    k1=100/60000;
    k2=600/60000;
    k3=150/60000;%以毫秒为单位
    yE = k2*ES + k3*ES -k1*E*S;
end


function yES = fES(E, S, ES, P)
    k1=100/60000;
    k2=600/60000;
    k3=150/60000;%以毫秒为单位
    yES = k1*E*S - k2*ES -k3*ES;
end


function yP = fP(E, S, ES, P)
    k1=100/60000;
    k2=600/60000;
    k3=150/60000;%以毫秒为单位
    yP = k3*ES;
end


function yS = fS(E, S, ES, P)
    k1=100/60000;
    k2=600/60000;
    k3=150/60000;%以毫秒为单位
    yS = k2*ES-k1*ES;
end

