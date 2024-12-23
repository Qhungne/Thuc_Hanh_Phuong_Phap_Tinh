function dx = DaoHamHamSo(f,h,x,pp,ss)
            if (pp == "Chiều tiến")
                if (ss == "O(h)")
                    dx = (f(x+h)-f(x))/h;
                elseif (ss == "O(h^2)")
                    dx = (4*f(x+h)-3*f(x)-f(x+2*h))/(2*h);
                end
            elseif (pp == "Chiều lùi")
                if (ss == "O(h)")
                    dx = (f(x)-f(x-h))/h;
                elseif (ss == "O(h^2)")
                    dx = (3*f(x)-4*f(x-h)+f(x-2*h))/(2*h);
                end
            elseif (pp =="Trung tâm")
                if (ss == "O(h^4) - Chiều trung tâm")
                    dx = (-f(x+2*h)+8*f(x+h)-8*f(x-h)+f(x-2*h))/(12*h);
                elseif (ss == "O(h^2)")
                    dx =  (f(x+h)-f(x-h))/(2*h);
                end
            end
end


     