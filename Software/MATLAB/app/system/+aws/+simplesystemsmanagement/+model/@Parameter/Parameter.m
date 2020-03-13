classdef Parameter < aws.Object
% PARAMETER Object to represent a Parameter

% Copyright 2019 The MathWorks, Inc.

methods
    function obj = Parameter(varargin)

        if nargin == 0
            obj.Handle = com.amazonaws.services.simplesystemsmanagement.model.Parameter();
        elseif nargin == 1
            if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.Parameter')
                logObj = Logger.getLogger();
                write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.Parameter');
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
