function [dx] = DaoHamChuoi(xa,ya,giatri,pp,ss)
    h = xa(2) - xa(1);
    index = (giatri- xa(1))/h +1;
    index = cast(index,'uint16');
    if pp == "Chiều tiến"
        if(ss =="O(h^2)" )
        dx = (4*ya(index+1) - ya(index+2) - 3*ya(index))/(2*h);
        elseif(ss == "O(h)")
        dx = (-ya(index)+ya(index+1))/h;
        end
    elseif pp == "Chiều lùi"
        if (ss == "O(h^2)")
        dx = (-4*ya(index-1) + ya(index-2) + 3*ya(index))/(2*h);
        elseif(ss =="O(h)")
        dx = (-ya(index-1) + ya(index))/h;
        end
    elseif pp == "Trung tâm"
        if (ss == "O(h^2)" )
        dx = (ya(index+1)-ya(index-1))/(2*h);
        elseif(ss == "O(h^4) - Chiều trung tâm")
        dx = (-ya(index+2)+8*ya(index+1)-8*ya(index-1)+ya(index-2))/(12*h);
        end
    end
end