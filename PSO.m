function output=PSO(TargetOut,mse_orign)

swarm_size= 20;                            %�ɤl��
maxIter=10 ;                               %�̤j�ǲߦ���
Omega_w=0.6+(0.95-0.6).*rand(1) ;          %�Ѽ�[0.6,0.95]
correction_factor1=1.8+(2.2-1.8).*rand(1); %�Ѽ�[1.8,2.2]
correction_factor2=1.8+(2.2-1.8).*rand(1); %�Ѽ�[1.8,2.2]
swarm(1:swarm_size,1,:)=randi([50,100],swarm_size,17);%��l��m
swarm(:,2,:)=0;                             %��l�t��
swarm(:,4,1)=mse_orign;                     %�ثe����̦n��MSE

% start to learn
figure(2);
for iter=1:maxIter

    %�ɤl����
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

title('MSE �ǲ��ܤ�');
xlabel('iterate');ylabel('MSE');
output=swarm(gbest, 3, 1:17);

