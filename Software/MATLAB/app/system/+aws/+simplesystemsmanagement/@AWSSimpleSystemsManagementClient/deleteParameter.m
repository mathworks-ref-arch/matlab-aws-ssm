function result = deleteParameter(obj, request)
% DELETEPARAMETER Delete a parameter from the system

% Copyright 2019 The MathWorks, Inc.

if ~isa(request, 'aws.simplesystemsmanagement.model.DeleteParameterRequest')
    % Create logger reference
    logObj = Logger.getLogger();
    write(logObj,'error','Expected request of type aws.simplesystemsmanagement.model.DeleteParameterRequest');
end

resultJ = obj.Handle.deleteParameter(request.Handle);
result = aws.simplesystemsmanagement.model.DeleteParameterResult(resultJ);

end
