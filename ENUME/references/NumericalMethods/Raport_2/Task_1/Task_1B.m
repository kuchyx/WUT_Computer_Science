%----- Initialise Workspace -----%
clear; 
clc;

%----- The Newton's Method -----%

%----- Initial interval, suspected of contain fnTask_1 roots -----% 
lower_bound = 2;
upper_bound = 11;

%----- Display Roots of function fnTask_1 -----%
the_newton_s(lower_bound, upper_bound);