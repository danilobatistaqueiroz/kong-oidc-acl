"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const core_1 = require("@nestjs/core");
const app_module_1 = require("./app.module");
const fs = require("fs");
async function bootstrap() {
    const httpsOptions = {
        key: fs.readFileSync('./ssl/server.key'),
        cert: fs.readFileSync('./ssl/server.pem'),
    };
    const app = await core_1.NestFactory.create(app_module_1.AppModule, { httpsOptions });
    await app.listen(3000);
}
bootstrap();
//# sourceMappingURL=main.js.map