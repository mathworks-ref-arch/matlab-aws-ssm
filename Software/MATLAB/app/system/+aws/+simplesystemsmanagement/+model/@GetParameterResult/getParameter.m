function parameter = getParameter(obj)
% GETPARAMETERS Get information about a parameter

% Copyright 2019 The MathWorks, Inc.

parameterJ = obj.Handle.getParameter();
parameter = aws.simplesystemsmanagement.model.Parameter(parameterJ);

end
