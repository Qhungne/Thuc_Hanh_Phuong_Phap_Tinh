function [a0, a1, r2] = HoiQuy(mangX, mangY)
    n = length(mangX);
    sumX = 0;
    sumY = 0;
    sumXY = 0;
    sumX2 = 0;
    st = 0;
    sr = 0;
    for i = 1:n
        sumX = sumX + mangX(i); 
        sumY = sumY + mangY(i);   
        sumXY = sumXY + mangX(i)*mangY(i);
        sumX2 = sumX2 + mangX(i)*mangX(i);
    end
    xm = sumX/n;
    ym = sumY/n;
    a0 = (n*sumXY - sumX*sumY)/(n*sumX2-sumX*sumX);
    a1 = ym - a0*xm;
    for i = 1:n
        st = st + (mangY(i)-ym)^2;
        sr = sr + (mangY(i) - a0*mangX(i) - a1)^2;
    end 
    r2 = (st - sr)/st;
end

