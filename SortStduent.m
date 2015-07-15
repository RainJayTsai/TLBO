function [ Student ] = SortStduent( Student )
    rslt = [ Student.result ];
    [r i ] = sort( rslt,'descend' );
    cellS = struct2cell( Student );
    cellS = cellS( :,:,i );
    Student = cell2struct( cellS, {'mark', 'result'},1);
end

