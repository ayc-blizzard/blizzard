# TEST


#### Assignment 
Write a simple test application that will query this “API” X times per second and record success/failure/TTLB

#### Content
Bash Script that calls "curl" multiple times a second.


#### Arguments
```
$1 = X times per second (default = 5)
$2 = Endpoints (default = https://google.com)
```

#### Build / Use
```
docker build -t ttfb . 
docker run -it --network="host" ttfb ./ttfb.sh 3 127.0.0.1:8080
```


#### Example Output
```
#Status: %{http_code} Connect: %{time_connect} TTFB: %{time_starttransfer} Total time: %{time_total}
```
```
test 1
Status: 200 Connect: 0.000748 TTFB: 0.014385 Total time: 0.018169 
test 2
Status: 200 Connect: 0.000768 TTFB: 0.001205 Total time: 0.001250 
test 3
Status: 200 Connect: 0.000258 TTFB: 0.002028 Total time: 0.002081 
test 1
Status: 200 Connect: 0.000829 TTFB: 0.001546 Total time: 0.001659 
test 2
Status: 200 Connect: 0.000184 TTFB: 0.001640 Total time: 0.001682 
test 3
Status: 200 Connect: 0.000195 TTFB: 0.001400 Total time: 0.001439
```

#### Issues
Each loop will be slightly more than a second since it uses command + `sleep 1` (and since command takes nonzero time, it will be slightly 1+ secondi for each loop) 
