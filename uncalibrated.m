% uncalibrated method for photometric stereo, for Lambertian only?
light_file = 'data/lighting/lights_25.txt';
image_folder = 'data/image/52_6/';
mat_file = 'data/mats/rabbit.mat';
load(mat_file);
lights = load(light_file);
lights = reshape(lights,3,[]);

for i = 0:24
    hdr_img = load_rgb(sprintf('%s%d.rgb',image_folder,i));
    R = hdr_img(:,1);
    G = hdr_img(:,2);
    B = hdr_img(:,3);
    gs_img = 0.2989 * R + 0.5870 * G + 0.1140 * B ;
    I(:, i+1) = gs_img;
end

[U,S,V] = svds(I,3);

% randomly get three normal vector
picked_num = 3;
picked = zeros(3);
pixel_num = size(I,1);
index = uint32(rand(1,picked_num)*pixel_num+1);
for i = 1:picked_num
    picked(i,:) = U(index(i),:);
end
s = S.^(0.5);
if det(s*picked)<0
    s = -s;
end
S_cap = U*s;
L_cap = s*V';
% pick up 6 pixel with the same reflectance ratio
index = uint32(rand(1,6)*pixel_num+1);

u = S_cap(:,1);
v = S_cap(:,2);
w = S_cap(:,3);

unfold = [u.*u, 2*u.*v, 2*u.*w, v.*v, 2*v.*w, w.*w];
x = unfold\ones(pixel_num,1);
line1 = [x(1), x(2), x(3)];
line2 = [x(2), x(4), x(5)];
line3 = [x(3), x(5), x(6)];
B = [line1; line2; line3];
[A,sigma,A_] = eig(B);
A = A*(sigma.^0.5);
S = S_cap*A;
len = sum(S.^2,2);
len = len.^0.5;
len = [len,len,len];
normal = S./len;


