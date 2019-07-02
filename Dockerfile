FROM golang:latest
LABEL maintainer="sanjeev <wanclouds@gmail.net>"
WORKDIR $GOPATH/home/sanjeev/work/src/github.com/Wanclouds/wcprofiles
ADD ./leaves .
# EXPOSE 5000
#RUN mkdir /app
#ADD . /app/
#WORKDIR /app
#RUN go build -o wcleaves .
#EXPOSE 8000
#CMD ["/app/wcleaves"]
CMD ["/leaves"]
#FROM golang:1.8
#RUN mkdir /app
#ADD . /app/
#WORKDIR /app
#RUN go build -o leaves .
#EXPOSE 4000
#CMD ["/app/leaves"]
