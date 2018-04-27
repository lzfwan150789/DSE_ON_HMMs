function [Network] = NGCF(Network,HMM,k)
% Our approach: Conservative fusion of priors + Consensus over current
% Observations (#4)

% prediction 
Network = predict(Network,HMM,k);

% calculating the likelihood based on prediction 
Network = CalcLikelihood(Network,k);

Network = LocalEstimateCalc(Network,'GCF',k);


% iterative conservative fusion of priors
% choose VGCF for ICF without optmizaton and based on CL weights
% Network = IterativeConservativeFusion(Network,'GCF',k);
Network = IterativeConservativeFusion(Network,'VGCF',k);



% update 
Network = EstimateUpdate(Network,'GCF',k);

% process and performance evaluation


end