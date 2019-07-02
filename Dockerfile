FROM golang:latest
#LABEL maintainer="sanjeev <wanclouds@gmail.net>"
#WORKDIR $GOPATH/home/sanjeev/work/src/github.com/Wanclouds/wcprofiles
#COPY ./leaves .
# EXPOSE 5000
RUN mkdir /app
ADD . /app/
WORKDIR /app
RUN go build -o leaves .
EXPOSE 8000
CMD ["/app/leaves"]
#CMD ["./leaves"]
