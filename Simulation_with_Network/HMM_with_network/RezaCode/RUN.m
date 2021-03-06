function [World,HMM] = RUN()
    %% Define and chaeck constants as global var: Consts
    global Consts
    SetConsts();
    %% Creation of the world: World
    World = CreateWorld('World_small.bmp');
    %% Initialization of the Hiden Markov Model: HMM
    HMM = InitHMM(World);
    %% Initialization of the Simulation: Sim
    Sim = InitSim();
    %% Sampling from the HMM
    for t = 1:Consts.BaseRate:Consts.SimTime
        %% HMM STEP
        if mod(t,Consts.MarkovRate) == 0            
            Sim = HMM_Step(HMM,Sim);
        end
        %% Observation STEP
        if mod(t,Consts.ObsRate) == 0
            
        end
        %% Network STEP
        if mod(t,Consts.NetRate) == 0
            
        end
        %% Processing
            
    end
    %% Animation
    AnimateSim(World,Sim);
end