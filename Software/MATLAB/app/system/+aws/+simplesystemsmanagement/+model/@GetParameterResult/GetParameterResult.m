classdef GetParameterResult < aws.Object
    % GETPARAMETERRESULT Object to represent a getParameter result

    % Copyright 2019 The MathWorks, Inc.

    methods
        function obj = GetParameterResult(varargin)
            if nargin == 1
                if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.GetParameterResult')
                    logObj = Logger.getLogger();
                    write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.GetParameterResult');
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
