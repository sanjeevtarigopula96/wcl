#FROM golang:latest
#LABEL maintainer="sanjeev <wanclouds@gmail.net>"
#RUN  /home/sanjeev/work/src/github.com/Wanclouds/wcprofiles/script
#ADD . /run.sh
#WORKDIR /home/sanjeev/awesome/wcl
#COPY script /run.sh
#COPY ./run.sh .
#RUN  chmod +x run.sh
#RUN /run.sh
#COPY script/entrypoint.sh /entrypoint.sh
#EXPOSE 4000
#RUN mkdir /app
#ADD . /app/
#WORKDIR /app
#RUN go build -o wcleaves .
#EXPOSE 8000
#CMD ["/app/wcleaves"]
#CMD ["npm","start"]
#CMD ["sh","./run.sh"]
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
#WORKDIR $GOPATH/src/github.com/Wanclouds/wcprofiles
WORKDIR /home/sanjeev/work/src/github.com/Wanclouds/wcprofiles
#WORKDIR /home/sanjeev/awesome/wcl/.s2i/bin
COPY . /leaves/
RUN chmod +x /leaves
#COPY run.sh /root
#RUN  /root./run.sh
#COPY run.sh /root

EXPOSE 8000
CMD ["sh","/leaves"]

# put the script in the /root directory of the container
#COPY provision.sh /root

# execute the script inside the container
#RUN /root/provision.sh

#EXPOSE 8000

# Default command
#CMD ["/run.sh"]
