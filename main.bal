import ballerina/http;
import ballerina/io;



public function main() {
    int operation = 0; 
     while (operation != 5) {
        io:println("Select operation.");
        io:println("1. Find Non Followers");
        io:println("2. Get Organizations"); 
        io:println("3. Get Repositories");
        io:println("4. User Summary");
        io:println("5. Exit");

        // read user's choice
        string val = io:readln("Enter choice 1 - 5: ");
        
        var choice = int.convert(val);
        if (choice == 1){
            string username = io:readln("Enter username: ");
            http:Client clientEndpoint = new("https://api.github.com/users/"+username);
            
            io:println("Non Followers");
            var responseFollowers = clientEndpoint->get("/followers");
            var responseFollowings = clientEndpoint->get("/following");

            if (responseFollowers is http:Response) {
                if (responseFollowings is http:Response) {
                    var following = responseFollowings.getJsonPayload();        
                    var followers = responseFollowers.getJsonPayload();
                    if (following is json) {
                        var lengthFollowing = following.length()-1;            
                        foreach var i in 0...lengthFollowing {       
                            if (followers is json) {
                                var lengthFollower = followers.length()-1;
                                var count =0;            
                                foreach var j in 0...lengthFollower {                        
                                    if(following[i].login == followers[j].login){
                                        count = count +1;
                                    }                                        
                                }
                                if(count == 0){
                                    io:println(following[i].login);
                                }
                                                
                            } else {
                                io:println("Invalid payload received:");
                            }                
                        }
                        
                    } else {
                        io:println("Invalid payload received:" );
                    }
                } else {
                    io:println("Error when calling the backend: ");
                }
            }
        }else if(choice == 2){
            string username = io:readln("Enter username: ");
            http:Client clientEndpoint = new("https://api.github.com/users/"+username);            
            io:println("---------------Organization---------------");
            var responseOrgs = clientEndpoint->get("/orgs");
                if (responseOrgs is http:Response) {
                    var orgs = responseOrgs.getJsonPayload();   
                    if (orgs is json) {
                        var lengthOrg = orgs.length()-1;            
                        foreach var i in 0...lengthOrg { 
                            io:println(orgs[i].login);  
                        }               
                    } else {
                        io:println("Invalid payload received:" );
                    }
                    io:println("---------------Organizations---------------");
                }

            

        }else if(choice == 3){
            string username = io:readln("Enter username: ");
            http:Client clientEndpoint = new("https://api.github.com/users/"+username);            
            io:println("---------------Repositories---------------");
            var responseRepos = clientEndpoint->get("/repos");
            if (responseRepos is http:Response) {
                    var repos = responseRepos.getJsonPayload();   
                    if (repos is json) {
                        var lengthRepos = repos.length()-1;            
                        foreach var i in 0...lengthRepos { 
                            io:println(repos[i].name);  
                        }
                        
                    } else {
                        io:println("Invalid payload received:" );
                    }
            }
            io:println("---------------Repositories---------------");

        }else if(choice == 4){
            string username = io:readln("Enter username: ");
            http:Client clientEndpoint = new("https://api.github.com/users/"+username);            
            io:println("---------------User Summary---------------");
            var userResponse = clientEndpoint->get("");
            if (userResponse is http:Response) {
                var user = userResponse.getJsonPayload();   
                if (user is json) {   
                    io:println(user.name); 
                    io:println(user.login);
                    io:println(user.blog); 
                    io:println(user.location);
                    io:println(user.bio); 
                    io:println(user.public_repos);
                    io:println(user.followers); 
                    io:println(user.following);

                } else {
                    io:println("Invalid payload received:" );
                }
            }
            io:println("---------------User Summary---------------");

        }else if(choice == 5){
           break;

        }
        
     }
    
}

    