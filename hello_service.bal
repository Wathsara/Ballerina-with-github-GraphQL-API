// A system module containing protocol access constructs
// Module objects referenced with 'http:' in code
import ballerina/http;
import ballerina/io;
import wso2/facebook;


# A service is a network-accessible API
# Advertised on '/hello', port comes from listener endpoint
service hello on new http:Listener(9090) {

    # A resource is an invokable API method
    # Accessible at '/hello/sayHello
    # 'caller' is the client invoking this resource 

    # + caller - Server Connector
    # + request - Request
    resource function sayHello(http:Caller caller, http:Request request) {

        facebook:FacebookConfiguration facebookConfig = {
            clientConfig:{
                auth:{
                    scheme: http:OAUTH2,
                    config: {
                        grantType: http:DIRECT_TOKEN,
                        config: {
                            accessToken: "EAAJcfnWFMZCABAMoGQ24uZAZAE1BDvdxwsDLLMVZBqhyHOpV3FGOifwpGaZBOZAR4uuhodX7fIKDg2yQe6ucvrED1Xz5TKsCb4CikyFZCYgQONMY4zK7OroAZCajjgBfv7v3ZB3nUqCje2EZBjDXbZCamNOod9KHDl1Fje97BN07Ii8AfQZAaGMVpTUq"
                        }
                    }
                }
            }
        };

        facebook:Client facebookClient = new(facebookConfig);
        var response = facebookClient->getFriendListDetails("me");
        if (response is facebook:FriendList) {
            io:println("Friend List: ", response.data);
        } else {
            io:println("Error: ", response);
        }
        // var response = facebookClient->retrievePost("788239567865981_10153513872748291");
        // if (response is facebook:Post) {
        //     io:println("Post Details: ", response);
        // } else {
        //     io:println("Error: ", response);
        // }
        http:Response r = new;

        // Set a string payload to be sent to the caller
        r.setTextPayload("Hello Ballerina!");

       //Get Friends list details
        // var response = facebookClient->createPost("100002712031204","test","","");
        // if (response is facebook:Post) {
        // // If successful, print the Post details.
        //     io:println("Post Details: ", response);
        // } else {
        // // If unsuccessful, print the error returned.
        //      io:println("Error: ", response);
        // }


    }
}