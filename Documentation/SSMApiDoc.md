# MATLAB Interface *for AWS SSM* API documentation


## AWS SSM Interface Objects and Methods:
* @AWSSimpleSystemsManagementClient



------

## @AWSSimpleSystemsManagementClient

### @AWSSimpleSystemsManagementClient/AWSSimpleSystemsManagementClient.m
```notalanguage
  CLIENT Object to represent an AWS Simple Systems Management client
  The client is used to carry out operations with the Simple Systems Management service
 
  Example:
     % Create client
     ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient;
     % Initialize the client
     ssm.initialize();
 
     % Use the client to carry out actions
     putParameterRequest = aws.simplesystemsmanagement.model.PutParameterRequest();
     myParameterName = 'mytestparamname12345678';
     myParameterValue = 'mytestparamvalue12345678';
     putParameterRequest.setName(myParameterName);
     putParameterRequest.setValue(myParameterValue);
     putParameterRequest.setType('String');
     putParameterResult = ssm.putParameter(putParameterRequest);
 
     getParameterRequest = aws.simplesystemsmanagement.model.GetParameterRequest();
     getParameterRequest.setName(myParameterName);
     getParameterResult = ssm.getParameter(getParameterRequest);
     parameter = getParameterResult.getParameter();
 
     parameter.getValue()
 
     % Shutdown the client when no longer needed
     ssm.shutdown();
```
### @AWSSimpleSystemsManagementClient/createDocument.m
```notalanguage
  CREATEDOCUMENT Creates a document
```
### @AWSSimpleSystemsManagementClient/deleteDocument.m
```notalanguage
  DELETEDOCUMENT Delete a document from the system
```
### @AWSSimpleSystemsManagementClient/deleteParameter.m
```notalanguage
  DELETEPARAMETER Delete a parameter from the system
```
### @AWSSimpleSystemsManagementClient/getParameter.m
```notalanguage
  GETPARAMETER Get information about a parameter by using the parameter name
```
### @AWSSimpleSystemsManagementClient/initialize.m
```notalanguage
  INITIALIZE Configure the MATLAB session to connect to SSM
  Once a client has been configured, initialize is used to validate the
  client configuration and initiate the connection to SSM
 
  Example:
     ssm = aws.simplesystemsmanagement.AWSSimpleSystemsManagementClient();
     ssm.intialize();
```
### @AWSSimpleSystemsManagementClient/putParameter.m
```notalanguage
  PUTPARAMETER Add a parameter to the system
```
### @AWSSimpleSystemsManagementClient/shutdown.m
```notalanguage
  SHUTDOWN Method to shutdown a client and release resources
  This method should be called to cleanup a client which is no longer
  required.
```

------
## AWS SSM Interface +model Objects and Methods:
* @CreateDocumentRequest
* @CreateDocumentResult
* @DeleteDocumentRequest
* @DeleteDocumentResult
* @DeleteParameterRequest
* @DeleteParameterResult
* @GetParameterRequest
* @GetParameterResult
* @Parameter
* @ParameterType
* @PutParameterRequest
* @PutParameterResult



------

## @CreateDocumentRequest

### @CreateDocumentRequest/CreateDocumentRequest.m
```notalanguage
  CREATEDOCUEMTNREQUEST Object to represent a createDocument request
```
### @CreateDocumentRequest/setContent.m
```notalanguage
  SETCONTENT Sets the content of a document
  content should be a valid JSON or YAML string.
```
### @CreateDocumentRequest/setDocumentType.m
```notalanguage
  SETDOCUMENTTYPE Sets the type of a document
  type should be of type character vector.
  Valid values are:
    Automation 
    Command 
    Package 
    Policy 
    Session
```
### @CreateDocumentRequest/setName.m
```notalanguage
  SETNAME Sets the name of a document
  name should be of type character vector.
```

------


## @CreateDocumentResult

### @CreateDocumentResult/CreateDocumentResult.m
```notalanguage
  CREATEDOCUMENTRESULT Object to represent a createDocument result
```

------


## @DeleteDocumentRequest

### @DeleteDocumentRequest/DeleteDocumentRequest.m
```notalanguage
  DELETEDOCUMENTREQUEST Object to represent a deleteDocument request
```
### @DeleteDocumentRequest/setName.m
```notalanguage
  SETNAME Sets the name of a document
  name should be of type character vector.
```

------


## @DeleteDocumentResult

### @DeleteDocumentResult/DeleteDocumentResult.m
```notalanguage
  DELETEDOCUMENTRESULT Object to represent a deleteDocument result
```

------


## @DeleteParameterRequest

### @DeleteParameterRequest/DeleteParameterRequest.m
```notalanguage
  DELETEPARAMETERREQUEST Object to represent a deleteParameter request
```
### @DeleteParameterRequest/setName.m
```notalanguage
  SETNAME Sets the name of a parameter
  name should be of type character vector.
```

------


## @DeleteParameterResult

### @DeleteParameterResult/DeleteParameterResult.m
```notalanguage
  DELETEPARAMETERRESULT Object to represent a deleteParameter result
```

------


## @GetParameterRequest

### @GetParameterRequest/GetParameterRequest.m
```notalanguage
  GETPARAMETERREQUEST Object to represent a getParameter request
```
### @GetParameterRequest/setName.m
```notalanguage
  SETNAME Sets the name of a parameter
  name should be of type character vector.
```
### @GetParameterRequest/setWithDecryption.m
```notalanguage
  SETWITHDECRYPTION Return decrypted values for secure string parameters
  withDecryption should be of type logical.
```

------


## @GetParameterResult

### @GetParameterResult/GetParameterResult.m
```notalanguage
  GETPARAMETERRESULT Object to represent a getParameter result
```
### @GetParameterResult/getParameter.m
```notalanguage
  GETPARAMETERS Get information about a parameter
```

------


## @Parameter

### @Parameter/Parameter.m
```notalanguage
  PARAMETER Object to represent a Parameter
```
### @Parameter/getARN.m
```notalanguage
  GETARN Returns the ARN of a parameter as a character vector
```
### @Parameter/getName.m
```notalanguage
  GETNAME Returns the name of a parameter as a character vector
```
### @Parameter/getType.m
```notalanguage
  GETTYPE Returns the type of a parameter as a character vector
```
### @Parameter/getValue.m
```notalanguage
  GETVALUE Returns the value of a parameter as a character vector
```
### @Parameter/setName.m
```notalanguage
  SETNAME Sets the name of a document
  name should be of type character vector.
```
### @Parameter/setType.m
```notalanguage
  SETTYPE Sets the type of a parameter
  type should be of type character vector.
  Valid values are:
    SecureString
    String
    StringList
```
### @Parameter/setValue.m
```notalanguage
  SETVALUE Sets the value of a document
  value should be of type character vector.
```

------


## @ParameterType

### @ParameterType/ParameterType.m
```notalanguage
  PARAMETERTYPE Enumeration of parameter types
  Possible values are: SecureString, String or StringList
  a toJava() method returns the equivalent Java enumeration.
```

------


## @PutParameterRequest

### @PutParameterRequest/PutParameterRequest.m
```notalanguage
  PUTPARAMETERREQUEST Object to represent a putParameter request
```
### @PutParameterRequest/setAllowedPattern.m
```notalanguage
  SETALLOWEDPATTERN Sets a regular expression used to validate the parameter value
```
### @PutParameterRequest/setDescription.m
```notalanguage
  SETDESCRIPTION Sets information about the parameter
  description should be of type character vector.
```
### @PutParameterRequest/setKeyId.m
```notalanguage
  SETKEYID Sets KMS Key ID to use to encrypt a parameter
  keyId should be of type character vector.
  This is a required for parameters that use the SecureString data type.
  If a key ID is not specified, i.e. this function is not called the system uses
  the default key associated with the AWS account.
  To use a custom KMS key, choose the SecureString data type with the Key ID
  parameter.
```
### @PutParameterRequest/setName.m
```notalanguage
  SETNAME Sets the name of a parameter
  name should be of type character vector.
  The fully qualified name includes the complete hierarchy of the parameter path
  and name, e.g.: /Dev/DBServer/MySQL/db-string13
  Naming Constraints:
    Parameter names are case sensitive.
    A parameter name must be unique within an AWS Region
    A parameter name can't be prefixed with "aws" or "ssm" (case-insensitive).
    Parameter names can include only the following symbols and letters: a-zA-Z0-9_.-/
    A parameter name can't include spaces.
    Parameter hierarchies are limited to a maximum depth of fifteen levels.
    The maximum length for the fully qualified parameter name is 1011 characters.
```
### @PutParameterRequest/setOverwrite.m
```notalanguage
  OVERWRITE Overwrite an existing parameter
  If not specified, will default to false.
```
### @PutParameterRequest/setType.m
```notalanguage
  SETTYPE Sets the type of a parameter
  type should be of type character vector or
  aws.simplesystemsmanagement.model.ParameterType
  Items in a StringList must be separated by a comma. Do not use other
  punctuation or special character to escape items in the list.
  If a parameter value requires a comma, then use the String parameter type.
 
  Valid values are:
    SecureString
    String
    StringList
```
### @PutParameterRequest/setValue.m
```notalanguage
  SETVALUE Sets the value of a parameter
  value should be of type character vector.
  Standard parameters have a value limit of 4 KB
```

------


## @PutParameterResult

### @PutParameterResult/PutParameterResult.m
```notalanguage
  PUTPARAMETERRESULT Object to represent a putParameter result
```

------
## AWS Common Objects and Methods:
* @ClientConfiguration
* @Object



------

## @ClientConfiguration

### @ClientConfiguration/ClientConfiguration.m
```notalanguage
  CLIENTCONFIGURATION creates a client network configuration object
  This class can be used to control client behavior such as:
   * Connect to the Internet through proxy
   * Change HTTP transport settings, such as connection timeout and request retries
   * Specify TCP socket buffer size hints
  (Only limited proxy related methods are currently available)
 
  Example, in this case using an s3 client:
    s3 = aws.s3.Client();
    s3.clientConfiguration.setProxyHost('proxyHost','myproxy.example.com');
    s3.clientConfiguration.setProxyPort(8080);
    s3.initialize();

    Documentation for aws.ClientConfiguration
       doc aws.ClientConfiguration

```
### @ClientConfiguration/getNonProxyHosts.m
```notalanguage
  GETNONPROXYHOSTS Sets optional hosts accessed without going through the proxy
  Returns either the nonProxyHosts set on this object, or if not provided,
  returns the value of the Java system property http.nonProxyHosts.
  Result is returned as a character vector.
 
  Note the following caveat from the Amazon DynamoDB documentation:
 
  We still honor this property even when getProtocol() is https, see
  http://docs.oracle.com/javase/7/docs/api/java/net/doc-files/net-properties.html
  This property is expected to be set as a pipe separated list. If neither are
  set, returns the value of the environment variable NO_PROXY/no_proxy.
  This environment variable is expected to be set as a comma separated list.
```
### @ClientConfiguration/setNonProxyHosts.m
```notalanguage
  SETNONPROXYHOSTS Sets optional hosts accessed without going through the proxy
  Hosts should be specified as a character vector.
```
### @ClientConfiguration/setProxyHost.m
```notalanguage
  SETPROXYHOST Sets the optional proxy host the client will connect through
  This is based on the setting in the MATLAB preferences panel. If the host
  is not set there on Windows then the Windows system preferences will be
  used. Though it is not normally the case proxy settings may vary based on the
  destination URL, if this is the case a URL should be provided for a specific
  service. If a URL is not provided then https://s3.amazonaws.com is used as
  a default and is likely to match the relevant proxy selection rules for AWS
  traffic.
 
  Examples:
 
    To have the proxy host automatically set based on the MATLAB preferences
    panel using the default URL of 'https://s3.amazonaws.com:'
        clientConfig.setProxyHost();
 
    To have the proxy host automatically set based on the given URL:
        clientConfig.setProxyHost('autoURL','https://examplebucket.amazonaws.com');
 
    To force the value of the proxy host to a given value, e.g. myproxy.example.com:
        clientConfig.setProxyHost('proxyHost','myproxy.example.com');
    Note this does not overwrite the value set in the preferences panel.
 
  The client initialization call will invoke setProxyHost() to set a value based
  on the MATLAB preference if the proxyHost value is not to an empty value.
```
### @ClientConfiguration/setProxyPassword.m
```notalanguage
  SETPROXYPASSWORD Sets the optional proxy password
  This is based on the setting in the MATLAB preferences panel. If the password
  is not set there on Windows then the Windows system preferences will be
  used.
 
  Examples:
 
    To set the password to a given value:
        clientConfig.setProxyPassword('myProxyPassword');
    Note this does not overwrite the value set in the preferences panel.
 
    To set the password automatically based on provided preferences:
        clientConfig.setProxyPassword();
 
  The client initialization call will invoke setProxyPassword() to set
  a value based on the MATLAB preference if the proxy password value is set.
 
  Note, it is bad practice to store credentials in code, ideally this value
  should be read from a permission controlled file or other secure source
  as required.
```
### @ClientConfiguration/setProxyPort.m
```notalanguage
  SETPROXYPORT Sets the optional proxy port the client will connect through
  This is normally based on the setting in the MATLAB preferences panel. If the
  port is not set there on Windows then the Windows system preferences will be
  used. Though it is not normally the case proxy settings may vary based on the
  destination URL, if this is the case a URL should be provided for a specific
  service. If a URL is not provided then https://s3.amazonaws.com is used as
  a default and is likely to match the relevant proxy selection rules for AWS
  traffic.
 
  Examples:
 
    To have the port automatically set based on the default URL of
    https://s3.amazonaws.com:
        clientConfig.setProxyPort();
 
    To have the port automatically set based on the given URL:
        clientConfig.setProxyPort('https://examplebucket.amazonaws.com');
 
    To force the value of the port to a given value, e.g. 8080:
        clientConfig.setProxyPort(8080);
    Note this does not alter the value held set in the preferences panel.
 
  The client initialization call will invoke setProxyPort() to set a value based
  on the MATLAB preference if the proxy port value is not an empty value.
```
### @ClientConfiguration/setProxyUsername.m
```notalanguage
  SETPROXYUSERNAME Sets the optional proxy username
  This is based on the setting in the MATLAB preferences panel. If the username
  is not set there on Windows then the Windows system preferences will be
  used.
 
  Examples:
 
     To set the username to a given value:
         clientConfig.setProxyUsername('myProxyUsername');
     Note this does not overwrite the value set in the preferences panel.
 
     To set the password automatically based on provided preferences:
         clientConfig.setProxyUsername();
 
  The client initialization call will invoke setProxyUsername();
  to set preference based on the MATLAB preference if the proxyUsername value is
  not an empty value.
 
  Note it is bad practice to store credentials in code, ideally this value
  should be read from a permission controlled file or other secure source
  as required.
```

------


## @Object

### @Object/Object.m
```notalanguage
  OBJECT Root object for all the AWS SDK objects

    Documentation for aws.Object
       doc aws.Object

```

------

## AWS Common Related Functions:
### functions/Logger.m
```dontTreatAsALanguage
  Logger - Object definition for Logger
  ---------------------------------------------------------------------
  Abstract: A logger object to encapsulate logging and debugging
            messages for a MATLAB application.
 
  Syntax:
            logObj = Logger.getLogger();
 
  Logger Properties:
 
      LogFileLevel - The level of log messages that will be saved to the
      log file
 
      DisplayLevel - The level of log messages that will be displayed
      in the command window
 
      LogFile - The file name or path to the log file. If empty,
      nothing will be logged to file.
 
      Messages - Structure array containing log messages
 
  Logger Methods:
 
      clearMessages(obj) - Clears the log messages currently stored in
      the Logger object
 
      clearLogFile(obj) - Clears the log messages currently stored in
      the log file
 
      write(obj,Level,MessageText) - Writes a message to the log
 
  Examples:
      logObj = Logger.getLogger();
      write(logObj,'warning','My warning message')
 



```
### functions/aws.m
```dontTreatAsALanguage
  AWS, a wrapper to the AWS CLI utility
 
  The function assumes AWS CLI is installed and configured with authentication
  details. This wrapper allows use of the AWS CLI within the
  MATLAB environment.
 
  Examples:
     aws('s3api list-buckets')
 
  Alternatively:
     aws s3api list-buckets
 
  If no output is specified, the command will echo this to the MATLAB
  command window. If the output variable is provided it will convert the
  output to a MATLAB object.
 
    [status, output] = aws('s3api','list-buckets');
 
      output =
 
        struct with fields:
 
            Owner: [1x1 struct]
          Buckets: [15x1 struct]
 
  By default a struct is produced from the JSON format output.
  If the --output [text|table] flag is set a char vector is produced.
 



```
### functions/homedir.m
```dontTreatAsALanguage
  HOMEDIR Function to return the home directory
  This function will return the users home directory.



```
### functions/isEC2.m
```dontTreatAsALanguage
  ISEC2 returns true if running on AWS EC2 otherwise returns false



```
### functions/loadKeyPair.m
```dontTreatAsALanguage
  LOADKEYPAIR2CERT Reads public and private key files and returns a key pair
  The key pair returned is of type java.security.KeyPair
  Algorithms supported by the underlying java.security.KeyFactory library
  are: DiffieHellman, DSA & RSA.
  However S3 only supports RSA at this point.
  If only the public key is a available e.g. the private key belongs to
  somebody else then we can still create a keypair to encrypt data only
  they can decrypt. To do this we replace the private key file argument
  with 'null'.
 
  Example:
   myKeyPair = loadKeyPair('c:\Temp\mypublickey.key', 'c:\Temp\myprivatekey.key')
 
   encryptOnlyPair = loadKeyPair('c:\Temp\mypublickey.key')
 
 



```
### functions/saveKeyPair.m
```dontTreatAsALanguage
  SAVEKEYPAIR Writes a key pair to two files for the public and private keys
  The key pair should be of type java.security.KeyPair
 
  Example:
    saveKeyPair(myKeyPair, 'c:\Temp\mypublickey.key', 'c:\Temp\myprivatekey.key')
 



```
### functions/unlimitedCryptography.m
```dontTreatAsALanguage
  UNLIMITEDCRYPTOGRAPHY Returns true if unlimited cryptography is installed
  Otherwise false is returned.
  Tests using the AES algorithm for greater than 128 bits if true then this
  indicates that the policy files have been changed to enabled unlimited
  strength cryptography.



```
### functions/writeSTSCredentialsFile.m
```dontTreatAsALanguage
  WRITESTSCREDENTIALSFILE write an STS based credentials file
 
  Write an STS based credential file
 
    tokenCode is the 2 factor authentication code of choice e.g. from Google
    authenticator. Note the command must be issued quickly as this value will
    expire in a number of seconds
 
    serialNumber is the AWS 'arn value' e.g. arn:aws:iam::741<REDACTED>02:mfa/joe.blog
    this can be obtained from the AWS IAM portal interface
 
    region is the AWS region of choice e.g. us-west-1
 
  The following AWS command line interface (CLI) command will return STS
  credentials in json format as follows, Note the required multi-factor (mfa)
  auth version of the arn:
 
  aws sts get-session-token --token-code 631446 --serial-number arn:aws:iam::741<REDACTED>02:mfa/joe.blog
 
  {
      "Credentials": {
          "SecretAccessKey": "J9Y<REDACTED>BaJXEv",
          "SessionToken": "FQoDYX<REDACTED>KL7kw88F",
          "Expiration": "2017-10-26T08:21:18Z",
          "AccessKeyId": "AS<REDACTED>UYA"
      }
  }
 
  This needs to be rewritten differently to match the expected format
  below:
 
  {
      "aws_access_key_id": "AS<REDACTED>UYA",
      "secret_access_key" : "J9Y<REDACTED>BaJXEv",
      "region" : "us-west-1",
      "session_token" : "FQoDYX<REDACTED>KL7kw88F"
  }



```



------------    

[//]: # (Copyright 2019-2021 The MathWorks, Inc.)
