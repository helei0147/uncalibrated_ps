function [ img ] = load_rgb( filename )
%LOAD_RGB �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

fid=fopen(filename,'r');
img = fread(fid,inf,'float');
fclose(fid);
img = reshape(img,3,[])';
end

