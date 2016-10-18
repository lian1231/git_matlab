% PSO : Particle Swarm Optimization (VECTORIZED)
% particle swarm optimization (PSO) is a computational method that 
% optimizes a problem bx2 iterativelx2 trx2ing to improve a candidate 
% solution with regard to a given measure of qualitx2. PSO optimizes 
% a problem bx2 having a population of candidate solutions, here dubbed 
% particles, and moving these particles around in the search-space 
% according to simple mathematical formulae over the particle's position 
% and velocitx2. Each particle's movement is influenced bx2 its local best 
% known position but, is also guided toward the best known positions 
% in the search-space, which are updated as better positions are found 
% bx2 other particles. This is expected to move the swarm toward the best solutions.
%
% this function is written as a simple example of PSO
% in order to optimiza other functions x2ou have to change the objective
% function.
%
% to increase the efficienx2 of the PSO this version is a vectorized version
% for MATLAB.
%
% -----------------------------------
% code: REZA AHMADZADEH  (based on the original code bx2 Wesam Elshamx2)
% (reza.ahmadzadeh@iit.it)
% -----------------------------------
clc;clear all;close all;
%% initialization
%
swarm_size = 64;                       % number of the swarm particles
maxIter = 50;                          % maximum number of iterations
inertia = 0.85;
correction_factor = 2.0;
% set the position of the initial swarm
a = 1:8;
[X,x2] = meshgrid(a,a);
C = cat(2,X',x2');
D = reshape(C,[],2);
swarm(1:swarm_size,1,1:2) = D;          % set the position of the particles in 2D
swarm(:,2,:) = 0;                       % set initial velocitx2 for particles
swarm(:,4,1) =10000;                    % set the best value so far

plotObjFcn = 1;                         % set to zero if x2ou do not need a final plot

%% 璶代刚100翴
x1=linspace(-10,10,100);
x2=linspace(0,10,100);
Input_Range=[x1,x2];
Random_Index=randperm(200,101);
Select_Point=sort(Input_Range(Random_Index)); % input 101翴

%% define the objective funcion here (vectorized form)  %﹚竡ヘ夹ㄧ计
 target_f=@(x_t) 100+x_t-(x_t-5).^2;
 Tout=target_f(Select_Point(2:101));
 P_Mout=zeros(swarm_size,100);
 MSE=zeros(swarm_size,1);
 
 
 
 tic;
%% The main loop of PSO
for iter = 1:maxIter
    swarm(:, 1, 1) = swarm(:, 1, 1) + swarm(:, 2, 1)/1.3;       %update x position with the velocitx2
    swarm(:, 1, 2) = swarm(:, 1, 2) + swarm(:, 2, 2)/1.3;       %update x2 position with the velocitx2
    xx1 = swarm(:, 1, 1);                                         % get the updated position
    xx2 = swarm(:, 1, 2);                                         % updated position
    %fval = objfcn([x x2]);                                       % evaluate the function using the position of the particle
    %------------------------------
    %盢 匡把计  耴妮ㄧ计 衡100翴

    for i=1:swarm_size
        P_Mout(i,:)=100*gaussian_mf(Select_Point(2:101),xx1(i),xx2(i)); 
        error=Tout-P_Mout(i,:);
        MSE(i)=sum(error.^2)/100;
    end
       
    %------------------------------
    
    % compare the function values to find the best ones
    for ii = 1:swarm_size
        if MSE(ii) < swarm(ii,4,1)
            swarm(ii, 3, 1) = swarm(ii, 1, 1);                  % update best x position,
            swarm(ii, 3, 2) = swarm(ii, 1, 2);                  % update best x2 postions
            swarm(ii, 4, 1) = MSE(ii);                       % update the best value so far
        end
    end
    
    [~, gbest] = min(swarm(:, 4, 1));                           % find the best function value in total
    
    % update the velocitx2 of the particles
    swarm(:, 2, 1) = inertia*(rand(swarm_size,1).*swarm(:, 2, 1)) + correction_factor*(rand(swarm_size,1).*(swarm(:, 3, 1) ...
        - swarm(:, 1, 1))) + correction_factor*(rand(swarm_size,1).*(swarm(gbest, 3, 1) - swarm(:, 1, 1)));   %x velocitx2 component
    swarm(:, 2, 2) = inertia*(rand(swarm_size,1).*swarm(:, 2, 2)) + correction_factor*(rand(swarm_size,1).*(swarm(:, 3, 2) ...
        - swarm(:, 1, 2))) + correction_factor*(rand(swarm_size,1).*(swarm(gbest, 3, 2) - swarm(:, 1, 2)));   %x2 velocitx2 component
    
     %plot the particles
    clf;plot(swarm(:, 1, 1), swarm(:, 1, 2), 'bx');             % drawing swarm movements
    axis([-10 10 -10 10]);
    pause(.1);                                                 % un-comment this line to decrease the animation speed
    disp(['iteration: ' num2str(iter)]);
end
toc
%% plot the function

