image = double(imread('blumenwiese.jpg'));
Ar = image(:,:,1);
Ag = image(:,:,2);
Ab = image(:,:,3);

[Ur,Sr,Vr] = svd(Ar);
[Ug,Sg,Vg] = svd(Ag);
[Ub,Sb,Vb] = svd(Ab);
[rows, cols, chans] = size(image);

for k = 5:50:500
    Cr = Sr;
    Cg = Sg;
    Cb = Sb;

    Cr(k+1:end, : ) = 0;
    Cr(:,k+1:end) = 0;

    Cg(k+1:end, : ) = 0;
    Cg(:,k+1:end) = 0;

    Cb(k+1:end, : ) = 0;
    Cb(:,k+1:end) = 0;

    img_r = Ur*Cr*Vr';
    img_g = Ug*Cg*Vg';
    img_b = Ub*Cb*Vb';

    img = zeros(rows,cols,3); 
    img(:,:,1) = img_r;
    img(:,:,2) = img_g;
    img(:,:,3) = img_b;

    figure;
    buf = sprintf('Img using %d singular values',k);
    imshow(uint8(img));
    title(buf);
end