function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

X = [ones(m , 1)  X];
for i = 1:m,                                                               %m为训练样本数，利用for遍历  
    z2 = Theta1 * X(i,:)';                                                 %对第i个训练样本正向传播得到输出h(x)，即为a3  
    a2 = sigmoid(z2);  
    a2 = [1; a2];  
    z3 = Theta2 * a2;  
    a3 = sigmoid(z3);  
    J = J + sum(log(1 - a3)) + log(a3(y(i,:))) - log(1 - a3(y(i,:)));      %由于输出为10维向量，而y的值是1-10的数字，所以可以用y的值指示a3那些元素加，哪些不加  
end                                                                        %a3(y(i，：))及指示训练样本对应的a3的元素  
J = -1/m * J;  
  
temp = 0;  
for i = 1:hidden_layer_size,                                               %对Theta1除了第一列（与偏置神经元对应的那列）元素的平方求和                                          
    for j = 2:(input_layer_size + 1),  
        temp = temp + Theta1(i,j)^2;  
    end  
end  
  
for i = 1:num_labels,                                                       %对Theta2除了第一列（与偏置神经元对应的那列）元素的平方求和   
    for j = 2:(hidden_layer_size + 1),  
        temp = temp + Theta2(i,j)^2;  
    end  
end  
  
J = J + lambda/(2*m)*temp;  
  
%利用反向传播法求取偏导数值，实际上这个循环可以和计算J值得循环合为一个，为了代码清晰，所以分开写了  
delta3 = zeros(num_labels,1);                                              %反向传播，输出层的误差  
delta2  = zeros(size(Theta1));                                             %反向传播，隐藏层的误差；输入层不计算误差  
for i = 1:m,                                                               %m为训练样本数，利用for遍历  
    a1 = X(i,:)';  
    z2 = Theta1 * a1;                                                      %对第i个训练样本正向传播得到输出h(x)，即为a3  
    a2 = sigmoid(z2);  
    a2 = [1; a2];  
    z3 = Theta2 * a2;  
    a3 = sigmoid(z3);  
    delta3 = a3;                                                           %反向传播，计算得偏导数  
    delta3(y(i,:)) = delta3(y(i,:)) - 1;  
    delta2 = Theta2' * delta3 .*[1;sigmoidGradient(z2)];  
    delta2 = delta2(2:end);  
    Theta2_grad = Theta2_grad + delta3 * a2';  
    Theta1_grad = Theta1_grad + delta2 * a1';  
end   
Theta2_grad = 1/m * Theta2_grad + lambda/m * Theta2;                       %正则化，修正梯度值  
Theta2_grad(:,1) = Theta2_grad(:,1) - lambda/m * Theta2(:,1);              %由于不惩罚偏执单元对应的列，所以把他减掉  
Theta1_grad = 1/m * Theta1_grad + lambda/m * Theta1;                       %同理修改Theta1_grad  
Theta1_grad(:,1) = Theta1_grad(:,1) - lambda/m * Theta1(:,1);  
  
  
  
  
  
  
  
  
  
  
% -------------------------------------------------------------  
  
% =========================================================================  
  
% Unroll gradients  
grad = [Theta1_grad(:) ; Theta2_grad(:)];  
  
  
end  