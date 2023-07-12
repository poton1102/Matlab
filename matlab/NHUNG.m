% nhúng tin

% dữ liệu nhúng
s='khoa san';
[bin] = str2bin(s);

% xử lý ảnh
Img=imread('lena.bmp');
Img=uint8(Img);

% nhúng