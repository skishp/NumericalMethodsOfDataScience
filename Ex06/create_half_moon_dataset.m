function[A] = create_half_moon_dataset(n)

A = zeros(2,2*n);

noise = randn(n,1)/6;
rad = noise+1;
ang1 = pi*1.1;
ang2 = pi/10;

botAng = linspace(-ang1,ang2,n)';
A(1,1:n) = rad.*cos(botAng)+1;
A(2,1:n) = rad.*sin(botAng);

topAng = linspace(ang1,-ang2,n)';
A(1,n+1:2*n) = rad.*cos(topAng);
A(2,n+1:2*n) = rad.*sin(topAng);

end