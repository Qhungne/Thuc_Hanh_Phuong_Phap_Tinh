function [result, poly_str] = lagrangeInterpolation(x, y, x0)
    n = length(x);
    result = 0;
    poly_terms = {};
    for i = 1:n
        term = y(i);
        term_str = sprintf('%.2f', y(i));
        for j = 1:n
            if j ~= i
                term = term * (x0 - x(j)) / (x(i) - x(j));
                term_str = strcat(term_str, sprintf('* (x - %.2f) / (%.2f - %.2f)', x(j), x(i), x(j)));
            end
        end
        result = result + term;
        poly_terms{end+1} = term_str;
    end
    poly_str = strjoin(poly_terms, ' + ');
end
