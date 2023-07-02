import numpy as np
import matplotlib.pyplot as plt



def perceptron(input_values : np.array, weight: np.array, bias: float) -> float:
    x = np.multiply(input_values, weight)
    output = np.sum(x) + bias
    return 0 if output < 0 else 1

def plot_2d(input_values : np.array) -> plt.figure:
    fig = plt.figure()
    plt.plot(input_values[0,:],input_values[1,:], 'o')
    return fig

def and_perc(input_values : np.array) -> float:
    weights = np.array([1 ,1])
    bias = -2
    return perceptron(input_values,weights,bias)

def or_perc(input_values : np.array) -> float:
    weights = np.array([1,1])
    bias = -1
    return perceptron(input_values,weights,bias)

def not_perc(input_values : np.array) -> float:
    weights = np.array([-1])
    bias = 0.5
    return perceptron(input_values, weights,bias)

def nor_perc(input_values : np.array) -> float:
    return not_perc(or_perc(input_values))

def nand_perc(input_values: np.array) -> float:
    return not_perc(and_perc(input_values))

def xor_perc(input_values: np.array) -> float:
    return and_perc(np.array([or_perc(input_values), nand_perc(input_values)]))

if __name__ == "__main__":
    input_values = np.random.uniform(low=0,high=10,size=(1000,1))
    weight = np.random.rand(1000,1)
    bias = -11

    output = perceptron(input_values,weight,bias)
    print(output)
