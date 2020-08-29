FROM ballerina/ballerina:0.991.0
LABEL maintainer="Wathsara"
COPY main.bal /home/ballerina
ENTRYPOINT  ["ballerina","run","/home/ballerina/main.bal"]
# CMD ballerina run 
