# API

#### Assignment 
Write a web application in your language of choice that returns the current date/time in JSON


#### Content
Application written in Go.



#### Build / Use
```
docker build -t returntime .

docker run -i -t -p 8080:8080 returntime
```

#### Example Output
```
{"Date": "2020-05-14", "Time": "05:44:03.772041693 UTC"}
```
