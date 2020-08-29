FROM ballerina/ballerina:0.980.0
LABEL maintainer="Wathsara"
COPY main.bal /home/ballerina
CMD ballerina run main.bal
