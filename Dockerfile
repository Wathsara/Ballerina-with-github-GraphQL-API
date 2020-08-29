FROM ballerina/ballerina:0.990.5
LABEL maintainer="Wathsara"
COPY main.bal /home/ballerina
CMD ballerina run main.bal
