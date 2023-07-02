import numpy as np

def init_network_random(input_num: int, hidden_num: int, output_num: int) -> list:
    """
    Initialization of neuronal network with random values
    args:
        input_num: number of input values
        hidden_num: number of nodes of hidden layer
        output_num: number of nodes of output layer
    output: 
        list: with weights and biases      
    """

    weights_hidden = np.random.rand(input_num,hidden_num)
    biases_hidden = np.random.rand(1,hidden_num)

    weights_output = np.random.rand(hidden_num,output_num)
    biases_output = np.random.rand(1,output_num)
    return [weights_hidden,biases_hidden,weights_output,biases_output]

def init_network_value(input_num: int, hidden_num: int, output_num: int, value: float) -> list:
    """
    Initialization of neuronal network with fixed values
    args:
        input_num: number of input values
        hidden_num: number of nodes of hidden layer
        output_num: number of nodes of output layer
        value : weight,bias initialization vlaue
    output: 
        list: with weights and biases      
    """
    weights_hidden = np.ones((input_num,hidden_num)) * value
    biases_hidden = np.ones((1,hidden_num)) * value

    weights_output = np.ones((hidden_num,output_num)) * value
    biases_output = np.ones((1,output_num)) * value
    return [weights_hidden,biases_hidden,weights_output,biases_output] 

def forward_pass(param: np.array, inputs: np.array) -> np.array:
    """
    Implementing the forword pass of a neuronal network
    args:  
        param: output of network initialization 
        inputs: input values
    output:
        np array: with pre activation values, and after activation values of hidden and output layer
    """

    pre_activation_hidden = np.sum(np.matmul(inputs,param[0]),axis=0) + param[1]
    output_hidden = sigmoid_func(pre_activation_hidden)

    pre_activation_output = np.sum(np.matmul(output_hidden,param[2]),axis=0) + param[3]
    output_output = sigmoid_func(pre_activation_output)
    return [pre_activation_hidden,  pre_activation_output], [output_hidden, output_output]

def backward_pass(param, z, x, output_exact):
    """
    Implementing the backward pass of neuronal network / NOT COMPLETE CORRECT
    args: 
        param: output of network initialization
        z: pre activation array
        x: post activation array
    output: 
        deltas : the deltas in 5.40 /5.41
    """
    dH = (x[1] - output_exact)
    delta_output  = np.sum(dH * sigmoid_der(z[1]),axis=0)

    delta_hidden = np.sum(np.matmul(param[2],delta_output.T) * sigmoid_der(z[0]),axis=0)

    return [delta_output,delta_hidden]

def calc_derivatives_loss_function(inputs, param, delta, x):
    """
    Implementing the equations 5.42 and 5.43 
    args: 
        inputs : input values
        param : DO WE EVEN NEED THAT? NO USAGE
        delta : Output of backward_pass 
        x :     post_acitvation array
    """
    dWeight_output = np.multiply(delta[0],x[0].T)
    dBias_output = delta[0]
    dWeight_hidden = np.multiply(delta[1],inputs.T)
    dBias_hidden = delta[1]
    return [dWeight_hidden,dBias_hidden,dWeight_output,dBias_output]

def sigmoid_func(x: np.array) -> np.array:
    """
    Sigmoid funct
    """
    return 1/(1+np.exp(-x))

def sigmoid_der(x: np.array) -> np.array:
    """
    derivative of sigmoid
    """
    return sigmoid_func(x)* (1 - sigmoid_func(x))


if __name__ == "__main__": 
    input_num = 2
    hidden_num = 1
    output_num = 1
    value = 2
    input = np.array([3,2])
    exact_output = -2

    network_value = init_network_value(input_num, hidden_num, output_num,value)
    print(network_value)
    z,x= forward_pass(network_value,input)
    print(x)
    print(z)

    delta = backward_pass(network_value,z,x,-2)
    print(delta)
    calc = calc_derivatives_loss_function(input,network_value,delta,x)
    print(calc)

    print("second neuronal network")

    input_num = 10
    hidden_num = 6
    output_num = 2
    value = 2
    input = np.random.rand(1,10)
    print("input value: ",input)
    exact_output = np.random.rand(1,2)
    
    network_random = init_network_random(input_num,hidden_num,output_num)
    print(network_random)
    z,x = forward_pass(network_random,input)
    delta = backward_pass(network_random,z,x,exact_output)
    calc = calc_derivatives_loss_function(input,network_random,delta,x)
    print(calc)