function [result, poly_str] = newtonInterpolation(x, y, x0)
    n = length(x);
    divided_diff = zeros(n, n);
    divided_diff(:, 1) = y';
    for j = 2:n
        for i = 1:n-j+1
            divided_diff(i, j) = (divided_diff(i+1, j-1) - divided_diff(i, j-1)) / (x(i+j-1) - x(i));
        end
    end
    result = divided_diff(1, 1);
    term = 1;
    poly_terms = {sprintf('%.2f', divided_diff(1, 1))};
    for j = 2:n
        term = term * (x0 - x(j-1));
        result = result + term * divided_diff(1, j);
        poly_terms{end+1} = sprintf('* (x - %.2f)', x(j-1));
    end
    poly_str = strjoin(poly_terms, ' ');
end
