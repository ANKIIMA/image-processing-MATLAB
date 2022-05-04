%%
%图像读取写入
figure(1);
A = imread('std.jpg');%读取图像
subplot(2,2,1);
imshow(A);            %显示图像
title('原图');

R = A(:,:,1);         %取RGB值
G = A(:,:,2);
AntitGray = A(:,:,3);

subplot(2,2,2);
imshow(G);            %取Green色转灰度
title('取Green色转灰度');
imwrite(G,'Green.png');

subplot(2,2,3);
imshow((R+G+AntitGray)/3);    %取平均值转灰度
title('取平均值转灰度');
imwrite((R+G+AntitGray)/3,'Mean.png');

subplot(2,2,4);
Gray = R*0.299 + G*0.587 + AntitGray*0.114 + 0.5;
imshow(Gray);         %RGB转灰度公式
title('RGB转灰度公式');
imwrite(Gray,'Gray.png');

%%
%灰度映射
figure(2);
subplot(2,2,1);
imshow(Gray);            %显示图像
title('原图');

Gray_max = max(max(Gray));
Gray_min = min(min(Gray));

AntitGray = Gray_max - Gray;
subplot(2,2,2);
imshow(AntitGray);
title('灰度取反');
imwrite(AntitGray,'Anti_Gray.png');

Double_log_max = max(max(log(1 + double(Gray))));
C = double(Gray_max) / double(Double_log_max);
CPR_Gray = C * log(1 + double(Gray));
CPR_Gray = uint8(CPR_Gray);
subplot(2,2,4);
imshow(CPR_Gray);
title('动态压缩图像');
imwrite(CPR_Gray,'CPR_Gray.png');

subplot(2,2,3);
i = 0:255;
plot(i,C * log(1 + double(i)));
xlim([0 250]);
ylim([0 250]);
xlabel('S');
ylabel('T');
title('压缩灰度映射函数图像');

%%
%直方图修正
figure(3);
subplot(2,2,1);
imhist(Gray);
title('原图直方图');

subplot(2,2,2);
imshow(Gray);
title('原图');

subplot(2,2,3);
histeq_Gray = myhisteq(Gray);
imhist(histeq_Gray);
title('均衡化直方图');

subplot(2,2,4);
imshow(histeq_Gray);
title('直方图均衡化图像');
imwrite(histeq_Gray,'histeq_Gray.png');

%%
%空域滤波
figure(4);

subplot(2,2,1);
imshow(Gray);
title('原图');

subplot(2,2,2);
imshow(imnoise(Gray,'salt & pepper',0.1));
title('添加噪声的原图');

subplot(2,2,3);
average_Gray = myaverage(imnoise(Gray,'salt & pepper',0.1));
imshow(average_Gray);
title('邻域平均图像');
imwrite(average_Gray,'average_Gray.png');

subplot(2,2,4);
median_Gray = mymedian(imnoise(Gray,'salt & pepper',0.1));
imshow(median_Gray);
title('中值滤波图像');
imwrite(median_Gray,'median_Gray.png');

figure(5);
subplot(1,3,2);
linear_Gray = mylinear(Gray);
imshow(linear_Gray);
title('线性锐化结果');
imwrite(linear_Gray,'linear-Gray.png');

subplot(1,3,1);
imshow(Gray);
title('原图');

subplot(1,3,3);
add_Gray = uint8(double(Gray) + double(linear_Gray));
imshow(add_Gray);
title('锐化添加图像');
imwrite(add_Gray,'add_Gray.png');
















