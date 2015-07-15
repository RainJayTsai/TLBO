       %% Prepared by Dr. R. VENKATA RAO and Dr. VIVEK PATEL  %%

function yy=objective(x)

%clc;

for ikl=1 : 13 %有幾個變數

    p(ikl)=x(ikl);

end

sum1=0;

sum2=0;

sum3=0;

for ikl=1 : 4

    z1=p(ikl);

    z2=(p(ikl))^2;

sum1=sum1+z1;

sum2=sum2+z2;

end 

for ikl=5 : 13

    z3=p(ikl);

    sum3=sum3+z3;

end

z4=5*sum1;

z5=5*sum2;

z6=z4-z5-sum3;

t1=(2*p(1))+(2*p(2))+p(10)+p(11);

t2=(2*p(1))+(2*p(3))+p(10)+p(12);

t3=(2*p(2))+(2*p(3))+p(11)+p(12);

t4=(-8*p(1))+p(10);

t5=(-8*p(2))+p(11);

t6=(-8*p(3))+p(12);

t7=(-2*p(4))-p(5)+p(10);

t8=(-2*p(6))-p(7)+p(11);

t9=(-2*p(8))-p(9)+p(12);

 

nc=9;

          g1(1)=t1-10;

            g1(2)=t2-10;

            g1(3)=t3-10;

            g1(4)=t4;

            g1(5)=t5;

            g1(6)=t6;

            g1(7)=t7;

            g1(8)=t8;

            g1(9)=t9;

           

            fun=0;

            vio=0;

            for io=1:nc

                if g1(io)>0

                    fun=fun+g1(io)^2;

                    vio=vio+1;

                end

            end

               

yy=(z6)+(1e5*fun)+(vio*1e3);



            %% Prepared by Dr. R. VENKATA RAO and Dr. VIVEK PATEL  %%