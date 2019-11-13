classdef DeleteDocumentResult < aws.Object
    % DELETEDOCUMENTRESULT Object to represent a deleteDocument result

    % Copyright 2019 The MathWorks, Inc.

    methods
        function obj = DeleteDocumentResult(varargin)
            if nargin == 1
                if ~isa(varargin{1}, 'com.amazonaws.services.simplesystemsmanagement.model.DeleteDocumentResult')
                    logObj = Logger.getLogger();
                    write(logObj,'error','argument not of type com.amazonaws.services.simplesystemsmanagement.model.DeleteDocumentResult');
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
