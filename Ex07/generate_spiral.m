
function [data] = generate_spiral(points,spirals,noise)
% Parameters
nPoints = points;          % Number of points in each spiral
nSpirals = spirals;           % Number of spirals
noiseMagnitude = noise;   % Magnitude of noise

% Initialize variables
data = cell(nSpirals, 1);
labels = cell(nSpirals, 1);

% Generate spiral datasets
for i = 1:nSpirals
    t = linspace(0, 2*pi, nPoints)';
    r = linspace(0, 2, nPoints)' + noiseMagnitude*randn(nPoints, 1);
    x = r .* cos(t + i*2*pi/nSpirals) + noiseMagnitude*randn(nPoints, 1);
    y = r .* sin(t + i*2*pi/nSpirals) + noiseMagnitude*randn(nPoints, 1);
    
    % Store data and labels
    data{i} = [x, y];
    labels{i} = repmat(i, nPoints, 1);
end

% Concatenate datasets
data = vertcat(data{:});
n = size(data,1);
vector = [];
for i=1:n
    if abs(data(i,1))<0.3 & abs(data(i,2))<0.3
        vector= [vector,i];
    end
end
data(vector,:) = [];
end
