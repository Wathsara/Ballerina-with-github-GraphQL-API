FROM ballerina/ballerina:0.991.0
LABEL maintainer="Wathsara"
COPY main.bal /home/ballerina
CMD ballerina run main.bal
