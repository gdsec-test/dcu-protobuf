# Description
[gRPC](http://grpc.io) based service to create Kelvin tickets.

# Location
DCU Kubernetes deployment (Non-Public)

# Purpose
Provides basic CRUD functionality for the Kelvin API.

# Source
https://github.secureserver.net/ITSecurity/kelvin-api

# Examples

## Golang Client
* Generate gRPC code
```
protoc --go_out=plugins=grpc:./pb -I /path/to/dcu_services/intake/kelvin_api /path/to/dcu_services/intake/kelvin_api/kelvinapi.proto
```

* Create simple client
```
package main

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.secureserver.net/ITSecurity/kelvin-api/pb"
	"google.golang.org/grpc"
)

const addr = "127.0.0.1:9000"

func main() {
	conn, err := grpc.Dial(addr, grpc.WithInsecure())
	if err != nil {
		log.Fatalf("Failed to dial: %v", err)
	}
	defer conn.Close()
	client := pb.NewKelvinAPIClient(conn)
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()

	resp, err := client.GetTicket(ctx, &pb.GetTicketRequest{TicketID: "DCUK000000002"})
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("%#v\n", resp)
}
```