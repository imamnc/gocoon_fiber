package auth

import "github.com/gofiber/fiber/v2"

func Mount(app *fiber.App) {
	app.Post("/login", Login)
}
