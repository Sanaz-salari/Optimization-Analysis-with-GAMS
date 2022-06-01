* Lancaster's water distribution system: This is a LP
Set pump / 1*10 /;
alias(pump,j);
parameter c(j) 'costs of operating each pump'
         /1 0.05, 2 0.05, 3 0.05, 4 0.07, 5 0.07, 6 0.07, 7 0.13, 8 0.13, 9 0.13, 10 0.13/;
*positive variables x(j) 'x(j)= pump rate per minute of pump j, j=1,…,10' ;
positive variables x(j) 'x(j) is pump rate of pump j';
variable cost;

equations
         Con1,
         Con2,
         Con3,
         Con4,
         Con5,
         Con6,
         Con7,
         Con8,
         Con9,
         Con10,
         Con11,
         Con12,
         Con13,
         Con14,
         Obj
;

Con1 .. x('1') + x('4') + x('7') =l= 3000;
Con2 .. x('2') + x('5') + x('8') =l=2500;
Con3 .. x('3') + x('6') + x('10') =l=7000;
Con4 .. x('1') =l=1100;
Con5 .. x('2') =l=1100;
Con6 .. x('3') =l=1100;
Con7 .. x('4') =l=1500;
Con8 .. x('5') =l=1500;
Con9 .. x('6') =l=1500;
Con10 .. x('7') =l=2500;
Con11 .. x('8') =l=2500;
Con12 .. x('9') =l=2500;
Con13 .. x('10') =l=2500;
Con14 .. sum(j, x(j)) =e= 10000;
Obj ..  cost =e= sum(j, c(j) * x(j));

model m1 /all/ ;

solve  m1 minimizing cost using LP;




