function [hdr, ldr] = auto_exposure( mask, image )
%AUTO_EXPOSURE �Զ��ع⣬ѡȡ�ɱ�����
%   �˴���ʾ��ϸ˵��
    result = to_square(image,mask);
    hdr = result;
    ldr = tonemap(hdr);
    imshow(ldr);
    figure;
    imshow(hdr);
end

