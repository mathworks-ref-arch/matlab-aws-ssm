classdef ParameterType < aws.Object
    % PARAMETERTYPE Enumeration of parameter types
    % Possible values are: SecureString, String or StringList
    % a toJava() method returns the equivalent Java enumeration.

    % Copyright 2019 The MathWorks, Inc.

    enumeration
        SecureString
        String
        StringList
    end

    methods
        function typeJ = toJava(obj)
            switch obj
            case aws.simplesystemsmanagement.model.ParameterType.SecureString
                    typeJ = com.amazonaws.services.simplesystemsmanagement.model.ParameterType.SecureString;
                case aws.simplesystemsmanagement.model.ParameterType.String
                    typeJ = com.amazonaws.services.simplesystemsmanagement.model.ParameterType.String;
                case aws.simplesystemsmanagement.model.ParameterType.StringList
                    typeJ = com.amazonaws.services.simplesystemsmanagement.model.ParameterType.StringList;
                otherwise
                    logObj = Logger.getLogger();
                    write(logObj,'error','Invalid aws.simplesystemsmanagement.model.ParameterType');
            end
        end
    end
end %class
