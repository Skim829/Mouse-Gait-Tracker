load('Peaks.mat')
load('paw_angle.mat')
oldfolder=cd;
figure();
subplot(1,4,1);boxplot(buffer_LF_Angle);ylabel('Paw angle (degree)');title('LF');ylim([min(horzcat(buffer_LF_Angle,buffer_LR_Angle,buffer_RF_Angle,buffer_RR_Angle)) max(horzcat(buffer_LF_Angle,buffer_LR_Angle,buffer_RF_Angle,buffer_RR_Angle))]);
subplot(1,4,2);boxplot(buffer_LR_Angle);title('LR');ylabel('Paw angle (degree)');ylim([min(horzcat(buffer_LF_Angle,buffer_LR_Angle,buffer_RF_Angle,buffer_RR_Angle)) max(horzcat(buffer_LF_Angle,buffer_LR_Angle,buffer_RF_Angle,buffer_RR_Angle))]);
subplot(1,4,3);boxplot(buffer_RF_Angle);title('RF');ylabel('Paw angle (degree)');ylim([min(horzcat(buffer_LF_Angle,buffer_LR_Angle,buffer_RF_Angle,buffer_RR_Angle)) max(horzcat(buffer_LF_Angle,buffer_LR_Angle,buffer_RF_Angle,buffer_RR_Angle))]);
subplot(1,4,4);boxplot(buffer_RR_Angle);title('RR');ylabel('Paw angle (degree)');ylim([min(horzcat(buffer_LF_Angle,buffer_LR_Angle,buffer_RF_Angle,buffer_RR_Angle)) max(horzcat(buffer_LF_Angle,buffer_LR_Angle,buffer_RF_Angle,buffer_RR_Angle))]);
cd Final_
saveas(gcf,'stride_angle_mv.png')
saveas(gcf,'stride_angle_mv.fig')

%각 프레임과 각도를 같이 표시해서 잘 검출됐는지 확인
cd(oldfolder)
cd Paw_Angle_Frame
%LF 의 경우
for i=1:size(locs_upper1,1)
fig1=figure(1);
set(fig1, 'OuterPosition', [300, 300, 2000, 1000])
subplot(ceil(size(locs_upper1,1)/5),5,i)
imshow(strcat('LF\Frame',num2str(locs_upper1(i)),'.jpg'));
title(strcat('LF  (',num2str(i),'/',num2str(size(locs_upper1,1)),') : ',num2str(buffer_LF_Angle(1,i)),'degree'),'fontsize',10)
end

%LR 의 경우
for i=1:size(locs_upper2,1)
fig2=figure(2);
set(fig2, 'OuterPosition', [300, 300, 2000, 1000])
subplot(ceil(size(locs_upper2,1)/5),5,i)
imshow(strcat('LR\Frame',num2str(locs_upper2(i)),'.jpg'));
title(strcat('LR  (',num2str(i),'/',num2str(size(locs_upper2,1)),') : ',num2str(buffer_LR_Angle(1,i)),'degree'),'fontsize',10)
end

%RF 의 경우
for i=1:size(locs_upper3,1)
fig3=figure(3);
set(fig3, 'OuterPosition', [300, 300, 2000, 1000])
subplot(ceil(size(locs_upper3,1)/5),5,i)
imshow(strcat('RF\Frame',num2str(locs_upper3(i)),'.jpg'));
title(strcat('RF  (',num2str(i),'/',num2str(size(locs_upper3,1)),') : ',num2str(buffer_RF_Angle(1,i)),'degree'),'fontsize',10)
end

%RR 의 경우
for i=1:size(locs_upper4,1)
fig4=figure(4);
set(fig4, 'OuterPosition', [300, 300, 2000, 1000])
subplot(ceil(size(locs_upper4,1)/5),5,i)
imshow(strcat('RR\Frame',num2str(locs_upper4(i)),'.jpg'));
title(strcat('RR  (',num2str(i),'/',num2str(size(locs_upper4,1)),') : ',num2str(buffer_RR_Angle(1,i)),'degree'),'fontsize',10)
end

saveas(fig1,'LF_angles.png')
saveas(fig2,'LR_angles.png')
saveas(fig3,'RF_angles.png')
saveas(fig4,'RR_angles.png')

cd(oldfolder)

