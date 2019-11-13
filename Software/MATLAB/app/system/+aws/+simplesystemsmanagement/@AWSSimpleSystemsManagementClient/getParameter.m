function result = getParameter(obj, request)
% GETPARAMETER Get information about a parameter by using the parameter name

% Copyright 2019 The MathWorks, Inc.

if ~isa(request, 'aws.simplesystemsmanagement.model.GetParameterRequest')
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected request of type aws.simplesystemsmanagement.model.GetParameterRequest');
end

resultJ = obj.Handle.getParameter(request.Handle);
result = aws.simplesystemsmanagement.model.GetParameterResult(resultJ);

end
