function [value num_array ] = TLBO( objective_function, max_min_sym, max_limit, min_limit, varargin)

flag = 1;
if strcmp( lower( max_min_sym ),'min' )
    max_min_sym = '<';
    flag = 0;
elseif strcmp( lower( max_min_sym ),'max' )
    max_min_sym = '>';
    flag = 1;
end
 
%format long;

[ x max_y ] = size( max_limit );
[ x1 min_y ] = size( min_limit);

if x ~= 1 || x1 ~= 1 ||  max_y ~= min_y
    disp('error in limit matrix');
    return;
end

num = max_y;
classsize = 50;
iteration = 500;

if nargin >= 5
    classsize = varargin{1};
end
if nargin == 6
     iteration = varargin{2};
end

rand_gen = round(sum(100*clock));
rand('state', rand_gen);


students = init( classsize, max_limit, min_limit,  num, objective_function  );


for i = 1: iteration
    for j = 1: length( students )
        
        
        
        %% 
        %teaching  start
        teacher = FindTeacher( students, flag );
       
        mean_mark = mean(  vertcat( students.mark ) );
        TF = round(1+rand*(1));

        mark_new =  students(j).mark+  ( teacher  - TF*mean_mark ) .* rand(1,num);
        
        ind = find( mark_new < min_limit);
        mark_new( ind ) = min_limit( ind );
        ind = find( mark_new > max_limit);
        mark_new( ind ) = max_limit( ind );
        
        
        result_new = objective_function( mark_new  );
        
       % if eval( [ 'result_new', max_min_sym , 'students(j).result ' ] ) == true
       if flag == 1
           if result_new > students(j).result
                students( j ).mark = mark_new;
                students( j ).result = result_new;
           end
       else
             if result_new < students(j).result
                students( j ).mark = mark_new;
                students( j ).result = result_new;
           end
        end
        %teaching end
        %%
        
        %%
        %learning start
        
        learningStudentIndex = ceil(length(students)*rand);
        while learningStudentIndex == j 
            learningStudentIndex = ceil(length(students)*rand);
        end
        
        if students( learningStudentIndex ).result < students( j ).result 
       % if eval( [ 'students( learningStudentIndex ).result', max_min_sym , 'students( j ).result  ' ] ) == true 
            mark_new = students(j).mark + ( students(j ).mark - students( learningStudentIndex ).mark ).*rand(1,num);
        else
            mark_new = students(j).mark + ( students(learningStudentIndex ).mark - students( j ).mark ).*rand(1,num);
        end
         ind = find( mark_new < min_limit);
        mark_new( ind ) = min_limit( ind );
        ind = find( mark_new > max_limit);
        mark_new( ind ) = max_limit( ind );
        result_new = objective_function( mark_new  );
      % if eval( [ 'result_new', max_min_sym , 'students(j).result ' ] ) == true 
         %   students( j ).mark = mark_new;
         %   students( j ).result = result_new;
         if flag == 1
           if result_new > students(j).result
                students( j ).mark = mark_new;
                students( j ).result = result_new;
           end
       else
             if result_new < students(j).result
                students( j ).mark = mark_new;
                students( j ).result = result_new;
             end
         end
        
        %learning end
        %%
        
        
    end
end


if flag == 1
    [value index ] = max( vertcat( students.result ) );
else
    [value index ] = min( vertcat( students.result ) );
end
num_array = [ students( index).mark ] ; 

fprintf('\n %e', value);
fprintf('\n------g--------------');
fprintf('\n%6.3f',num_array);
fprintf('\n');    
    
end