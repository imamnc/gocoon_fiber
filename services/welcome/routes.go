package welcome

import (
	"github.com/gofiber/fiber/v2"
)

func Mount(app *fiber.App) {

	app.Get("/", Welcome)

}
