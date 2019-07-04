#FROM golang:latest
#LABEL maintainer="sanjeev <wanclouds@gmail.net>"
#WORKDIR $GOPATH/home/sanjeev/work/src/github.com/Wanclouds/wcprofiles
#COPY script /run.sh
#COPY . /run.sh
#RUN chmod +x /run.sh
#COPY script/entrypoint.sh /entrypoint.sh
#EXPOSE 4000
#RUN mkdir /app
#ADD . /app/
#WORKDIR /app
#RUN go build -o run.sh .
#EXPOSE 8000
#CMD ["/leaves"]
#CMD ["/run.sh"]
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
FROM golang:latest
WORKDIR $GOPATH/src/github.com/Wanclouds/wcprofiles
#WORKDIR /home/sanjeev/awesome/wcl/.s2i/bin
COPY . /leaves/
#COPY run.sh /root
#RUN docker build leaves .
RUN docker build -t wc-leave $GOPATH/home/sanjeev/work/src/github.com/Wanclouds/wcprofiles
RUN docker run -p 4000:8000 wc-leave
#EXPOSE 4000
CMD ["/leaves"]

# put the script in the /root directory of the container
#COPY provision.sh /root

# execute the script inside the container
#RUN /root/provision.sh

#EXPOSE 8000

# Default command
#CMD ["/run.sh"]
