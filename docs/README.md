### Follow these steps to modify Protobuf definitions

1. Clone the dcu_services repo to your local pyenv environment.
2. Edit the proto definition that you want to modify. eg. https://github.secureserver.net/digital-crimes/dcu_services/blob/master/phishstory-service/phishstory-service.proto
    Make sure that you append a new field in the definition with the right index.
3. Create a PR and merge the code into master. Once you merge the code in master, a Jenkins build will be triggered.
4. Monitor the Jenkins build at https://infosec-dcu.jenkins.int.godaddy.com/job/dcu_services/
5. Depending on the status of the Jenkins build, follow the appropriate section below.

### Your Jenkins build failed

A common error could be:

```
ERROR: Failed to clean the workspace
jenkins.util.io.CompositeIOException: Unable to delete '/var/lib/jenkins/workspace/dcu_services'. Tried 3 times (of a maximum of 3) waiting 0.1 sec between attempts.
at jenkins.util.io.PathRemover.forceRemoveDirectoryContents(PathRemover.java:90)
at hudson.Util.deleteContentsRecursive(Util.java:259)
at hudson.Util.deleteContentsRecursive(Util.java:248)
at org.jenkinsci.plugins.gitclient.CliGitAPIImpl$2.execute(CliGitAPIImpl.java:626)
```

This implies that Jenkins failed to clear the contents in the Jenkins workspace directory. 

To resolve this error, head over to the Jenkins server(get the FQDN from Cloud UI).
```
ssh <jenkins fqdn>
```

As a root user:
```
cd /var/lib/jenkins/workspace/dcu_services
```

Be cautious here and delete the contents of the workspace/dcu_services directory only.

```
rm -rf domain-service
rm -rf kelvin-service
rm -rf phishstory-service
```
This should clean up the Jenkins dcu_services workspace

To run the build again, click on Replay build in the Jenkins UI. The build should succeed now. Head over to the next section.

![jenkins](/docs/jenkins.png?raw=true "Jenkins")

### Your Jenkins build passed

1. The Jenkins build will generate pb files in https://github.secureserver.net/digital-crimes/dcu_services-phishstory-service-python in this case.
   Look for similar repo names in https://github.secureserver.net/digital-crimes if Kelvin Service or Domain Service was modified.
3. Copy the modified files from this repo and replace the existing pb files in https://github.secureserver.net/digital-crimes/abuse-api and https://github.secureserver.net/digital-crimes/phishstory-service. Note that this example is for modifications to Phishstory Service. If Kelvin Service or Domain Service was modified, look for the files to be replaced in https://github.secureserver.net/digital-crimes/kelvin-service or similar.
4. Make sure that both Abuse-API and Phishstory-Service(or Kelvin-Service) have been modified. This will complete the protobuf definition changes on both ends of the gRPC communication


