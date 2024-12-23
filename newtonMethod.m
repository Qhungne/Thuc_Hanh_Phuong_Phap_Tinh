function [root, iter] = newtonMethod(f_func, df_func, x0, epsilon, max_iter)
    x_old = x0;
    for iter = 1:max_iter
        x_new = x_old - f_func(x_old) / df_func(x_old);  % Sử dụng df_func
        if abs(x_new - x_old) < epsilon
            root = x_new;
            return;
        end
        x_old = x_new;
    end
    error('Không hội tụ sau %d lần lặp.', max_iter);
end
