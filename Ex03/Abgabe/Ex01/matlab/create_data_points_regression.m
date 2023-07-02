function[A] = create_data_points_regression(m)

A = zeros(m,2);
A(:,1) = randi(100,m,1);
A(:,2) = A(:,1).*(0.5+rand(m,1));

end