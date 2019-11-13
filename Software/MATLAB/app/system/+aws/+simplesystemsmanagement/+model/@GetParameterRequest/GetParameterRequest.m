classdef GetParameterRequest < aws.Object
% GETPARAMETERREQUEST Object to represent a getParameter request

% Copyright 2019 The MathWorks, Inc.

methods
    function obj = GetParameterRequest(varargin)

        if nargin == 0
            obj.Handle = com.amazonaws.services.simplesystemsmanagement.model.GetParameterRequest();
        elseif nargin == 1
            if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.GetParameterRequest')
                logObj = Logger.getLogger();
                write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.GetParameterRequest');
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
