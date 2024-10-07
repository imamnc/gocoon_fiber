package welcome

import (
	"github.com/gofiber/fiber/v2"
)

// This is a handler to welcoming the user at main routes
func Welcome(c *fiber.Ctx) error {
	return c.Status(fiber.StatusOK).JSON(fiber.Map{
		"title":   "Gocoon Fiber",
		"author":  "Imam Nc",
		"message": "Welcome to Gocoon Fiber API, This is a Go REST API starter framework using Fiber + Gorm",
	})
}
