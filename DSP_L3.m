disp('------------A1------------')

syms n z
% Example i)
X1 = 1 + 2*z^(-1) + 5*z^(-2)
pretty(X1)
% Example ii) include the zeros explicitly
X2 = 0 + 3*z^(-1) + 0*z^(-2) + 4*z^(-3)
pretty(X2)

disp('------------A2------------')

syms n z a
assume(abs(a) < 1)

% Right-sided sequence
X1 = ztrans(a^n * heaviside(n), n, z)

disp('ROC: z > a')

X1_06 = subs(X1, a, 0.6)
disp('ROC: z > 0.6')
X1_neg08 = subs(X1, a, -0.8)
disp('ROC: z > 0.8')




disp('------------A3------------')

syms n z
x1 = (0.5)^n * heaviside( n );
x2 = (-0.5)^n * heaviside( n );
X_lin = ztrans(2*x1 - 3*x2, n, z)
X_shift = ztrans( subs(x1, n, n-3), n, z) 

disp('------------A4------------')


Xa = 1 / (1 - 0.7*z^(-1));
xa = iztrans(Xa, z, n)
Xb = (1 - 0.5*z^(-1)) / (1 - 0.8*z^(-1));
xb = iztrans(Xb, z, n)


disp('------------A5------------')


b = [1 -2.4 2.88];
a = [1 -0.8 0.64];
figure; zplane(b,a); grid on; title('Pole-Zero Plot');
[H,w] = freqz(b,a,512);
figure; subplot(2,1,1); plot(w/pi, abs(H)); grid on; ylabel('|H|'); title('Magnitude');
subplot(2,1,2); plot(w/pi, angle(H)); grid on; xlabel('\omega/\pi'); ylabel('Phase');
% Optional test signal:
n = 0:511;
x = sin(0.2*pi*n) + 0.5*sin(0.8*pi*n);
y = filter(b,a,x);