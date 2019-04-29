%% ������
%% ����mnist����
% N_sample = 1000;p = 784;
% x = zeros(N_sample , p);
% tic
% for i = 1 : N_sample
%     im = imread(['F:\MATLAB\mnist��д����\trainimage\pic2\0\' num2str(i) '.bmp']);
%     x(i , :) = double(reshape(im(: , : , 1) , 1 , p) > 10);
% end
% toc
load('matlab.mat')
%% ����RBM
rbm = RBM(p , 50);%�������󣬲����ֱ�Ϊ�ɼ��㵥Ԫ���������ز㵥Ԫ����
rbm = rbm.train(x , 10000);%ѵ���������ֱ�Ϊ�������ݼ�������������
rbm = rbm.predict(100);%�ع�
%% �����ع�ͼ��
Im = zeros(280 , 280);
for i = 1 : size(rbm.testData_x , 1)
    i0 = floor((i-1)/10);j0 = mod(i-1,10);
    Im(i0*28+1:(i0+1)*28,j0*28+1:(j0+1)*28) = reshape(rbm.testData_x(i , :) , 28 , 28);
end
imshow([Im(1:140,:) Im(141:280,:)]);

% Im = zeros(280 , 280);
% for i = 1 : size(rbm.w , 2)
%     i0 = floor((i-1)/10);j0 = mod(i-1,10);
%     Im(i0*28+1:(i0+1)*28,j0*28+1:(j0+1)*28) = reshape(rbm.w(: , i) , 28 , 28);
% end
% imshow(Im(1:140,:));