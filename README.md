# DCU Services
DCU Services provides a monorepo for storage of protobuf files. It also supports the automatic generation of server/client code for these definitions.

## Adding a Service
If you would like to add a service to this repository, create a top level directory that contains the following:
1. A proto file matching your top level service directory e.g. `phishstory-service/phishstory-service.proto`
2. A `.protolangs` file containing new line separated languages to support
3. Create an empty repository following this pattern `dcu_services-<service>-<language>` e.g. `dcu_services-phishstory-service-go`
4. Add write permissions for DCU-Eng team for this new repository
4. Merge your changes into master

After this has completed your generated stub code will be located in the repository specified above.

## License
The license specified in this repository applies only to the `build.sh` file which has been modified from Namely's [docker-protoc](https://github.com/namely/docker-protoc).