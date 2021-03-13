clc;
close all;
clear;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   this program can remove the sterio mode from the audio
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%fileReader = dsp.AudioFileReader('Counting-16-44p1-mono-15secs.wav');%
fileReader = dsp.AudioFileReader('C:\Users\HP\DEASYSOFT Tech Pvt Ltd\2nd Project\Speech Recognition in MATLAB using correlation\one.wav');
%fileReader = dsp.AudioFileReader('C:\Users\HP\DEASYSOFT Tech Pvt Ltd\2nd Project\speech_V1\One.wav');
fs = fileReader.SampleRate;
fileReader.SamplesPerFrame = ceil(10e-3*fs);

VAD = voiceActivityDetector;

scope = dsp.TimeScope( ...
    'NumInputPorts',2, ...
    'SampleRate',fs, ...
    'TimeSpan',3, ...
    'BufferLength',3*fs, ...
    'YLimits',[-1.5 1.5], ...
    'TimeSpanOverrunAction','Scroll', ...
    'ShowLegend',true, ...
    'ChannelNames',{'none','Audio','Probability of speech presence'});
deviceWriter = audioDeviceWriter('SampleRate',fs);

while ~isDone(fileReader)
    audioIn = fileReader();
    probability = VAD(audioIn);
    
    a = size(probability);
    
    
    if a == size(1)
        %disp('Size matched');
        scope(audioIn,probability*ones(fileReader.SamplesPerFrame,1))
        deviceWriter(audioIn);
        if probability >= 1.00000000%>= 0.6000 && prob<=0.7000
            disp('Voice Detected');
        end
        
    else
        %disp('Size doesnot matched');
        prob = (probability(:,1)+ probability(:,2))/2.0;
        %disp(prob)
        scope(audioIn,prob*ones(fileReader.SamplesPerFrame,1))
        deviceWriter(audioIn);
        if prob >= 0.86200 && prob<=0.86600 %>= 0.9999
            % 0.86200 && prob<=0.86600 for 'C:\Users\HP\DEASYSOFT Tech Pvt Ltd\2nd Project\Speech Recognition in MATLAB using correlation\one.wav'
            disp('Voice Detected');
        end
    end
end