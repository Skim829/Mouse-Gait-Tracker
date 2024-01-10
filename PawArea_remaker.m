clear all
close all
clc

Fs =  246; 
velocity = 22
% 3.2*Fs
% ROI_min=30;% 몇분까지 볼래?
% load('pre_what_if_state_2.mat')
load('paw_area.mat')

velocity=double(velocity);
size_data=size(buffer_LF_Area,2);
Data(:,1)=buffer_LF_Area;
Data(:,2)=buffer_LR_Area;
Data(:,3)=buffer_RF_Area;
Data(:,4)=buffer_RR_Area;


time=0:1/Fs:(size(Data,1)-1)/Fs;

figure();
for i=1:4
subplot(2,2,i)
plot(Data(:,i));
title(['Num ',num2str(i)])
xlabel('Time(sec)');
end
%title 순서대로 Left Fore Area, Right Fore Area,  Left Hind Area, Right Hind Area
D={'Left Fore Area','Left Hind Area','Right Fore Area','Right Hind Area'};
figure();
for i=1:4
A(:,i) = Data(:,i);
% B(:,i) = filloutliers(A(:,i),'nearest','median');
B(:,i) = filloutliers(A(:,i),'previous','movmedian',20);
B(:,i) = filloutliers(B(:,i),'previous','movmedian',30);
C(:,i) = filloutliers(B(:,i),'previous','movmedian',40);
subplot(2,2,i)
% plot(time,A(:,i),time,C(:,i),'o')

C = smoothdata(C,'gaussian',Fs/20); % Smoothing
plot(time,A(:,i),time,C(:,i))
legend('Raw Data','Interpolated Data')
xlabel('Time(sec)');
end


Final_result=zeros(size(C,1),4);
figure();


% for ii=1:4
% %peak detection
% [pks, locs_upper] = Find_peak_for_digigait(C(:,ii), mean(C(:,ii)));
% [pks2, locs_under] = Find_under_peak_for_digigait(C(:,ii), mean(C(:,ii)));
% size(locs_upper,1)
% locs_upper(1:size(locs_upper,1),ii)=zeros(size(locs_upper,1),1);
% locs_under(1:size(locs_under,1),ii)=zeros(size(locs_under,1),1);
% 
% Paw_area_reult=zeros(1,size(C(:,ii),1));
% locs_upper(1:size(locs_upper,1),ii)=locs_upper;
% locs_under(1:size(locs_under,1),ii)=locs_under;
% 
% subplot(2,2,ii);
% plot(t,C(:,ii),'-p','MarkerIndices',[locs_upper],...
%     'MarkerFaceColor','red','MarkerSize',12);
% hold on
% plot(t,C(:,ii),'-p','MarkerIndices',[locs_under],...
%     'MarkerFaceColor','red','MarkerSize',12);
% 
% end

%%%%%%%%%%%%%%%%

for ii=1:4
%peak detection
[pks, locs_upper] = Find_peak_for_digigait(C(:,ii), mean(C(:,ii))*1.2); %클수록 까다로움
% [pks2, locs_under] = Find_under_peak_for_digigait(C(:,ii), mean(C(:,ii))*0.7); %작을수록 까다로움
% size(locs_upper,1)
eval(['locs_upper' num2str(ii) '(1:size(locs_upper,1),1)=zeros(size(locs_upper,1),1);']);
% eval(['locs_under' num2str(ii) '(1:size(locs_under,1),1)=zeros(size(locs_under,1),1);']);

% Paw_area_reult=zeros(1,size(C(:,ii),1));
eval(['locs_upper' num2str(ii) '(1:size(locs_upper,1),1)=locs_upper;']);
% eval(['locs_under' num2str(ii) '(1:size(locs_under,1),1)=locs_under;']);

end


save ('Peaks','C','locs_upper1', 'locs_upper2', 'locs_upper3', 'locs_upper4','time')

%%%%%%%%%%%%%%%%%%%

%피크 필요없는거 제거

Modif_peak;

f = figure('Position',[500 500 400 300]);
c = uicontrol('String','Continue','Callback','uiresume(f)');
uiwait(f)
load('Peaks');
% plot(time,C(:,1),'-p','MarkerIndices',[locs_upper1],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LF');




figure();
subplot(2,2,1);
plot(time,C(:,1),'-p','MarkerIndices',[locs_upper1],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LF');
% h= imrect;  
subplot(2,2,2);
plot(time,C(:,2),'-p','MarkerIndices',[locs_upper2],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LR');
subplot(2,2,3);
plot(time,C(:,3),'-p','MarkerIndices',[locs_upper3],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('RF');
subplot(2,2,4);
plot(time,C(:,4),'-p','MarkerIndices',[locs_upper4],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('RR');

% eval(['locs_upper' num2str(ii) '(1:size(locs_upper,1),1)=zeros(size(locs_upper,1),1);']);
% eval(['locs_upper' num2str(ii) '(1:size(locs_upper,1),1)=locs_upper;']);




%% 210428 수정
% for ii=1:4
% ii
%     eval(['[locs_upper' num2str(ii) ', locs_under' num2str(ii) '] = remove_peaks(locs_upper' num2str(ii) ', locs_under' num2str(ii) ');']);
%   
% end



figure();
subplot(2,2,1);
plot(time,C(:,1),'-p','MarkerIndices',[locs_upper1],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LF');
% hold on
% plot(time,C(:,1),'-p','MarkerIndices',[locs_under1],...
%     'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');

subplot(2,2,2);
plot(time,C(:,2),'-p','MarkerIndices',[locs_upper2],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('LR');
% hold on
% plot(time,C(:,2),'-p','MarkerIndices',[locs_under2],...
%     'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');

subplot(2,2,3);
plot(time,C(:,3),'-p','MarkerIndices',[locs_upper3],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('RF');
% hold on
% plot(time,C(:,3),'-p','MarkerIndices',[locs_under3],...
%     'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');

subplot(2,2,4);
plot(time,C(:,4),'-p','MarkerIndices',[locs_upper4],'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');title('RR');
% hold on
% plot(time,C(:,4),'-p','MarkerIndices',[locs_under4],...
%     'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');




% for ii=1:4
%  Paw_area_reult=zeros(1,size(C(:,ii),1));
%  eval([' for k=1:size(locs_upper' num2str(ii) ',1) Paw_area_reult(locs_under' num2str(ii)  '(k):locs_upper' num2str(ii) '(k))=C(locs_under' num2str(ii) '(k):locs_upper' num2str(ii)  '(k),ii); end']);
% Final_result(:,ii) = Paw_area_reult;
% end


for ii=1:4
 Paw_area_reult=zeros(1,size(C(:,ii),1));
eval([' for k=1:size(locs_upper' num2str(ii) ',1) Paw_area_reult=C(:,ii); end']);
     Final_result(:,ii) = Paw_area_reult;
end

LF_Area=Final_result(:,1)';
LR_Area=Final_result(:,2)';
RF_Area=Final_result(:,3)';
RR_Area=Final_result(:,4)';


%Raw, 후처리비교
figure();
subplot(2,2,1)
plot(time,Data(:,1),time,C(:,1));xlabel('Time(sec)');title('LF after SP');
subplot(2,2,2)
plot(time,Data(:,2),time,C(:,2));xlabel('Time(sec)');title('LR after SP');
subplot(2,2,3)
plot(time,Data(:,3),time,C(:,3));xlabel('Time(sec)');title('RF after SP');
subplot(2,2,4)
plot(time,Data(:,4),time,C(:,4));xlabel('Time(sec)');title('RR after SP');



% % %기존 검출결과
figure();
subplot(2,2,1)
plot(time,Data(:,1),time,LF_Area);xlabel('Time(sec)');title('LF before SP');
subplot(2,2,2)
plot(time,Data(:,2),time,LR_Area);xlabel('Time(sec)');title('LR before SP');
subplot(2,2,3)
plot(time,Data(:,3),time,RF_Area);xlabel('Time(sec)');title('RF before SP');
subplot(2,2,4)
plot(time,Data(:,4),time,RR_Area);xlabel('Time(sec)');title('RR before SP');


% % % %후처리 후 새롭게 검출한결과
% figure();
% subplot(2,2,1)
% plot(time,C(:,1),time,Final_result(:,1)); title('LF');xlabel('Time(sec)');
% subplot(2,2,2)
% plot(time,C(:,2),time,Final_result(:,2));title('LR');xlabel('Time(sec)');
% subplot(2,2,3)
% plot(time,C(:,3),time,Final_result(:,3));title('RF');xlabel('Time(sec)');
% subplot(2,2,4)
% plot(time,C(:,4),time,Final_result(:,4));title('RR');xlabel('Time(sec)');


figure();
subplot(2,2,1)
plot(time,C(:,1),'-p','MarkerIndices',[locs_upper1],...
'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');ylabel('Paw area');title('LF');
subplot(2,2,2)
plot(time,C(:,2),'-p','MarkerIndices',[locs_upper2],...
'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');ylabel('Paw area');title('LR');
subplot(2,2,3)
plot(time,C(:,3),'-p','MarkerIndices',[locs_upper3],...
'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');ylabel('Paw area');title('RF');
subplot(2,2,4)
plot(time,C(:,4),'-p','MarkerIndices',[locs_upper4],...
'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');ylabel('Paw area');title('RR');




%stride length 계산 LF
Stride_length1=zeros(size(locs_upper1,1)-1,1);
Stride_length1_all=0;
for h=1:size(locs_upper1,1)-1
   Stride_length1(h)=locs_upper1(h+1)-locs_upper1(h);
   Stride_length1_all=Stride_length1_all+Stride_length1(h);
end
Stride_length1=Stride_length1/Fs*velocity;
Stride_length1_all=((Stride_length1_all/(size(locs_upper1,1)-1))/Fs)*velocity; % Cm

%stride length 계산 LR
Stride_length2=zeros(size(locs_upper2,1)-1,1);
Stride_length2_all=0;
for h=1:size(locs_upper2,1)-1
   Stride_length2(h)=locs_upper2(h+1)-locs_upper2(h);
   Stride_length2_all=Stride_length2_all+Stride_length2(h);
end
Stride_length2=Stride_length2/Fs*velocity;
Stride_length2_all=((Stride_length2_all/(size(locs_upper2,1)-1))/Fs)*velocity; % Cm

%stride length 계산 RF
Stride_length3=zeros(size(locs_upper3,1)-1,1);
Stride_length3_all=0;
for h=1:size(locs_upper3,1)-1
   Stride_length3(h)=locs_upper3(h+1)-locs_upper3(h);
   Stride_length3_all=Stride_length3_all+Stride_length3(h);
end
Stride_length3=Stride_length3/Fs*velocity;
Stride_length3_all=((Stride_length3_all/(size(locs_upper3,1)-1))/Fs)*velocity; % Cm

%stride length 계산 RF
Stride_length4=zeros(size(locs_upper4,1)-1,1);
Stride_length4_all=0;
for h=1:size(locs_upper4,1)-1
   Stride_length4(h)=locs_upper4(h+1)-locs_upper4(h);
   Stride_length4_all=Stride_length4_all+Stride_length4(h);
end
Stride_length4=Stride_length4/Fs*velocity;
Stride_length4_all=((Stride_length4_all/(size(locs_upper4,1)-1))/Fs)*velocity; % Cm

mean_stridelength=mean(vertcat(Stride_length1,Stride_length2,Stride_length3,Stride_length4));
std_stridelength=std((vertcat(Stride_length1,Stride_length2,Stride_length3,Stride_length4)));

% % hind paw 의 stride balance
% AA=[size(locs_upper2,1) size(locs_upper4,1)];
% Stride_balance=zeros(1,min(AA));
% for h=1:min(AA)
%    Stride_balance(h)=locs_upper2(h)-locs_upper4(h);
% end
% Stride_balance
% std_stride_balance = std(Stride_balance);






%학회 피규어  %%%%%%%%%
figure();
plot(time,A(:,1),time,C(:,1))
legend('Raw data','Interpolated data')
xlabel('Time(sec)');ylabel('Paw area');





figure();plot(time,LF_Area,'-p','MarkerIndices',[locs_upper1],'MarkerFaceColor','red','MarkerSize',12);
hold on;plot(time,LR_Area,'-p','MarkerIndices',[locs_upper2],'MarkerFaceColor','red','MarkerSize',12);
hold on;plot(time,RF_Area,'-p','MarkerIndices',[locs_upper3],'MarkerFaceColor','red','MarkerSize',12);
hold on;plot(time,RR_Area,'-p','MarkerIndices',[locs_upper4],'MarkerFaceColor','red','MarkerSize',12);
legend('Left Fore Area','Left Hind Area','Right Fore Area','Right Hind Area');
title('Paw area');xlabel('Time(sec)');
%학회 피규어  %%%%%%%%%

mkdir Final_
cd Final_

close all;
save final_data LF_Area LR_Area RF_Area RR_Area
save final_peak_data locs_upper1 locs_upper2 locs_upper3 locs_upper4 %locs_under1 locs_under2 locs_under3 locs_under4
save final_stride_length Stride_length1 Stride_length2 Stride_length3 Stride_length4 mean_stridelength std_stridelength
% save std_stride_balance std_stride_balance
figure();plot(time,LF_Area,time,LR_Area,time,RF_Area,time,RR_Area);legend('Left Fore Area','Left Hind Area','Right Fore Area','Right Hind Area');
title('Paw area');xlabel('Time(sec)');
% clear


figure(177);
subplot(2,2,1)
plot(time,C(:,1),'-p','MarkerIndices',[locs_upper1],...
'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');ylabel('Paw area');title('LF');
subplot(2,2,2)
plot(time,C(:,2),'-p','MarkerIndices',[locs_upper2],...
'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');ylabel('Paw area');title('LR');
subplot(2,2,3)
plot(time,C(:,3),'-p','MarkerIndices',[locs_upper3],...
'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');ylabel('Paw area');title('RF');
subplot(2,2,4)
plot(time,C(:,4),'-p','MarkerIndices',[locs_upper4],...
'MarkerFaceColor','red','MarkerSize',12);xlabel('Time(sec)');ylabel('Paw area');title('RR');
saveas(gcf,'Paw_area.png')
saveas(gcf,'Paw_area.fig')

figure();

subplot(1,4,1);boxplot(Stride_length1);ylabel('Stride length (cm)');title('LF');ylim([min(vertcat(Stride_length1,Stride_length2,Stride_length3,Stride_length4)) max(vertcat(Stride_length1,Stride_length2,Stride_length3,Stride_length4))]);
subplot(1,4,2);boxplot(Stride_length2);title('LR');ylabel('Stride length (cm)');ylim([min(vertcat(Stride_length1,Stride_length2,Stride_length3,Stride_length4)) max(vertcat(Stride_length1,Stride_length2,Stride_length3,Stride_length4))]);
subplot(1,4,3);boxplot(Stride_length3);title('RF');ylabel('Stride length (cm)');ylim([min(vertcat(Stride_length1,Stride_length2,Stride_length3,Stride_length4)) max(vertcat(Stride_length1,Stride_length2,Stride_length3,Stride_length4))]);
subplot(1,4,4);boxplot(Stride_length4);title('RR');ylabel('Stride length (cm)');ylim([min(vertcat(Stride_length1,Stride_length2,Stride_length3,Stride_length4)) max(vertcat(Stride_length1,Stride_length2,Stride_length3,Stride_length4))]);
saveas(gcf,'stride_length_mv.png')
saveas(gcf,'stride_length_mv.fig')



