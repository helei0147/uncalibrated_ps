function [ square_img ] = to_square( img, mask )
%TO_SQUARE 将向量型的图片转化成图片的矩阵形式。
%   将向量型的图片转化成图片的矩阵形式。
    mask = mask>0;

    R_slice = zeros(size(mask));
    G_slice = zeros(size(mask));
    B_slice = zeros(size(mask));
    R_slice(mask) = img(:,1);
    G_slice(mask) = img(:,2);
    B_slice(mask) = img(:,3);
    square_img(:,:,1) = R_slice;
    square_img(:,:,2) = G_slice;
    square_img(:,:,3) = B_slice;
end

