classdef DeleteParameterResult < aws.Object
    % DELETEPARAMETERRESULT Object to represent a deleteParameter result

    % Copyright 2019 The MathWorks, Inc.

    methods
        function obj = DeleteParameterResult(varargin)
            if nargin == 1
                if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.DeleteParameterResult')
                    logObj = Logger.getLogger();
                    write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.DeleteParameterResult');
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
