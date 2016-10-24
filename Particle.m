function swarm = Particle(swarm,TargetFun)

global Select_Point;
    para=zeros(1,17);
	
   %update  position with the velocit
	   for i=1:17
		  swarm(1, 1, i) = swarm(1, 1, i) + swarm(1, 2, i);  
		  para(i) = swarm(1, 1, i);
	   end
     
   
   %MSE
   
        P_Mout=Computing_Model_PSO_test_allpara(Select_Point(1:101),para);
        
        error=TargetFun-P_Mout;
        mse_new = sum(error.^2)/100;
		
   %
   
      if mse_new < swarm(1,4,1)
		for i=1:17
		   swarm(1,3,i)=swarm(1,1,i);  % update best position
		end  
	       swarm(1,4,1)=mse_new;
      end