import numpy as np
import neuronal_network

def update_der(der_current,der_new):
    der_new[0] = np.add(der_new[0] ,der_current[0])
    der_new[1] = np.add(der_new[1] ,der_current[1])
    der_new[2] = np.add(der_new[2] ,der_current[2])
    der_new[3] = np.add(der_new[3] ,der_current[3])
    return der_new

def calc_der(data_train,param):
    data = data_train[0]
    size_data = data.shape[0]
    label = data_train[1]
    rand_int = np.random.randint(size_data-1)
    inputs = np.array(data[rand_int,:])
    output_exact = np.array(label[rand_int,:])

    z,x =   neuronal_network.forward_pass(param,inputs)
    delta = neuronal_network.backward_pass(param,z,x,output_exact)
    der =   neuronal_network.calc_derivatives_loss_function(inputs,param,delta,x)
    return der

def update_theta(theta, der,alpha, num_data_per_iteration):
    theta[0] = np.subtract(theta[0],alpha*1/num_data_per_iteration*der[0])
    theta[1] = np.subtract(theta[1],alpha*1/num_data_per_iteration*der[1])
    theta[2] = np.subtract(theta[2],alpha*1/num_data_per_iteration*der[2])
    theta[3] = np.subtract(theta[3],alpha*1/num_data_per_iteration*der[3])
    return theta

def stochastic_gradient_method(data_train, alpha, param, num_iterations, num_data_per_iteration):
    theta_0 = param
    for i in range(1,num_iterations):
        der_0 = calc_der(data_train, param)
        for l in range(1,num_data_per_iteration):
            der = calc_der(data_train, param)
            der_0 = update_der(der_0,der)
        theta_0 = update_theta(theta_0,der_0,alpha,num_data_per_iteration)
    return theta_0

if __name__ == "__main__":
    input_num = 2
    hidden_num = 2
    output_num = 1
    value = 2

    data = np.random.rand(4,input_num)
    data_exact = np.random.rand(4,output_num)

    input = np.array(data[0,:])
    exact_output = np.array(data_exact[0,:])
    alpha = 0.1
    num_iterations = 500
    num_data_per_iteration = input_num

    param = neuronal_network.init_network_value(input_num, hidden_num, output_num,value)
    
    data_train = [data, data_exact]
    
    param = stochastic_gradient_method(data_train, alpha,param, num_iterations,num_data_per_iteration)
    print(param)
    print(param)
    #exercise 1b
    input_num = 2
    hidden_num = 2
    output_num = 1
    value = 2
    data = np.array([[0,0],[0,1],[1,0],[1,1]])
    data_exact = np.array([[0],[1],[1],[0]])

    input = data[0,:]
    exact_output = data_exact[0,:]
    alpha = 0.1
    num_iterations = 500
    num_data_per_iteration = 4

    param = neuronal_network.init_network_value(input_num, hidden_num, output_num,value)
    data_train = [data,data_exact]
    param = stochastic_gradient_method(data_train,alpha,param,num_iterations,num_data_per_iteration)
    print(param)
    input = input = data[0,:]
    z,x = neuronal_network.forward_pass(param,input)
    print(x)
    input = input = data[1,:]
    z,x = neuronal_network.forward_pass(param,input)
    print(x)
    
    input = input = data[2,:]
    z,x = neuronal_network.forward_pass(param,input)
    print(x)
    input = input = data[3,:]
    z,x = neuronal_network.forward_pass(param,input)
    print(x)
    
    
    