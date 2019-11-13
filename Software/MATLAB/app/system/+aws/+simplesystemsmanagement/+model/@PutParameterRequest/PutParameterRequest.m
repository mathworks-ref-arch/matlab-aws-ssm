classdef PutParameterRequest < aws.Object
% PUTPARAMETERREQUEST Object to represent a putParameter request

% Copyright 2019 The MathWorks, Inc.

methods
    function obj = PutParameterRequest(varargin)

        if nargin == 0
            obj.Handle = com.amazonaws.services.simplesystemsmanagement.model.PutParameterRequest();
        elseif nargin == 1
            if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.PutParameterRequest')
                logObj = Logger.getLogger();
                write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.PutParameterRequest');
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
