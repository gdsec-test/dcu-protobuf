# Description
[gRPC](http://grpc.io) based domain service

# Location
DCU Kubernetes deployment (Non-Public)

# Purpose
Provides basic domain based lookup operations and modifications

# Source
https://github.secureserver.net/ITSecurity/domainservice

# Examples

### Python client
Visit https://grpc.io/docs/quickstart/python.html and install the requisite python dependencies

* Generate gRPC code
```
python -m grpc_tools.protoc -Ipath/to/domain_service --python_out=. --grpc_python_out=. /path/to/domain_service/domainservice.proto
```

* Create simple client

```
import logging
import domainservice_pb2
import domainservice_pb2_grpc
import grpc

if __name__ == '__main__':
    logger = logging.getLogger(__name__)
    channel = grpc.insecure_channel('localhost:9000')
    stub = domainservice_pb2_grpc.DomainServiceStub(channel)
    try:
        resp = stub.GetDomains(
            domainservice_pb2.GetDomainsRequest(customerid="123456789"),
            timeout=5
        )
        for domain in resp.domains:
            logger.info("{}".format(domain))
    except grpc.RpcError as e:
        logger.error("Error: {}:{}".format(e, e.code()))
```
Replace 'localhost:9000' with the location and port that the gRPC server is currently running.
