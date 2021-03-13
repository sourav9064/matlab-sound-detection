clc;
close all;
clear;

[audioIn, fs] = audioread('keywordTestSignal.wav');
sound(audioIn,fs)
