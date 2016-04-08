clear all; close all; clc;

path =  "/home/maayan4/SDR workshop/";
filename = "gqrx_20160407_145217_96400000_2400000_fc.raw";

full_path = [path filename];

f = fopen(full_path,'rb');

v = fread(f,[2,1E6],"uint8");

v_complex = (v(1,:)-127 + (v(2,:)-127)*i) / 128;

[r,c] = size(v_complex);
v_complex = reshape(v_complex,c,r);

divide_coeff = 1;

length = 1E6;

center_freq = 96.4E6;
Fs = 2.4E6;

freq_vec = (-Fs/2:Fs/length:Fs/2-Fs/length) + center_freq;

begin = 0; %3e6;

v_fft = 20*log10(abs(fft((v_complex))));  

plot(freq_vec/1e6,v_fft);
grid;
xlabel('Freq MHz')
ylabel('Power dB')