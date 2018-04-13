function [HMM,Network] = HMM_Step(HMM,Network,k)              
    if k > 1
        ProbDistVec = HMM.MotMdl(HMM.TrueStates(1,k-1),:);
        HMM.TrueStates(1,k) = SampleFromDist(ProbDistVec,1);
    end
    for i = 1:Network.NumNodes
        ProbDistVec = Network.Node(i).ObsMdl(HMM.TrueStates(1,k),:);
        Network.Node(i).z(1,k) = SampleFromDist(ProbDistVec,1);
    end
end