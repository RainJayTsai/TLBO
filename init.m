function [Student] = init( classsize, max, min, num, obj_func)


for i = 1: classsize
    
    for k = 1: num
        mark(k) =(min(k))+ ((max(k) - min(k)) * rand); 
    end
    Student( i ).mark = mark;
    Student( i ).result = obj_func( mark );
end
    
    Student = SortStduent( Student );
end


