# Description
graphQL based data enrichment service

# Purpose
Provides detailed information regarding domains and shoppers

# Location
https://cmapservice.int.godaddy.com/graphql

# Source
https://github.secureserver.net/ITSecurity/cmap_service

# Examples

* Curl basic hosting and registrar information
```
curl -X POST -H 'Content-Type:application/graphql' 'https://cmapservice.int.godaddy.com/graphql' -d '{domainQuery(domain:"godaddy.com"){host{ hostingCompanyName ip } registrar{ registrarName domainCreateDate }}}'
```
Output
```
{"data":{"domainQuery":{"host":{"hostingCompanyName":"GoDaddy.com LLC","ip":"208.109.192.70"},"registrar":{"registrarName":"GoDaddy.com, LLC","domainCreateDate":"1999-03-02"}}}}
```

* Enter basic hosting and registrar query into web GUI

  1. Navigate to https://cmapservice.int.godaddy.com/graphql
  2. Enter the following into the left pane
```
  {
    domainQuery(domain:"godaddy.com"){
    host{
      hostingCompanyName
      ip
    }
    registrar{
      registrarName
      domainCreateDate
    }
   }
  }
```
  3. Press the Play button. Hint: while your cursor is underneath the domainQuery scope, press Ctrl+Space to get suggestions on other information that can be added to your query. Also be sure to visit the Docs link in the upper right corner.
