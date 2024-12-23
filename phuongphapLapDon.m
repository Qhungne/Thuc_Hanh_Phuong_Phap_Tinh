function [root, iter] = phuongphapLapDon(g, x0, epsilon, max_iter)
    x_old = x0; % Điểm bắt đầu
    for iter = 1:max_iter
        % Tính giá trị mới
        x_new = g(x_old);
        
        % Kiểm tra điều kiện hội tụ
        if abs(x_new - x_old) < epsilon
            root = x_new;
            return; % Kết thúc khi hội tụ
        end

        % Cập nhật giá trị cũ
        x_old = x_new;
    end

    % Nếu không hội tụ sau max_iter lần lặp
    error('Phương pháp Lặp đơn không hội tụ sau %d lần lặp.', max_iter);
end
