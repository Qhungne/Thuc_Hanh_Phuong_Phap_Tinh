function plotInterpolation(x, y, result, x0, bieudo_2, phuongphap)
    % Xóa mọi đồ thị cũ trong axes bieudo_2
    cla(bieudo_2);  
    hold(bieudo_2, 'on');  % Giữ các đồ thị trên cùng một đồ thị
    
    % Vẽ các điểm dữ liệu thực và nối chúng bằng một đường
    plot(bieudo_2, x, y, 'bo-', 'MarkerFaceColor', 'b', 'LineWidth', 1.5);  % Dữ liệu thực
    
    % Tạo 100 điểm x trong khoảng [min(x), max(x)] để vẽ đường nội suy
    xx = linspace(min(x), max(x), 100); 
    
    % Tính giá trị của đường nội suy tại các điểm này
    yy = zeros(size(xx));  % Khởi tạo mảng yy để lưu giá trị y của đường nội suy
    
    % Tính giá trị của đường nội suy tại từng điểm x
    for i = 1:length(xx)
        if strcmp(phuongphap, 'Lagrange')
            yy(i) = lagrangeInterpolation(x, y, xx(i));  % Tính giá trị nội suy tại xx(i)
        elseif strcmp(phuongphap, 'Newton')
            yy(i) = newtonInterpolation(x, y, xx(i));  % Tính giá trị nội suy tại xx(i)
        end
    end
    
    % Vẽ đường nội suy
    plot(bieudo_2, xx, yy, 'r-', 'LineWidth', 2);  % Đường nội suy với màu đỏ
    
    % Vẽ điểm nội suy tại x0
    plot(bieudo_2, x0, result, 'k*', 'MarkerSize', 10);  % Điểm nội suy tại (x0, result)
    
    % Cài đặt các thông số cho đồ thị
    title(bieudo_2, sprintf('Đồ thị nội suy %s', phuongphap));
    xlabel(bieudo_2, 'x');
    ylabel(bieudo_2, 'y');
    legend(bieudo_2, {'Dữ liệu thực', 'Đa thức nội suy', sprintf('P(x0) = %.4f', result)}, 'Location', 'Best');
    
    hold(bieudo_2, 'off');  % Tắt chế độ giữ đồ thị
end
