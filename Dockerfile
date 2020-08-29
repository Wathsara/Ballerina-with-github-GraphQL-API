FROM ballerinalang/ballerina:0.96.0
LABEL maintainer="Wathsara"
COPY main.bal /home/ballerina
CMD ballerina run main.bal
