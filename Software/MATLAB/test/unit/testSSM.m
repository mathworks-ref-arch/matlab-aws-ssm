classdef testSSM < matlab.unittest.TestCase
    % TESTSSM Test for the  MATLAB Interface for AWS SSM
    %
    % The test suite exercises the basic operations on the Client.

    % Copyright 2019 The MathWorks, Inc.

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% Please add your test cases below
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    properties
        %Create logger reference
        logObj = Logger.getLogger();
    end


    methods (TestMethodSetup)
        function testSetup(testCase)
            testCase.logObj = Logger.getLogger();
            testCase.logObj.DisplayLevel = 'verbose';

        end
    end


    methods (Test)
        function testConstructor(testCase)
            write(testCase.logObj,'debug','Testing testConstructor');
            % create the client required by the constructor
            ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient;
            testCase.verifyClass(ssm,'aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient');

            % ssm.useCredentialsProviderChain = false;
            ssm.initialize();
            testCase.verifyNotEmpty(ssm.Handle);
            ssm.shutdown();
        end


        function testSSMString(testCase)
            % Test setting a basic string parameter
            write(testCase.logObj,'debug','Testing testSSMString');
            import java.util.UUID;

            ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient;
            if strcmpi(getenv('GITLAB_CI'), 'true')
                ssm.useCredentialsProviderChain = false;
            else
                ssm.useCredentialsProviderChain = true;
            end
            ssm.initialize();

            % Set a string parameter
            putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
            uuid = char(UUID.randomUUID());
            myParameterName = ['mytestparamname', uuid];
            myParameterValue = ['mytestparamvalue', uuid];
            putParameterRequest.setName(myParameterName);
            putParameterRequest.setValue(myParameterValue);
            putParameterRequest.setType('String');
            putParameterResult = ssm.putParameter(putParameterRequest); %#ok<NASGU>

            % Retrieve the parameter
            getParameterRequest = aws.simplesystemsmanagement.model.GetParameterRequest();
            getParameterRequest.setName(myParameterName);
            getParameterResult = ssm.getParameter(getParameterRequest);
            parameter = getParameterResult.getParameter();

            % Check it
            resultValue = parameter.getValue();
            testCase.verifyTrue(strcmp(resultValue, myParameterValue));

            % Delete the parameter when no longer needed
            deleteParameterRequest = aws.simplesystemsmanagement.model.DeleteParameterRequest();
            deleteParameterRequest.setName(myParameterName);
            deleteParameterResult = ssm.deleteParameter(deleteParameterRequest); %#ok<NASGU>

            % check the delete worked i.e. it cannot now be retrieved
            get2Failed = false;
            try
                getParameterResult2 = ssm.getParameter(getParameterRequest); %#ok<NASGU>
            catch ME
                if isa(ME.ExceptionObject, 'com.amazonaws.services.simplesystemsmanagement.model.ParameterNotFoundException')
                    get2Failed = true;
                else
                    rethrow(ME)
                end
            end
            testCase.verifyTrue(get2Failed);

            ssm.shutdown();
        end


        function testSSMSecureString(testCase)
            % Test setting a secure string parameter
            write(testCase.logObj,'debug','Testing testSSMSecureString');
            import java.util.UUID;

            ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient;
            if strcmpi(getenv('GITLAB_CI'), 'true')
                ssm.useCredentialsProviderChain = false;
            else
                ssm.useCredentialsProviderChain = true;
            end
            ssm.initialize();

            % Set a string parameter
            putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
            uuid = char(UUID.randomUUID());
            myParameterName = ['mytestparamname', uuid];
            myParameterValue = ['mytestparamvalue', uuid];
            putParameterRequest.setName(myParameterName);
            putParameterRequest.setValue(myParameterValue);
            putParameterRequest.setType(aws.simplesystemsmanagement.model.ParameterType.SecureString);
            putParameterResult = ssm.putParameter(putParameterRequest); %#ok<NASGU>

            % Retrieve the parameter in encrypted form
            getParameterRequest1 = aws.simplesystemsmanagement.model.GetParameterRequest();
            getParameterRequest1.setName(myParameterName);
            getParameterResult = ssm.getParameter(getParameterRequest1);
            parameter1 = getParameterResult.getParameter();

            % check it cannot be read
            resultValue1 = parameter1.getValue();
            testCase.verifyFalse(strcmp(resultValue1, myParameterValue));

            % Retrieve the parameter in decrypted form
            getParameterRequest2 = aws.simplesystemsmanagement.model.GetParameterRequest();
            getParameterRequest2.setName(myParameterName);
            getParameterRequest2.setWithDecryption(true);
            getParameterResult2 = ssm.getParameter(getParameterRequest2);
            parameter2 = getParameterResult2.getParameter();

            % check it can be read
            resultValue2 = parameter2.getValue();
            testCase.verifyTrue(strcmp(resultValue2, myParameterValue));

            % Delete the parameter when no longer needed
            deleteParameterRequest = aws.simplesystemsmanagement.model.DeleteParameterRequest();
            deleteParameterRequest.setName(myParameterName);
            deleteParameterResult = ssm.deleteParameter(deleteParameterRequest); %#ok<NASGU>

            ssm.shutdown();
        end


        function testSSMListString(testCase)
            % Test setting a basic string parameter
            write(testCase.logObj,'debug','Testing testSSMListString');
            import java.util.UUID;

            ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient;
            % Use static credentials in the test environmnet
            if strcmpi(getenv('GITLAB_CI'), 'true')
                ssm.useCredentialsProviderChain = false;
            else
                ssm.useCredentialsProviderChain = true;
            end
            ssm.initialize();

            % Set a string parameter
            putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
            uuid = char(UUID.randomUUID());
            myParameterName = ['mytestparamname', uuid];
            myParameterValue = ['mytestparamvalue1',',','mytestparamvalue2'];
            putParameterRequest.setName(myParameterName);
            putParameterRequest.setValue(myParameterValue);
            putParameterRequest.setDescription('This is a StringList test description');
            putParameterRequest.setType(aws.simplesystemsmanagement.model.ParameterType.StringList);
            putParameterResult = ssm.putParameter(putParameterRequest); %#ok<NASGU>

            % Retrieve the parameter
            getParameterRequest = aws.simplesystemsmanagement.model.GetParameterRequest();
            getParameterRequest.setName(myParameterName);
            getParameterResult = ssm.getParameter(getParameterRequest);
            parameter = getParameterResult.getParameter();

            % Check it
            resultValue = parameter.getValue();
            resultARN = parameter.getARN();
            resultType = parameter.getType();
            resultName = parameter.getName();
            testCase.verifyTrue(strcmp(resultValue, myParameterValue));
            testCase.verifyTrue(strcmp(resultName, myParameterName));
            testCase.verifyTrue(strcmp(resultType, 'StringList'));
            testCase.verifyTrue(contains(resultARN, 'arn:aws:ssm:'));

            % Delete the parameter when no longer needed
            deleteParameterRequest = aws.simplesystemsmanagement.model.DeleteParameterRequest();
            deleteParameterRequest.setName(myParameterName);
            deleteParameterResult = ssm.deleteParameter(deleteParameterRequest); %#ok<NASGU>

            ssm.shutdown();
        end


        function testSSMallowedPattern(testCase)
            % Test setting a basic string parameter
            write(testCase.logObj,'debug','Testing testSSMallowedPattern');
            import java.util.UUID;

            ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient;
            % Use static credentials in the test environmnet
            if strcmpi(getenv('GITLAB_CI'), 'true')
                ssm.useCredentialsProviderChain = false;
            else
                ssm.useCredentialsProviderChain = true;
            end
            ssm.initialize();

            % Common uuid
            uuid = char(UUID.randomUUID());

            % Attempt a string parameter that should fail
            putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
            myParameterName = ['mytestparamname', uuid];
            myParameterValue = 'mytestparamvalue1';
            putParameterRequest.setName(myParameterName);
            putParameterRequest.setValue(myParameterValue);
            putParameterRequest.setType(aws.simplesystemsmanagement.model.ParameterType.String);
            % Set a pattern that only allows numbers
            putParameterRequest.setAllowedPattern('^\d+$');

            % Check overwrite attempt fails
            % check the delete worked i.e. it cannot now be retrieved
            overwritefailed = false;
            try
                putParameterResult = ssm.putParameter(putParameterRequest); %#ok<NASGU>
            catch ME
                if isa(ME.ExceptionObject, 'com.amazonaws.services.simplesystemsmanagement.model.ParameterPatternMismatchException')
                    overwritefailed = true;
                else
                    rethrow(ME)
                end
            end
            testCase.verifyTrue(overwritefailed);

            % Attempt to set it with a valid pattern
            putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
            myParameterName = ['mytestparamname', uuid];
            myParameterValue = '12345';
            putParameterRequest.setName(myParameterName);
            putParameterRequest.setValue(myParameterValue);
            putParameterRequest.setType(aws.simplesystemsmanagement.model.ParameterType.String);
            putParameterResult = ssm.putParameter(putParameterRequest); %#ok<NASGU>

            % Retrieve the parameter & check it has the correct value
            getParameterRequest = aws.simplesystemsmanagement.model.GetParameterRequest();
            getParameterRequest.setName(myParameterName);
            getParameterResult = ssm.getParameter(getParameterRequest);
            parameter = getParameterResult.getParameter();
            testCase.verifyTrue(strcmp(parameter.getValue(), myParameterValue));

            % Delete the parameter when no longer needed
            deleteParameterRequest = aws.simplesystemsmanagement.model.DeleteParameterRequest();
            deleteParameterRequest.setName(myParameterName);
            deleteParameterResult = ssm.deleteParameter(deleteParameterRequest); %#ok<NASGU>

            ssm.shutdown();

        end


        function testSSMoverwrite(testCase)
            % Test setting a basic string parameter
            write(testCase.logObj,'debug','Testing testSSMoverwrite');
            import java.util.UUID;

            ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient;
            if strcmpi(getenv('GITLAB_CI'), 'true')
                ssm.useCredentialsProviderChain = false;
            else
                ssm.useCredentialsProviderChain = true;
            end
            ssm.initialize();

            % Common uuid
            uuid = char(UUID.randomUUID());

            % Set a string parameter
            putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
            myParameterName = ['mytestparamname', uuid];
            myParameterValue = 'mytestparamvalue1';
            putParameterRequest.setName(myParameterName);
            putParameterRequest.setValue(myParameterValue);
            putParameterRequest.setType(aws.simplesystemsmanagement.model.ParameterType.String);
            putParameterResult = ssm.putParameter(putParameterRequest); %#ok<NASGU>

            % Attempt to overwrite it
            putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
            myParameterName = ['mytestparamname', uuid];
            myParameterValue = 'mytestparamvalue2';
            putParameterRequest.setName(myParameterName);
            putParameterRequest.setValue(myParameterValue);
            putParameterRequest.setType(aws.simplesystemsmanagement.model.ParameterType.String);

            % Check overwrite attempt fails
            % check the delete worked i.e. it cannot now be retrieved
            overwritefailed = false;
            try
                putParameterResult = ssm.putParameter(putParameterRequest); %#ok<NASGU>
            catch ME
                if isa(ME.ExceptionObject, 'com.amazonaws.services.simplesystemsmanagement.model.ParameterAlreadyExistsException')
                    overwritefailed = true;
                else
                    rethrow(ME)
                end
            end
            testCase.verifyTrue(overwritefailed);

            % Overwrite it with flag set
            putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
            myParameterName = ['mytestparamname', uuid];
            myParameterValue = 'mytestparamvalue3';
            putParameterRequest.setName(myParameterName);
            putParameterRequest.setValue(myParameterValue);
            putParameterRequest.setOverwrite(true);
            putParameterRequest.setType(aws.simplesystemsmanagement.model.ParameterType.String);
            putParameterResult = ssm.putParameter(putParameterRequest); %#ok<NASGU>

            % Retrieve the parameter & check it has the overwritten value
            getParameterRequest = aws.simplesystemsmanagement.model.GetParameterRequest();
            getParameterRequest.setName(myParameterName);
            getParameterResult = ssm.getParameter(getParameterRequest);
            parameter = getParameterResult.getParameter();
            testCase.verifyTrue(strcmp(parameter.getValue(), myParameterValue));

            % Delete the parameter when no longer needed
            deleteParameterRequest = aws.simplesystemsmanagement.model.DeleteParameterRequest();
            deleteParameterRequest.setName(myParameterName);
            deleteParameterResult = ssm.deleteParameter(deleteParameterRequest); %#ok<NASGU>

            ssm.shutdown();
        end


        function testSSMDocument(testCase)
            % Document interface is not fully implemented or used but run a basic
            % test of what exists to date
            write(testCase.logObj,'debug','Testing testSSMDocument');
            import java.util.UUID;

            ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient;
            if strcmpi(getenv('GITLAB_CI'), 'true')
                ssm.useCredentialsProviderChain = false;
            else
                ssm.useCredentialsProviderChain = true;
            end
            ssm.initialize();

            createDocumentRequest = aws.simplesystemsmanagement.model.CreateDocumentRequest();
            uuid = char(UUID.randomUUID());
            docName = ['AAAMySSMTestDoc', uuid];
            createDocumentRequest.setName(docName);
            createDocumentRequest.setDocumentType('Command');

            % read the sample content from a file
            fileID = fopen('sampleDocument.json','r');
            testCase.verifyGreaterThan(fileID, 2);
            content = fscanf(fileID,'%s');
            createDocumentRequest.setContent(content);
            createDocumentResult = ssm.createDocument(createDocumentRequest); %#ok<NASGU>
            testCase.verifyNotEmpty(createDocumentRequest.Handle);

            deleteDocumentRequest = aws.simplesystemsmanagement.model.DeleteDocumentRequest();
            deleteDocumentRequest.setName(docName);
            deleteDocumentResult = ssm.deleteDocument(deleteDocumentRequest); %#ok<NASGU>

            ssm.shutdown();
        end

    end %methods
end %class
