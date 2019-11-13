classdef DeleteParameterRequest < aws.Object
% DELETEPARAMETERREQUEST Object to represent a deleteParameter request

% Copyright 2019 The MathWorks, Inc.

methods
    function obj = DeleteParameterRequest(varargin)

        if nargin == 0
            obj.Handle = com.amazonaws.services.simplesystemsmanagement.model.DeleteParameterRequest();
        elseif nargin == 1
            if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.DeleteParameterRequest')
                logObj = Logger.getLogger();
                write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.DeleteParameterRequest');
            else
                obj.Handle = varargin{1};
            end
        else
            logObj = Logger.getLogger();
            write(logObj,'error','Invalid number of arguments');
        end
    end
end

end
