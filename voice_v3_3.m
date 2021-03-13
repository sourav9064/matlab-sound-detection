clc;
close all;
clear;

[audioIn,fs] = audioread('Counting-16-44p1-mono-15secs.wav');
audioIn = audioIn(1:10*fs);

detectSpeech(audioIn,fs);