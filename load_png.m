function [ vectorized_pixel ] = load_png( filename, mask )
%LOAD_PNG �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
rect_img = imread(sprintf('%s',filename));
% psu_hdr = rect_img;
psu_hdr = to_psu_hdr(rect_img, 0, 0.077);
for i = 1:3
    slice = psu_hdr(:,:,i);
    vectorized_pixel(:,i) = slice(logical(mask));
end

end

