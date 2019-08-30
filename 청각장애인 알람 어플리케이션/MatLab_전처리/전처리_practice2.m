clear all; close all; clc;
% Use Fourier series analysis to generate the magnitude and phase plots of 
% the EEG Signal 
% Sample frequency (given) 

path_name="C:\Users\babbu\OneDrive\����\MATLAB\Akron\audio";
list=dir(path_name);
n=length(list);

k=3
    file_name=strcat(path_name,'\',list(k).name);
    [data,fs]=audioread(file_name);
    
    % 2ä�� ���� ��ȯ
    % mono_data=sum(data,2)/2;
    mono_data=data(:,1);
    % ������ 1�ʺ��� ª�� ������ ��� Zero Pedding�� �̿�.
    if (length(mono_data)<16000)
        mono_data(length(mono_data)+1:250000,1)=0;
    end
     % ���÷���Ʈ 16000Hz�� ��ȯ
     r_mono_data = resample(mono_data,16000,fs);
%     % �ִ밪 ��ġ ã��
%     rms_data=rms(r_mono_data,2); 
%     [i, j]= find(rms_data==max(max(rms_data)));
%     
%     % �ð���
%     N=length(r_mono_data);
%     Tt=N/16000;            % Calculate total time 
%     t=(1:N)/16000;         % Time vector for plotting 
%     
%     %complite data
%     if (i(1)-8000 >= 1) && (i(1)+8000 <= N)
%         c_data=r_mono_data(i(1)-8000:i(1)+8000,1);
%     elseif (i(1)-8000<1)
%         c_data=r_mono_data(1:16000,1);
%     elseif (i(1)+8000>N)
%         c_data=r_mono_data(N-16000:N,1);
%     end
%     filename=strcat(num2str(k),list(k).name);
%     audiowrite(filename, c_data,16000,'BitsPerSample',16)
% end
    re_mono_data = resample(mono_data,16000,fs);
    N=length(re_mono_data);