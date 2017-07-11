function [hdr, ldr] = auto_exposure( mask, image )
%AUTO_EXPOSURE 自动曝光，选取成比例的
%   此处显示详细说明
    result = to_square(image,mask);
    hdr = result;
    ldr = tonemap(hdr);
    imshow(ldr);
    figure;
    imshow(hdr);
end

