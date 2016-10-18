% パ 祘Α main_1012 ㊣秈pso

global MSE_ori;
%% initialization
%
swarm_size = 24;                       % number of the swarm particles
maxIter = 70;                          % maximum number of iterations
inertia = 0.85;
correction_factor = 2.0;
% set the position of the initial swarm
a = 1:12;
[X1,X2] = meshgrid(a,a);
C = cat(2,X1',X2');
D = reshape(C,[],12);
swarm(1:swarm_size,1,1:12) = D;          % set the position of the particles in 2D
swarm(:,2,:) = 0;                       % set initial velocitx2 for particles
swarm(:,4,1) =MSE_ori;                    % set the best value so far   (MSE)


%% 璶代刚100翴
x1=linspace(-10,10,100);
x2=linspace(0,10,100);
Input_Range=[x1,x2];
Random_Index=randperm(200,101);
Select_Point=sort(Input_Range(Random_Index)); % input 101翴

%% define the objective funcion here (vectorized form)  %﹚竡ヘ夹ㄧ计
 target_f=@(x_t) 2-10*x_t+(5)*x_t.^2;
 Tout=target_f(Select_Point(2:101));
 P_Mout=zeros(swarm_size,100);
 MSE=zeros(swarm_size,1);
 
 tic;
%% The main loop of PSO
for iter = 1:maxIter
    swarm(:, 1, 1) = swarm(:, 1, 1) + swarm(:, 2, 1);       %update x position with the velocitx2
    swarm(:, 1, 2) = swarm(:, 1, 2) + swarm(:, 2, 2);       %update x2 position with the velocitx2
    swarm(:, 1, 3) = swarm(:, 1, 3) + swarm(:, 2, 3); 
    swarm(:, 1, 4) = swarm(:, 1, 4) + swarm(:, 2, 4); 
    swarm(:, 1, 5) = swarm(:, 1, 5) + swarm(:, 2, 5); 
    swarm(:, 1, 6) = swarm(:, 1, 6) + swarm(:, 2, 6); 
    swarm(:, 1, 7) = swarm(:, 1, 7) + swarm(:, 2, 7); 
    swarm(:, 1, 8) = swarm(:, 1, 8) + swarm(:, 2, 8); 
    swarm(:, 1, 9) = swarm(:, 1, 9) + swarm(:, 2, 9); 
    swarm(:, 1, 10) = swarm(:, 1, 10) + swarm(:, 2,10); 
    swarm(:, 1, 11) = swarm(:, 1, 11) + swarm(:, 2, 11); 
    swarm(:, 1, 12) = swarm(:, 1, 12) + swarm(:, 2, 12); 
    para1 = swarm(:, 1, 1);                                     % get the updated position
    para2 = swarm(:, 1, 2);                                     % updated position
    para3 = swarm(:, 1, 3);
    para4 = swarm(:, 1, 4);
    para5 = swarm(:, 1, 5);
    para6 = swarm(:, 1, 6);
    para7 = swarm(:, 1, 7);
    para8 = swarm(:, 1, 8);
    para9 = swarm(:, 1, 9);
    para10 = swarm(:, 1, 10);
    para11 = swarm(:, 1, 11);
    para12 = swarm(:, 1, 12);
   
    %------------------------------
    %盢 匡把计  耴妮ㄧ计 衡100翴

    for i=1:swarm_size
       
        para=[para1(i) para2(i) para3(i) para4(i) para5(i) para6(i) para7(i) para8(i) para9(i) para10(i) para11(i) para12(i)];
        P_Mout=Computing_Model_PSO_test(Select_Point(1:101),para);
        
        error=Tout-P_Mout;
        MSE(i)=sum(error.^2)/100;
    end
       
    %------------------------------
    
    % compare the function values to find the best ones
    for ii = 1:swarm_size
        if MSE(ii) < swarm(ii,4,1)
             for i=1:12
                 swarm(ii, 3, i) = swarm(ii, 1, i);             % update best position
             end
           
            swarm(ii, 4, 1) = MSE(ii);                          % update the best value so far
        end
    end
    
    [~, gbest] = min(swarm(:, 4, 1));                           % find the best function value in total
    
    % update the velocitx2 of the particles
    for i=1:12
        swarm(:, 2, i) = inertia*(rand(swarm_size,1).*swarm(:, 2, i)) + correction_factor*(rand(swarm_size,1).*(swarm(:, 3, i) ...
        - swarm(:, 1, i))) + correction_factor*(rand(swarm_size,1).*(swarm(gbest, 3, i) - swarm(:, 1, 1)));   %x velocitx2 component
    end
    
    
end
toc
%% plot the function
