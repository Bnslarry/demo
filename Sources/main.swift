import Kitura
import KituraStencil
import HeliumLogger
import LoggerAPI
HeliumLogger.use()
let router = Router()
router.setDefault(templateEngine: StencilTemplateEngine())
router.get("/") {
    request, response, next in
    defer { next() }
    try response.render("home", context: [:])
}
router.get("/staff") {
    request, response, next in
    response.send("Meet our great team")
    next()
}
router.get("/contact") {
    request, response, next in
    defer { next() }
    try response.render("contact", context: [:])
}
Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()
