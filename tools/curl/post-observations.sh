curl -i -H "Content-Type: application/xml" -d @"post-observations.xml" -u "erics:jbossbrms1!" -X POST "http://weightwatcher.cloudapps-da36.oslab.opentlc.com/kie-server/services/rest/server/containers/watch"

# cat post-observations.xml | curl -i -X POST -H "Content-Type: text/xml" -d @- http://erics:jbossbrms1!@weightwatcher.cloudapps-da36.oslab.opentlc.com/kie-server/services/rest/server/containers/watch
