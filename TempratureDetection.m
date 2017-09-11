clear;clc;
I=imread('33.bmp');%34
count=0;%计数值
figure(1),imshow(I);title('原图');%将人脸的原图显示出来
figure(2),subplot(2,2,1),imshow(I);title('原图灰度图像');
figure(2),subplot(2,2,2),imhist(I);title('灰度图直方图');%绘制灰度图的直方图
[x,y]=size(I);
H=double(I);%数据类型转换
for i=1:x
    for j=1:y
        if(H(i,j)<=150)
            H(i,j)=5/3*H(i,j);%灰度变换，根据需要改变这里的公式
        else
            H(i,j)=0;
        end
    end
end
I=uint8(H);
figure(2),subplot(2,2,3),imshow(I);title('灰度变换图像');
figure(2),subplot(2,2,4),imhist(I);title('灰度变换图直方图');%绘制灰度图的直方图

H=I;%临时图像H
[x,y]=size(H);
for i=1:x
    for j=1:y
    if(H(i,j)>=212)
    else 
        H(i,j)=0;
    end
    end
end
figure(3),subplot(2,2,1),imshow(I),title('灰度变换后滤波前图像');
figure(3),subplot(2,2,2),imshow(H),title('灰度变换后滤波前判定图');
sigma=1.6;
gausFilter = fspecial('gaussian',[5 5],sigma);
blur=imfilter(I,gausFilter,'replicate');
figure(3),subplot(2,2,3),imshow(blur),title('灰度变换后滤波后图像');
[x,y]=size(blur);
H=double(blur);%临时图像
for i=1:x
    for j=1:y
    if(H(i,j)>=212)
       count=count+1;
    else 
        H(i,j)=0;
    end
    end
end
figure(3),subplot(2,2,4),imshow(uint8(H));title('灰度变换后滤波后判定图');
