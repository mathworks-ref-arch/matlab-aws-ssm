classdef CreateDocumentResult < aws.Object
    % CREATEDOCUMENTRESULT Object to represent a createDocument result

    % Copyright 2019 The MathWorks, Inc.

    methods
        function obj = CreateDocumentResult(varargin)
            if nargin == 1
                if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.CreateDocumentResult')
                    logObj = Logger.getLogger();
                    write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.CreateDocumentResult');
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
