FROM golang:latest
LABEL maintainer="sanjeev <wanclouds@gmail.net>"
WORKDIR $GOPATH/home/sanjeev/work/src/github.com/Wanclouds/wcprofiles/script
COPY ./run .
# EXPOSE 5000
#RUN mkdir /app
#ADD . /app/
#WORKDIR /app
#RUN go build -o wcleaves .
#EXPOSE 8000
#CMD ["/app/wcleaves"]
CMD ["/run"]
#FROM golang:1.8
#RUN mkdir /app
#ADD . /app/
#WORKDIR /app
#RUN go build -o leaves .
#EXPOSE 4000
#CMD ["/app/leaves"]
