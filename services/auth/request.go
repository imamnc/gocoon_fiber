package auth

import (
	"gocoon_fiber/utils"

	"github.com/thedevsaddam/govalidator"
)

type LoginRequest struct {
	Email    string `json:"email"`
	Password string `json:"password"`
}

func (r *LoginRequest) Validate() interface{} {
	err := utils.Validation().Validate(r, govalidator.MapData{
		"email":    []string{"required", "email"},
		"password": []string{"required"},
	})
	return err
}
