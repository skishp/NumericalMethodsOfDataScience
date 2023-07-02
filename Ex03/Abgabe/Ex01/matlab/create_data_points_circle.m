function[A] = create_data_points_circle(m)

A = zeros(m,2);

rad = 4;
xm = 2;
ym = 2;

for i = 1:m
    angle = 2*pi*rand(1,1);
    r = (0.4*rand(1,1)+0.8)*rad;
    A(i,1) = r*cos(angle)*xm;
    A(i,2) = r*sin(angle)*ym;
end

end