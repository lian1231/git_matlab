function output=PSO(TargetOut,mse_orign)

swarm_size= 20;                            %采计
maxIter=10 ;                               %程厩策Ω计
Omega_w=0.6+(0.95-0.6).*rand(1) ;          %把计[0.6,0.95]
correction_factor1=1.8+(2.2-1.8).*rand(1); %把计[1.8,2.2]
correction_factor2=1.8+(2.2-1.8).*rand(1); %把计[1.8,2.2]
swarm(1:swarm_size,1,:)=randi([50,100],swarm_size,17);%﹍竚
swarm(:,2,:)=0;                             %﹍硉
swarm(:,4,1)=mse_orign;                     %ヘ玡ゎ程MSE

% start to learn
figure(2);
for iter=1:maxIter

    %采
    for i=1:swarm_size
        swarm(i,:,:)= Particle(swarm(i,:,:),TargetOut);
    end
  
   
    [~,gbest]=min(swarm(:,4,1));
    disp(swarm(gbest,4,1));
    for ii=1:17
       swarm(:, 2, ii) = Omega_w.*swarm(:, 2, ii)...
                        + correction_factor1*(rand(swarm_size,1).*(swarm(:, 3, ii)- swarm(:, 1, ii)))...
                        + correction_factor2*(rand(swarm_size,1).*(swarm(gbest, 3, ii) - swarm(:, 1, ii)));
    end
  
    hold on;
    figure(2);
    plot(iter,swarm(gbest,4,1),'.b');
end

title('MSE 厩策跑て');
xlabel('iterate');ylabel('MSE');
output=swarm(gbest, 3, 1:17);

