package models

import (
	"gocoon_fiber/models/entity"
)

var Models = make(map[string]interface{})

type Model interface{}

// Register every model here for validation purpose
func Register() {
	Models["User"] = &entity.User{}
	Models["Todo"] = &entity.Todo{}
}
