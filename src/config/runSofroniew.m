%% Set relevant paths
homePath   = '/hpc/stats/users/dbp2112/Janelia';
dataPath   = fullfile(homePath,'data');
resultPath = fullfile(homePath,'results');
logPath    = fullfile(homePath,'logs')
dataset    = 'an216166_2';
addpath(genpath('/hpc/stats/users/dbp2112/Janelia/quagga'));

config.neuronSz = [10,10,1]; % size of the average neuron, in pixels
config.patchSz = [20,20,1];
config.patchLoader = @(x,y,z) tiffLoader(x,y,z,fullfile(dataPath,dataset));
config.stdThresh = 0; % Just let everything through
config.stdPrctile = 50; % So long as stdThresh is zero, this doesn't matter

runQuaggaTorque