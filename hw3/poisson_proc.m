% pts = poisson_proc(X,Y,lamda) generates a poisson point process with parameter
% lamda in the 1-dimentional interval [0, X] or the 2-dimentional
% rectangular area [(0,0), (X,Y)] . To generate 1-dimensional poisson
% process set Y=0. Assume unit of X and Y is meter. pts is a column vector
% (in 1-dimensional case) and a matrix (in 2-dimensional) case.
% Course: Networks out of Control, EPFL
% Date: May 2016


function pts=poisson_proc(X,Y,lamda)
if Y==0
    %%% generate 1D poisson process
    n=random('poisson',X*lamda);  %The number of points to generate
    pts=rand(n,1);
    pts(:,1)=pts(:,1)*X;
    pts=sort(pts);    
else
    %%% generate 2D poisson process
    n=random('poisson',X*Y*lamda);  %The number of points to generate
    pts=rand(n,2);
    pts(:,1)=pts(:,1)*X;
    pts(:,2)=pts(:,2)*Y;
end
end    
