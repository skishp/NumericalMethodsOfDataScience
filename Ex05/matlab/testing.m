X = [5 3 6];
prob = [0.44 0.02 0.44];
counter_2 = 0;
counter_1 = 0;
counter_3 = 0;
for i = 1:100
    
    value = randsample(X,1,true,prob);
    index = find(X==value);

    if index == 2 
        counter_2 = counter_2 +1;
    end
    if index == 3 
        counter_3 = counter_3 +1;
    end
    if index == 1 
        counter_1 = counter_1 +1;
    end
end
