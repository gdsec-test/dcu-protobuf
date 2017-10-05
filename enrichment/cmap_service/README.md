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
  3. Press the Play button. 
  
  Hint: pressing Ctrl-Space while your cursor is on the left pane will provide you with possible items to add to your query such as Alexa ranking, ip addresses abuse contacts etc. Be sure to visit the Docs link in the upper right corner to get a sense of all the possible data that can be gathered.
  
* A more complex web page example

```
{
  domainQuery(domain:"godaddy.com"){
    host{
      hostingCompanyName
      ip
      dataCenter
      guid
      hostingAbuseEmail
      os
    }
    registrar{
      registrarName
      domainCreateDate
      registrarAbuseEmail
    }
    
    alexaRank
    shopperInfo{
      domainCount
      shopperCreateDate
      shopperId
      vip{
        portfolioType
      }
    }
  }
}
```
  Output
```
  {
  "data": {
    "domainQuery": {
      "host": {
        "hostingCompanyName": "GoDaddy.com LLC",
        "ip": "208.109.192.70",
        "dataCenter": "P3",
        "guid": "28fa828c-5500-11e4-b427-14feb5d40b65",
        "hostingAbuseEmail": [
          "abuse@godaddy.com"
        ],
        "os": "Linux"
      },
      "registrar": {
        "registrarName": "GoDaddy.com, LLC",
        "domainCreateDate": "1999-03-02",
        "registrarAbuseEmail": [
          "abuse@godaddy.com"
        ]
      },
      "alexaRank": 186,
      "shopperInfo": {
        "domainCount": 665,
        "shopperCreateDate": "2002-09-06",
        "shopperId": "1001700",
        "vip": {
          "portfolioType": "CN"
        }
      }
    }
  }
}
```
