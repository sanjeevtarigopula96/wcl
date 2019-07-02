FROM golang:latest
LABEL maintainer="sanjeev <wanclouds@gmail.net>"
WORKDIR $GOPATH/home/sanjeev/work/src/github.com/Wanclouds/wcprofiles
COPY ./leaves .
# EXPOSE 5000
CMD ["./leaves"]
