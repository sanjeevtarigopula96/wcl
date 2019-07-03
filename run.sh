

cp -i /home/sanjeev/work/bin/leaves /home/sanjeev/work/src/github.com/Wanclouds/wcprofiles

docker build -t wc-leave $GOPATH/home/sanjeev/work/src/github.com/Wanclouds/wcprofiles
docker run -p 4000:8000 wc-leave 
