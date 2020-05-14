package main

import (
	"log"
	"net/http"
	"time"

	"github.com/gorilla/mux"
)


func returnTime(w http.ResponseWriter, r *http.Request) {
    w.Header().Set("Content-Type", "application/json")
    w.WriteHeader(http.StatusOK)

	currentDate := time.Now().Format("2006-01-02")
	currentTime := time.Now().Format("15:04:05.000000000 MST")

	w.Write([]byte(`{"Date": "` + currentDate + `", "Time": "` + currentTime + `"}`))
}


func main() {
	// env := os.Getenv("APP_ENV") 
	router := mux.NewRouter().StrictSlash(true)
	router.HandleFunc("/", returnTime)
	log.Fatal(http.ListenAndServe(":8080", router))
}
