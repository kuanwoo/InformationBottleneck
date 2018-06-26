%% Mutual Information
% Calculate Mutual Information of two random variables connected via a
% channel.
%
% Inputs:
% * Q = Conditional probability matrix of Y given X (of size |X| x |Y|)
% * Px = Probability distribution of the channel input X (column vector of 
% size |X|)
%
% Outputs:
% * I = Mutual Information I(X;Y)

function I = mi(Q, Px)
    % Compute the joint probability function of x and y in the format
    % [ P(0,0) P(0,1), ... , P(0, m)
    %   P(1,0) P(1,1), ... , P(1, m)
    %   ...
    %   P(n,0) P(n,1), ... , P(n, m) ]
    Pxy = Q .* Px;
    
    % Compute the marginal of Y by doing P(Y = i) = sum(P(x,i)) - as a row
    % vector
    Py = sum(Pxy,1);
    
    % Compute P(x)*P(y), which is the same size as Pxy
    PxPy = Px * Py;
    
    % Now compute the mutual information through the KL divergence after
    I = div(Pxy,PxPy);
    
end