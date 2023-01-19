package main

import (
	"embed"
	"log"
	"net/http"
)

//go:embed *.wasm
var wasmFiles embed.FS

func main() {
	log.Printf("starting WASM binary server on port 8080...")
	mutex := http.NewServeMux()
	mutex.Handle("/", http.FileServer(http.FS(wasmFiles)))
	if err := http.ListenAndServe(":8080", mutex); err != nil {
		log.Fatal(err)
	}
}
