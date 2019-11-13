classdef PutParameterResult < aws.Object
    % PUTPARAMETERRESULT Object to represent a putParameter result

    % Copyright 2019 The MathWorks, Inc.

    methods
        function obj = PutParameterResult(varargin)
            if nargin == 1
                if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.PutParameterResult')
                    logObj = Logger.getLogger();
                    write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.PutParameterResult');
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
