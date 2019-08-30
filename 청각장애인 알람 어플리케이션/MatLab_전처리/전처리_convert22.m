clear all; close all; clc;
% Use Fourier series analysis to generate the magnitude and phase plots of 
% the EEG Signal 
% Sample frequency (given) 

path_name="C:\Users\babbu\OneDrive\����\MATLAB\Akron\audio";
list=dir(path_name);
n=length(list);

for k=3:1:n
    file_name=strcat(path_name,'\',list(k).name);
    [data,fs]=audioread(file_name);
    
    % 2ä�� -> Mono(1ä��)�� ��ȯ
    % mono_data=sum(data,2)/2;
    mono_data=data(:,1);
     % ������ 1�ʺ��� ª�� ������ ��� Zero Pedding�� �̿�.
     detect=length(mono_data);
     % x * 16000/fs = 16000���� ���;��ϹǷ� x�� fs���� ���ƾ��Ѵ�.
    if (length(mono_data)<=fs)
        mono_data=[zeros(fs-(length(mono_data)+100),1); mono_data; zeros(200,1)];
    end
    % ���÷���Ʈ 16000Hz�� ��ȯ
    re_mono_data = resample(mono_data,16000,fs);
    % �ִ밪 ��ġ ã��
    rms_data=rms(re_mono_data,2); 
    [i, j]= find(rms_data==max(max(rms_data)));
    
    % �ð���
    N=length(re_mono_data);
    Tt=N/16000;            % Calculate total time 
    t=(1:N)/16000;         % Time vector for plotting 
    
    % complite data
    % ù��°�� Max�������� ���� �������� �յڷ� 1�ʸ�ŭ ¥����.
    if (i(1)-8000 >= 1) && (i(1)+8000 <= N)
        complite_data=re_mono_data(i(1)-8000:i(1)+8000,1);
    elseif (i(1)-8000<1)
        complite_data=re_mono_data(1:16000,1);
    elseif (i(1)+8000>N)
        complite_data=re_mono_data(N-16000:N,1);
    end
    % strcat �Լ��� ��ǥ �յ��� ���ϸ��� ���� �ش�.
    % num2str�� ���ڰ��ƴ� �μ��� �����Ѵ�.
    
    % ������ ��, �̸� �ٲٱ��
    filename=strcat('ky',list(k).name);
    %filename=strcat('770000',num2str(k),'-1-0-0.wav');
    
    % audiowrite(list(k).name,complite_data,16000,'BitsPerSample',16)
    audiowrite(filename,complite_data,16000,'BitsPerSample',16)
end

fprintf('Wav ��ȯ �Ϸ�')
