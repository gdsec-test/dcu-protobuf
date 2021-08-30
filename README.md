# DCU Services
DCU Services provides a monorepo for storage of protobuf files. It also supports the automatic generation of server/client code for these definitions.

  *[Main]* | [Docs] 
  
## Adding a Service
If you would like to add a service to this repository, create a top level directory that contains the following:
1. A proto file matching your top level service directory e.g. `phishstory-service/phishstory-service.proto`
2. A `.protolangs` file containing new line separated languages to support
3. Create an empty repository following this pattern `dcu_services-<service>-<language>` e.g. `dcu_services-phishstory-service-go`
4. Add write permissions for DCU-Eng team for this new repository
4. Merge your changes into master

After this has completed your generated stub code will be located in the repository specified above.

## Before Merging to Main
Once a branch is merged into main, Jenkins will run a job to build new protobuffer files. Jenkins needs to be available to do this.
1. Ensure the Jenkins server is up and running by visiting [this link](https://infosec-dcu.jenkins.int.godaddy.com/).
   1. If Jenkins is down, ssh to infosec-dcu.jenkins.int.godaddy.com, become root and run the following command
      *. `systemctl restart jenkins`
   1. Log into Jenkins by pointing your browser [here](https://infosec-dcu.jenkins.int.godaddy.com/).  Use your jomax credentials.  You will be able to view job status here.

## License
The license specified in this repository applies only to the `build.sh` file which has been modified from Namely's [docker-protoc](https://github.com/namely/docker-protoc).


[Main]: https://github.secureserver.net/digital-crimes/dcu_services
[Docs]: https://github.secureserver.net/digital-crimes/dcu_services/tree/master/docs