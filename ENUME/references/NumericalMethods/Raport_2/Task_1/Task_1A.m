%----- Initialise Workspace -----%
clear; 
clc;

%----- The Bisection Method -----%

%----- Initial interval, suspected of contain fnTask_1 roots -----% 
lower_bound = 2;
upper_bound = 11;

%----- Display Roots of function fnTask_1 -----%
the_bisection(lower_bound, upper_bound);
