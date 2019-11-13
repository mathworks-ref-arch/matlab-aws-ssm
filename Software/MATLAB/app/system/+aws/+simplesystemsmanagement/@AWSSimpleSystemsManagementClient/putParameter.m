function result = putParameter(obj, request)
% PUTPARAMETER Add a parameter to the system

% Copyright 2019 The MathWorks, Inc.

if ~isa(request, 'aws.simplesystemsmanagement.model.PutParameterRequest')
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected request of type aws.simplesystemsmanagement.model.PutParameterRequest');
end

resultJ = obj.Handle.putParameter(request.Handle);
result = aws.simplesystemsmanagement.model.PutParameterResult(resultJ);

end
