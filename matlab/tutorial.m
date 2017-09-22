%% MATLAB TUTORIAL! %%
%% Section 1: Variable assignment
a = 5
b = pi
b = a

%% Use semicolons to supress output
a = 5;
b = pi;
b = a;
% Show them the command line to check variable values

%% Arrays
fibs = [1 1 2 3 5 7 13];
% Range notation
a_range = 1:10;
% Step size
a_range_step2 = 1:2:10;
a_range_halfstep = 1:.5:10;

%% Matrix assignment
mat1 = [1 2 3; 4 5 6];
mat1_again = [1 2 3;
                4 5 6];
% Ranges in matrices
mat_range = [1:10; 11:20];

%% Indexing
mat1(1,1);
mat1(1,2);
mat1(2,1);
% Use colon
mat1(2,:);
mat1(:,3);
% Size
size(mat1)

%% Math
c = a + b;
d = cos(c) + sin(a) + tan(b);
% What if we do it with a matrice?
sin(mat_range);
% Multiplication with matrices
mat_range2 = [1:2:20; 20:2:39];
mat_range_product = mat_range2 .* mat_range;
% Constants and matrices
const_mat = mat_range + mat_range2 + d;
% Sum
sum_of_cols = sum(const_mat);
sum_of_rows = sum(const_mat,2);
sum_of_both = sum(sum(const_mat));

%% Logical indexing
% We can also create logical arrays
rand_mat = rand(10);
% How many are greater than .5?
hlf_logical = rand_mat > .5;
% hlf is a logical array
sum(sum(hlf_logical))
% Return the values
hlf_vals = rand_mat(hlf_logical);
% Take the sum 
sum_of_hlf_vals = sum(hlf_vals);
% Can be done in one line:
sum_of_hlf_vals = sum(rand_mat(rand_mat > .5));

%% For loops
% Note that matlab just loops through an array on element at a time 
for index=1:10
    rand_mat(1,index) + rand_mat(index,1)
end

%% If statements
% We can check if an element is greater than some constant
if rand_mat(1) > .1
    disp('It is bigger than .1!');
else 
    disp('It is not bigger than .1!');
end