import numpy as np
from random import random


# initializes all parameters of the neural network (weights and biases) with random values
def init_network_random(input_num,hidden_num,output_num):
    # parameters hidden layer
    param_hidden = []
    for i in range(hidden_num):
        weights = [random() for j in range(input_num)]
        bias = random()
        param_neuron = dict(weights=weights,bias=bias)
        param_hidden.append(param_neuron)
    # parameters output layer   
    param_output = []
    for i in range(output_num):
        weights = [random() for j in range(hidden_num)]
        bias = random()
        param_neuron = dict(weights=weights,bias=bias)
        param_output.append(param_neuron)
    # create parameter dictionary
    param = dict(hidden=param_hidden,output=param_output)    
    return param

# initializes all parameters of the neural network (weights and biases) with given value
def init_network_value(input_num,hidden_num,output_num,value):
    # parameters hidden layer
    param_hidden = []
    for i in range(hidden_num):
        weights = [value for j in range(input_num)]
        bias = value
        param_neuron = dict(weights=weights,bias=bias)
        param_hidden.append(param_neuron)
    # parameters output layer  
    param_output = []
    for i in range(output_num):
        weights = [value for j in range(hidden_num)]
        bias = value
        param_neuron = dict(weights=weights,bias=bias)
        param_output.append(param_neuron)
    # create parameter dictionary
    param = dict(hidden=param_hidden,output=param_output)    
    return param  
     

# calculates logistic sigmoid function
def logistic_sigmoid(x):
    return 1/(1+np.exp(-x))

# calculates derivative of logistic sigmoid function
def derivative_logistic_sigmoid(x):
    return np.exp(-x) / pow((1+np.exp(-x)),2)


# calculates loss function
def loss_function(x,x_exact):
    return (x-x_exact).dot(x-x_exact)/2


# calculates (w^T * x + b) for w weights and b bias
def lin_comb(param,x):
    z = 0    
    z += x.dot(param['weights'])    
    z += param['bias']
    return z


# performs forward pass, returns values x and z of all neurons              
def forward_pass(param,inputs):
    hidden_num = len(param['hidden'])
    output_num = len(param['output']) 
    # x and z values of hidden layer       
    z_hidden = np.zeros(hidden_num)
    x_hidden = np.zeros(hidden_num)
    for i in range(hidden_num):
        param_neuron = param['hidden'][i]
        z_hidden[i] = lin_comb(param_neuron,inputs)
        x_hidden[i] = logistic_sigmoid(z_hidden[i])
    # x and z values of output layer
    z_output = np.zeros(output_num)
    x_output = np.zeros(output_num)
    for i in range(output_num):
        param_neuron = param['output'][i]
        z_output[i] = lin_comb(param_neuron,x_hidden)
        x_output[i] = logistic_sigmoid(z_output[i])
    # create x and z dictionaries    
    z = dict(hidden=z_hidden,output=z_output)
    x = dict(hidden=x_hidden,output=x_output)
    return z,x


# performs backward pass, returns delta values of all neurons
def backward_pass(param,z,x,output_exact):
    hidden_num = len(param['hidden'])
    output_num = len(param['output'])
    # delta values of output layer
    delta_output = np.zeros(output_num)
    for i in range(output_num):
        delta_output[i] = derivative_logistic_sigmoid(z['output'][i]) * (x['output'][i] - output_exact[i]) # 5.40 in the lecture notes
    # delta values of hidden layer
    delta_hidden = np.zeros(hidden_num)
    for i in range(hidden_num):
        for j in range(output_num):
            delta_hidden[i] = delta_output[j] * param['output'][j]['weights'][i]
        delta_hidden[i] *= derivative_logistic_sigmoid(z['hidden'][i])              # 5.41 in the lecture notes
    # create delta dictionary
    delta = dict(hidden = delta_hidden,output=delta_output)        
    return delta
    

# computes derivative of loss function wrt all weights and biases
def calc_derivatives_loss_function(inputs,param,delta,x):
    inputs_num = len(inputs)
    hidden_num = len(param['hidden'])
    output_num = len(param['output'])
    # derivatives hidden layer
    der_bias_hidden = np.zeros(hidden_num)
    der_weights_hidden = []
    for i in range(hidden_num):
        # derivative wrt bias
        der_bias_hidden[i] = delta['hidden'][i] # 5.42 in the lecture notes
        # derivatives wrt weights
        der_weights_one_neuron = np.zeros(inputs_num)
        for j in range(inputs_num):
            der_weights_one_neuron[j] = delta['hidden'][i] * inputs[j]  # 5.43 in the lecture notes
        der_weights_hidden.append(der_weights_one_neuron)
    # derivatives output layer     
    der_bias_output = np.zeros(output_num)
    der_weights_output = []            
    for i in range(output_num):   
        der_bias_output[i] = delta['output'][i] # 5.42 in the lecture notes
        der_weights_one_neuron = np.zeros(hidden_num)
        for j in range(hidden_num):
            der_weights_one_neuron[j] = delta['output'][i] * x['hidden'][j]  # 5.43 in the lecture notes
        der_weights_output.append(der_weights_one_neuron)
    # create derivatives dictionary    
    der_hidden = dict(weights=der_weights_hidden,bias=der_bias_hidden)
    der_output = dict(weights=der_weights_output,bias=der_bias_output)
    der = dict(hidden=der_hidden,output=der_output)
    return der        



if __name__ == "__main__":
    param = init_network_value(2,3,2,1)
    print(param)
    #inputs = np.array([3,2])
    #output_exact = np.array([-2,-2])
    #z,x = forward_pass(param,inputs)
    #print("z:",z)
    #print("x", x)
    #value_loss_function = loss_function(x['output'],output_exact)
    #print("value loss:",value_loss_function)
    #delta = backward_pass(param,z,x,output_exact)
    #print("delta:", delta)
    #der = calc_derivatives_loss_function(inputs,param,delta,x)
    #print("der:", der)
    ##print(der)