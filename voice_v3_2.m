clc;
close all;
clear;

% noise cancelation 
% not done

%fileReader = dsp.AudioFileReader('Counting-16-44p1-mono-15secs.wav');%
%fileReader = dsp.AudioFileReader('C:\Users\HP\DEASYSOFT Tech Pvt Ltd\2nd Project\Speech Recognition in MATLAB using correlation\one.wav');
%fileReader = dsp.AudioFileReader('C:\Users\HP\DEASYSOFT Tech Pvt Ltd\2nd Project\speech_V1\One.wav');
fs = 16e3;
[speech,fileFs] = audioread('Counting-16-44p1-mono-15secs.wav');
speech = resample(speech,fs,fileFs);
speech = speech/max(abs(speech));
sound(speech,fs);

win = hamming(50e-3 * fs,'periodic');
figure;
detectSpeech(speech,fs,'Window',win)

% detectSpeech = detectSpeech(speech,fs);
% detectProb = (detectSpeech(:,1)+ detectSpeech(:,2))/2.0;


% VAD = voiceActivityDetector;
% 
% probability = VAD(speech);
% disp(size(speech))