package routes

import (
	"gocoon_fiber/services/auth"
	"gocoon_fiber/services/todo"
	"gocoon_fiber/services/user"
	"gocoon_fiber/services/welcome"

	"github.com/gofiber/fiber/v2"
)

func Setup(app *fiber.App) {
	// Welcome routes
	welcome.Mount(app)
	// User routes
	user.Mount(app)
	// Todo routes
	todo.Mount(app)
	// Auth routes
	auth.Mount(app)
}
