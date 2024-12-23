function [root, iter] = bisectionMethod(f_func, a, b, epsilon, max_iter)
    for iter = 1:max_iter
        root = (a + b) / 2;
        if abs(f_func(root)) < epsilon || (b - a) / 2 < epsilon
            return;
        end
        if f_func(a) * f_func(root) < 0
            b = root;
        else
            a = root;
        end
    end
    error('Không hội tụ sau %d lần lặp.', max_iter);
end
