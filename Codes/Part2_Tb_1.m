clc;
clear;

N = 100;   %No. of bits
n=10;      %No. of values of t vector between each 2 bits
A = 1;
X = randi([0 1],1,N);
Tb = 1;
R = 400;
Td = unifrnd(0,Tb, 1, R);  
Td = round(Td.*10)./10;
t = -(N*Tb)/2: 0.1: (N*Tb)/2;

%Searching for the index of the time shift
for i = 1:R
    for j = 1:n
        if(t(j) - Td(i) == -(N*Tb)/2)
            d(i) = j;
        end
    end
end


%Polar NRZ process
for i = 1:R
    XPNRZ(i, :) = zeros(1,length(t)); 
    for j = 0: (N-1)
        if X(j+1) == 1
            if (((j+1)*n)+d(i) <= length(t))
                
                XPNRZ(i, ((j*n)+ 1 + d(i)):((j+1)*n)+d(i)) = A;
            else
                XPNRZ(i, ((j*n)+ 1 + d(i)):length(t)) = A;
            end
        else
            if (((j+1)*n)+d(i) <= length(t))
                XPNRZ(i, ((j*n)+ 1 + d(i)):((j+1)*n)+d(i)) = -A;
            else
                XPNRZ(i, ((j*n)+ 1 + d(i)):length(t)) = -A;
            end
        end
    end
end
writematrix(XPNRZ, "PNRZ(1).txt");
writematrix(t, "TPNRZ(1).txt");


%Unipolar NRZ process
for i = 1:R
    XUNRZ(i, :) = zeros(1,length(t)); 
    for j = 0: (N-1)
        if X(j+1) == 1
            if (((j+1)*n)+d(i) <= length(t))
                
                XUNRZ(i, ((j*n)+ 1 + d(i)):((j+1)*n)+d(i)) = A;
            else
                XUNRZ(i, ((j*n)+ 1 + d(i)):length(t)) = A;
            end
        else
            if (((j+1)*n)+d(i) <= length(t))
                XUNRZ(i, ((j*n)+ 1 + d(i)):((j+1)*n)+d(i)) = 0;
            else
                XUNRZ(i, ((j*n)+ 1 + d(i)):length(t)) = 0;
            end
        end
    end
end
writematrix(XUNRZ, "UNRZ(1).txt");
writematrix(t, "TUNRZ(1).txt");


%Manchester process
for i = 1:R
    XMAN(i, :) = zeros(1,length(t)); 
    for j = 0: (N-1)
        if X(j+1) == 1
            if (((j+0.5)*n)+d(i) <= length(t))
                XMAN(i, ((j*n)+ 1 + d(i)):((j+0.5)*n)+d(i)) = A;
                if (((j+1)*n)+d(i) <= length(t))
                    XMAN(i, ((j+0.5)*n)+d(i):((j+1)*n)+d(i)) = -A;
                else
                    XMAN(i, ((j+0.5)*n)+d(i):length(t)) = -A; 
                end    
            else
                XMAN(i, ((j*n)+ 1 + d(i)):length(t)) = A;
            end
        else
            if (((j+0.5)*n)+d(i) <= length(t))
                XMAN(i, ((j*n)+ 1 + d(i)):((j+0.5)*n)+d(i)) = -A;
                if (((j+1)*n)+d(i) <= length(t))
                    XMAN(i, ((j+0.5)*n)+d(i):((j+1)*n)+d(i)) = A;
                else
                    XMAN(i, ((j+0.5)*n)+d(i):length(t)) = A; 
                end    
            else
                XMAN(i, ((j*n)+ 1 + d(i)):length(t)) = -A;
            end
        end
    end
end
writematrix(XMAN, "MAN(1).txt");
writematrix(t, "TMAN(1).txt");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Ensemble ACF
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Polar NRZ process
[r1, c1] = size(XPNRZ);
En_PNRZ = zeros(1, c1);                        
for i = 0: c1 - 1
    tempv1 = mean((XPNRZ(:, [1: c1 - i]).* XPNRZ(:, [i+1: c1]))');
    En_PNRZ(i+1)=  mean(tempv1');
end
negside1 = fliplr(En_PNRZ);
Double_ACF1 = [negside1 En_PNRZ];                   
taw1 = (linspace(-c1, c1, 2*c1)).* (t(2) - t(1));


%Unipolar NRZ process
[r1, c1] = size(XUNRZ);
En_UNRZ = zeros(1, c1);                        
for i = 0: c1 - 1
    tempv1 = mean((XUNRZ(:, [1: c1 - i]).* XUNRZ(:, [i+1: c1]))');
    En_UNRZ(i+1)=  mean(tempv1');
end
negside2 = fliplr(En_UNRZ);
Double_ACF2 = [negside2 En_UNRZ]; 


%Manchester process
[r1, c1] = size(XMAN);
En_MAN = zeros(1, c1);                        
for i = 0: c1 - 1
    tempv1 = mean((XMAN(:, [1: c1 - i]).* XMAN(:, [i+1: c1]))');
    En_MAN(i+1)=  mean(tempv1');
end
negside3 = fliplr(En_MAN);
Double_ACF3 = [negside3 En_MAN]; 

figure("Name","Ensemble ACF at Tb = 1 sec");
subplot(3, 1, 1); plot(taw1, Double_ACF1); xlabel('Taw(sec)');ylabel('Ensemble ACF'); xlim([-10 10]); 
title('Ensemble ACF of PNRZ Process at Tb = 1 sec'); grid on; 

subplot(3, 1, 2); plot(taw1, Double_ACF2); xlabel('Taw(sec)');ylabel('Ensemble ACF'); xlim([-10 10]); 
title('Ensemble ACF of UNRZ Process at Tb = 1 sec'); grid on; 

subplot(3, 1, 3); plot(taw1, Double_ACF3); xlabel('Taw(sec)');ylabel('Ensemble ACF'); xlim([-10 10]); 
title('Ensemble ACF of Manchester Process at Tb = 1 sec'); grid on; 



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%PSD 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs = 100;
f = linspace(-fs/2, fs/2, length(Double_ACF1));
PSD1 = fftshift(fft(Double_ACF1))./ length(Double_ACF1);
PSD2 = fftshift(fft(Double_ACF2))./ length(Double_ACF2);
PSD3 = fftshift(fft(Double_ACF3))./ length(Double_ACF3);

figure("Name","Power Spectral Density of the Process at Tb = 1");
subplot(3, 1, 1); plot(f, abs(PSD1)); xlabel('Frequency(Hz)');ylabel('Amplitude');  
title('PSD of PNRZ Process at Tb = 1 sec'); grid on; 

subplot(3, 1, 2); plot(f, abs(PSD2)); xlabel('Frequency(Hz)');ylabel('Amplitude'); 
title('PSD of UNRZ Process at Tb = 1 sec'); grid on; 

subplot(3, 1, 3); plot(f, abs(PSD3)); xlabel('Frequency(Hz)');ylabel('Amplitude'); 
title('PSD of Manchester Process at Tb = 1 sec'); grid on; 
