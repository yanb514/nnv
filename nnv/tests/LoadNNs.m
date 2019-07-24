%% Run examples to load a FNN from different formats using nnmt
[v,e,l] = pyversion;
% Check OS running on
osc = computer;
if contains(osc,'WIN')
    sh = '\'; % windows
else 
    sh = '/'; % mac and linux
end

% Find the path to the python to use, in case that python does not have all
% dependencies needed, look at help pyversion and py.sys.path to choose the
% correct python environment
e = split(string(e),sh);
e = erase(e,e(end));
pypath = strjoin(e,sh);

% Get paths to the inputs for the first example
genp = split(string(pwd),sh);
rp = {'nnv','nnv','tests'};
if ~isequal(genp(end-2:end),string(rp)')
    error('Executing from %s. \nPlease, change your current folder path to ../nnv/nnv/tests and run script again',pwd);
end
cd ..
fp = pwd; % Final path used for calling all the future examples
disp('Coverting neural network 1')
cont1 = load_nn(pypath,[fp sh 'engine' sh 'nnmt'],[fp sh 'engine' sh 'nnmt' sh 'original_networks' sh 'neural_network_information_13'],[fp sh 'engine' sh 'nnmt' sh 'translated_networks'],'Sherlock','');
disp('Coverting neural network 2')
cont2 = load_nn(pypath,[fp sh 'engine' sh 'nnmt'],[fp sh 'engine' sh 'nnmt' sh 'original_networks' sh 'neural_network_information_2'],[fp sh 'engine' sh 'nnmt' sh 'translated_networks'],'Sherlock','');
disp('Coverting neural network 3')
cont3 = load_nn(pypath,[fp sh 'engine' sh 'nnmt'],[fp sh 'engine' sh 'nnmt' sh 'original_networks' sh 'MC_16sigX16sigX1tanh.h5'],[fp sh 'engine' sh 'nnmt' sh 'translated_networks'],'Keras','');
disp('Coverting neural network 4')
cont4 = load_nn(pypath,[fp sh 'engine' sh 'nnmt'],[fp sh 'engine' sh 'nnmt' sh 'original_networks' sh 'ACASXU_run2a_4_3_batch_2000.nnet'],[fp sh 'engine' sh 'nnmt' sh 'translated_networks'],'Reluplex','');
disp('Coverting neural network 5')
cont5 = load_nn(pypath,[fp sh 'engine' sh 'nnmt'],[fp sh 'engine' sh 'nnmt' sh 'original_networks' sh 'ACASXU_run2a_5_8_batch_2000.nnet'],[fp sh 'engine' sh 'nnmt' sh 'translated_networks'],'Reluplex','');
disp('Coverting neural network 6')
cont6 = load_nn(pypath,[fp sh 'engine' sh 'nnmt'],[fp sh 'engine' sh 'nnmt' sh 'original_networks' sh 'CartPole_Controller.h5'],[fp sh 'engine' sh 'nnmt' sh 'translated_networks'],'Keras',[fp sh 'engine' sh 'nnmt' sh 'original_networks' sh 'CartPole_Controller.json']);
disp('Coverting neural network 7')
cont7 = load_nn(pypath,[fp sh 'engine' sh 'nnmt'],[fp sh 'engine' sh 'nnmt' sh 'original_networks' sh 'example2' sh 'example2.meta'],[fp sh 'engine' sh 'nnmt' sh 'translated_networks'],'Tensorflow',[fp sh 'engine' sh 'nnmt' sh 'original_networks' sh 'example2']);

disp('We have succesfully converted all the neural networks!');


%% At the end, delete all variables except for the controllers created
cd tests
clearvars -except cont1 cont2 cont3 cont4 cont5 cont6 cont7