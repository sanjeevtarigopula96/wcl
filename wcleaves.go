package main

import (
	"flag"
	"log"

	wcprofiles "github.com/Wanclouds/wcprofiles"
	"github.com/Wanclouds/wcprofiles/api/handlers"
	"github.com/Wanclouds/wcprofiles/gen/restapi"
	operations "github.com/Wanclouds/wcprofiles/gen/restapi/operations"
	"github.com/go-openapi/loads"
)

var portFlag = flag.Int("port", 8000, "Port to run this service on")

func main() {
	// load embedded swagger file
	swaggerSpec, err := loads.Analyzed(restapi.SwaggerJSON, "")
	if err != nil {
		log.Fatalln(err)
	}

	// create new service API
	api := operations.NewWcprofilesAPI(swaggerSpec)
	server := restapi.NewServer(api)
	defer server.Shutdown()

	// parse flags
	flag.Parse()
	// set the port this service will be run on
	server.Port = *portFlag

	var rt = wcprofiles.NewRunTime()
	handlers.Init(api, &rt)

	// serve API
	if err := server.Serve(); err != nil {
		log.Fatalln(err)
	}
}
