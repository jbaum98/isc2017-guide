%% MATLAB TUTORIAL! %%
%% Section 1: Variable assignment
% MATLAB isn't strongly typed:
a = 5
b = pi
b = a

%% Use semicolons
a = 5;
b = pi;
b = a;

%% Arrays
fibs = [1 1 2 3 5 7 13];
% Range notation
a_range = 1:10;
% Step size
a_range_step2 = 1:2:10
a_range_halfstep = 1:.5:10

%% Matrix assignment
mat1 = [1 2 3; 4 5 6];
mat1_again = [1 2 3;
                4 5 6];
% Ranges in matrices
mat_range = [1:10; 11:20];

%% Indexing
mat1(1,1)
mat1(1,2)
mat1(2,1)
% Use colon
mat1(2,:)
mat1(:,3)
% Size
size(mat1)