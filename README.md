# DCU Protobuf
DCU Protobuf provides a monorepo for storage of protobuf files. It also supports the automatic generation of server/client code for these definitions.
  
## Adding a Service
If you would like to add a service to this repository, create a top level directory that contains the following:
1. A proto file matching your top level service directory e.g. `phishstory-service/phishstory-service.proto`
1. A `.protolangs` file containing new line separated languages to support
1. Add an appropriate entry for the new service to `.github/workflows/proto-gen.yml`
1. Merge your changes into master

>   *Now that this repo has been migrated to gdcorp-infosec, it no longer uses Jenkins to build protobuffer files.  Instead, github actions will be used to compile pb files and store them as artifacts, which can be downloaded from the latest successful workflow run on [this page](https://github.com/gdcorp-infosec/dcu-protobuf/actions/workflows/proto-gen.yml).*

## License
The license specified in this repository applies only to the `.github/workflows/proto-gen.yml` file which has been modified from Namely's [docker-protoc](https://github.com/namely/docker-protoc).
