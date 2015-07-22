Sys.setenv(NOAWT = "true")
library('httr')
library('rjson')
library('RCurl')

#url <- "http://localhost:8080"
url <- "http://192.168.59.103:8080"
#url <- "http://54.153.151.37:8080"

url <- paste(url, "/kie-server/services/rest/server/containers/watch", sep = "")
print(url)

request <- "
<kie-container>  
  <container-id>watch</container-id> 
  <status/>   
  <release-id>  
    <group-id>com.redhat.demos</group-id> 
    <artifact-id>weightwatchers</artifact-id> <version>1.0</version> 
  </release-id> 
  <resolved-release-id/> 
</kie-container>
"
header=c(Connection="close", 'Content-Type'="application/xml", 'Content-length'=nchar(request))

response <- tryCatch({
  PUT(url, body=request, content_type_xml(), header=header, verbose(), authenticate("erics", "jbossbrms1!", type="basic"))
}, warning = function(w) {
  print("Warning PUT")
  stop()
}, error = function(e) {
  print(geterrmessage())
  print("Error PUT")
  stop()
}, finally = {
})

content(response, type="application/xml")

request <-"
<batch-execution lookup=\"watchsession\" >
  <insert-elements return-object=\"false\">
  <com.redhat.weightwatcher.Fact>
  <factid>1</factid>
  <facttype>1</facttype>
  <facttxt>Incoming</facttxt>
  </com.redhat.weightwatcher.Fact>
  <com.redhat.weightwatcher.Fact>
  <factid>2</factid>
  <facttype>1</facttype>
  <facttxt>Incoming</facttxt>
  </com.redhat.weightwatcher.Fact>
  </insert-elements>
  <fire-all-rules/>
  <query out-identifier=\"Factin\" name=\"getFactin\"/>
  </batch-execution>
"

header=c(Connection="close", 'Content-Type'="application/xml", 'Content-length'=nchar(request))

response <- tryCatch({
  POST(url, body=request, content_type_xml(), header=header, verbose(), authenticate("erics", "jbossbrms1!", type="basic"))
}, warning = function(w) {
  print("Warning POST")
  stop()
}, error = function(e) {
  print(geterrmessage())
  print("Error POST")
  stop()
}, finally = {
})

content(response, type="application/xml")

request <-"
<batch-execution lookup=\"watchsession\" >
  <insert-elements return-object=\"false\">
	
<com.redhat.weightwatcher.Fact>
<factid>1</factid>
<facttype>1</facttype>
<factname>Participant</factname>
<factjson>{ \"userid\" : 1, \"username\" : \"bfskinner@behaviorist.org\" }</factjson>
<facttxt>Incoming Participant JSON</facttxt>
</com.redhat.weightwatcher.Fact>
<com.redhat.weightwatcher.Fact>
<factid>2</factid>
<facttype>1</facttype>
<factname>Participant</factname>
<factjson>{ \"userid\" : 2, \"username\" : \"ipavlov@behaviorist.org\" }</factjson>
<facttxt>Incoming Participant JSON</facttxt>
</com.redhat.weightwatcher.Fact>

<com.redhat.weightwatcher.Fact>
<factid>1</factid>
<facttype>1</facttype>
<factname>Goal</factname>
<factjson>{ \"userid\" : 2, \"goalname\" : \"weight\", target : 65, start : 75, low : 60, high : 68 }</factjson>
<facttxt>Incoming Goal JSON</facttxt>
</com.redhat.weightwatcher.Fact>
<com.redhat.weightwatcher.Fact>
<factid>2</factid>
<facttype>1</facttype>
<factname>Goal</factname>
<factjson>{ \"userid\" : 1, \"goalname\" : \"weight\", target : 75, start : 84, low : 70, high : 78 }</factjson>
<facttxt>Incoming Goal JSON</facttxt>
</com.redhat.weightwatcher.Fact>

<com.redhat.weightwatcher.Fact>
<factid>1</factid>
<facttype>1</facttype>
<factname>Observation</factname>
<factjson>{ \"userid\" : 1, \"obsdate\" : \"2015-04-20 07:15:00 EST\", \"obsname\" : \"weight\", \"obsvalue\" : 80 }</factjson>
<facttxt>Incoming Observation JSON</facttxt>
</com.redhat.weightwatcher.Fact>
<com.redhat.weightwatcher.Fact>
<factid>2</factid>
<facttype>1</facttype>
<factname>Observation</factname>
<factjson>{ \"userid\" : 1, \"obsdate\" : \"2015-04-21 08:15:00 EST\", \"obsname\" : \"weight\", \"obsvalue\" : 79 }</factjson>
<facttxt>Incoming Observation JSON</facttxt>
</com.redhat.weightwatcher.Fact>
<com.redhat.weightwatcher.Fact>
<factid>3</factid>
<facttype>1</facttype>
<factname>Observation</factname>
<factjson>{ \"userid\" : 1, \"obsdate\" : \"2015-04-22 09:15:00 EST\", \"obsname\" : \"weight\", \"obsvalue\" : 78 }</factjson>
<facttxt>Incoming Observation JSON</facttxt>
</com.redhat.weightwatcher.Fact>
<com.redhat.weightwatcher.Fact>
<factid>4</factid>
<facttype>1</facttype>
<factname>Observation</factname>
<factjson>{ \"userid\" : 2, \"obsdate\" : \"2015-04-20 05:15:00 EST\", \"obsname\" : \"weight\", \"obsvalue\" : 70 }</factjson>
<facttxt>Incoming Observation JSON</facttxt>
</com.redhat.weightwatcher.Fact>
<com.redhat.weightwatcher.Fact>
<factid>6</factid>
<facttype>1</facttype>
<factname>Observation</factname>
<factjson>{ \"userid\" : 2, \"obsdate\" : \"2015-04-21 06:15:00 EST\", \"obsname\" : \"weight\", \"obsvalue\" : 69 }</factjson>
<facttxt>Incoming Observation JSON</facttxt>
</com.redhat.weightwatcher.Fact>
<com.redhat.weightwatcher.Fact>
<factid>4</factid>
<facttype>1</facttype>
<factname>Observation</factname>
<factjson>{ \"userid\" : 2, \"obsdate\" : \"2015-04-22 07:15:00 EST\", \"obsname\" : \"weight\", \"obsvalue\" : 68 }</factjson>
<facttxt>Incoming Observation JSON</facttxt>
</com.redhat.weightwatcher.Fact>

</insert-elements>
<fire-all-rules/>
<query out-identifier=\"Watch\" name=\"getWatch\"/>
</batch-execution>
"

header=c(Connection="close", 'Content-Type'="application/xml", 'Content-length'=nchar(request))

response <- tryCatch({
  POST(url, body=request, content_type_xml(), header=header, verbose(), authenticate("erics", "jbossbrms1!", type="basic"))
}, warning = function(w) {
  print("Warning POST")
  stop()
}, error = function(e) {
  print(geterrmessage())
  print("Error POST")
  stop()
}, finally = {
})

content(response, type="application/xml")



