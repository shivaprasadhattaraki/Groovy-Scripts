curl \
   -D- \
   -u Testbar@metricstream.com:testbar \
   -X POST \
   -H "Content-Type: application/json" \
   --data '{"jql":"project = PADI","startAt":0,"maxResults":2,"fields":["id","key","summary","assignee","reporter"]}' \
   "https://padijira.metricstream.com/rest/api/2/search"
