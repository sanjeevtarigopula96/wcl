FROM golang:latest
LABEL maintainer="sanjeev <wanclouds@gmail.net>"
WORKDIR $GOPATH/home/sanjeev/work/src/github.com/Wanclouds/wcprofiles/script
COPY . /run.sh
#EXPOSE 4000
#RUN mkdir /app
#ADD . /app/
#WORKDIR /app
#RUN go build -o wcleaves .
EXPOSE 8000
#CMD ["/leaves"]
CMD ["/run.sh"]
#FROM golang:1.8
#RUN mkdir /app
#ADD . /app/
#WORKDIR /app
#RUN go build -o wcleaves .
#EXPOSE 4000
#CMD ["/app/wcleaves"]
#FROM golang:latest
#RUN mkdir /app
#ADD . /app/
#WORKDIR /app
#RUN go build -o wcleaves .
#EXPOSE 4000
#CMD ["/app/wcleaves"]
