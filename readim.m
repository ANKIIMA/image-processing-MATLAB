%%
%ͼ���ȡд��
figure(1);
A = imread('std.jpg');%��ȡͼ��
subplot(2,2,1);
imshow(A);            %��ʾͼ��
title('ԭͼ');

R = A(:,:,1);         %ȡRGBֵ
G = A(:,:,2);
AntitGray = A(:,:,3);

subplot(2,2,2);
imshow(G);            %ȡGreenɫת�Ҷ�
title('ȡGreenɫת�Ҷ�');
imwrite(G,'Green.png');

subplot(2,2,3);
imshow((R+G+AntitGray)/3);    %ȡƽ��ֵת�Ҷ�
title('ȡƽ��ֵת�Ҷ�');
imwrite((R+G+AntitGray)/3,'Mean.png');

subplot(2,2,4);
Gray = R*0.299 + G*0.587 + AntitGray*0.114 + 0.5;
imshow(Gray);         %RGBת�Ҷȹ�ʽ
title('RGBת�Ҷȹ�ʽ');
imwrite(Gray,'Gray.png');

%%
%�Ҷ�ӳ��
figure(2);
subplot(2,2,1);
imshow(Gray);            %��ʾͼ��
title('ԭͼ');

Gray_max = max(max(Gray));
Gray_min = min(min(Gray));

AntitGray = Gray_max - Gray;
subplot(2,2,2);
imshow(AntitGray);
title('�Ҷ�ȡ��');
imwrite(AntitGray,'Anti_Gray.png');

Double_log_max = max(max(log(1 + double(Gray))));
C = double(Gray_max) / double(Double_log_max);
CPR_Gray = C * log(1 + double(Gray));
CPR_Gray = uint8(CPR_Gray);
subplot(2,2,4);
imshow(CPR_Gray);
title('��̬ѹ��ͼ��');
imwrite(CPR_Gray,'CPR_Gray.png');

subplot(2,2,3);
i = 0:255;
plot(i,C * log(1 + double(i)));
xlim([0 250]);
ylim([0 250]);
xlabel('S');
ylabel('T');
title('ѹ���Ҷ�ӳ�亯��ͼ��');

%%
%ֱ��ͼ����
figure(3);
subplot(2,2,1);
imhist(Gray);
title('ԭͼֱ��ͼ');

subplot(2,2,2);
imshow(Gray);
title('ԭͼ');

subplot(2,2,3);
histeq_Gray = myhisteq(Gray);
imhist(histeq_Gray);
title('���⻯ֱ��ͼ');

subplot(2,2,4);
imshow(histeq_Gray);
title('ֱ��ͼ���⻯ͼ��');
imwrite(histeq_Gray,'histeq_Gray.png');

%%
%�����˲�
figure(4);

subplot(2,2,1);
imshow(Gray);
title('ԭͼ');

subplot(2,2,2);
imshow(imnoise(Gray,'salt & pepper',0.1));
title('���������ԭͼ');

subplot(2,2,3);
average_Gray = myaverage(imnoise(Gray,'salt & pepper',0.1));
imshow(average_Gray);
title('����ƽ��ͼ��');
imwrite(average_Gray,'average_Gray.png');

subplot(2,2,4);
median_Gray = mymedian(imnoise(Gray,'salt & pepper',0.1));
imshow(median_Gray);
title('��ֵ�˲�ͼ��');
imwrite(median_Gray,'median_Gray.png');

figure(5);
subplot(1,3,2);
linear_Gray = mylinear(Gray);
imshow(linear_Gray);
title('�����񻯽��');
imwrite(linear_Gray,'linear-Gray.png');

subplot(1,3,1);
imshow(Gray);
title('ԭͼ');

subplot(1,3,3);
add_Gray = uint8(double(Gray) + double(linear_Gray));
imshow(add_Gray);
title('�����ͼ��');
imwrite(add_Gray,'add_Gray.png');
















