function y = PhuongPhapTichPhan(fx,a,b,N,ChonPPTP)
    if ChonPPTP == "Hình thang"
    h = (b-a)/N;
    tong = 0;
    for i = 1:N-1
        tong = tong + fx(a+i*h);
    end
    y = h/2 *(fx(a)+fx(b)+2*tong);
    elseif ChonPPTP == "Simpson 1/3"
    h = (b-a)/N;
    tongchan = 0;
    tongle = 0;
        for i = 1:2:N-1
            tongle = tongle + fx(a+i*h);
        end
        for i = 2:2:N-2
            tongchan = tongchan + fx(a+i*h);
        end
    y = (h/3)*(fx(a)+fx(b)+4*tongle+2*tongchan);
    elseif ChonPPTP == "Simpson 3/8"
        h = (b-a)/N;
        tong = 0;
        tongboiba = 0;
        for i = 1:1:N-1
            if mod(i,3)~=0
                tong = tong + fx(a+i*h);
            end
        end
        for i = 3:3:N-3
            tongboiba = tongboiba + fx(a+i*h);
        end
    y = (3*h/8)*(fx(a)+fx(b)+3*tong+2*tongboiba);
    end
end
