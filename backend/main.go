package main

import (
	"log"

	"github.com/gin-gonic/gin"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

var db *gorm.DB

func init() {
	var err error
	db, err = gorm.Open(sqlite.Open("db.db"), &gorm.Config{})

	if err != nil {
		log.Fatalln("Failed to open database")
	}
}

func main() {
	router := gin.Default()

	router.GET("/", pingHandler)
	router.GET("/ping", pingHandler)

	router.Run("localhost:5000")
}
