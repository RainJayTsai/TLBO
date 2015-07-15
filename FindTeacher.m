function [ teacher ] = FindTeacher( student,flag )

if flag == 1
   [ m i ] = max( vertcat( student.result ) );
else
    [ m i ] = min( vertcat( student.result ) );
end
teacher = student( i ).mark;


end

