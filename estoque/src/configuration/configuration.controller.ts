import { Controller, Get } from '@nestjs/common';

@Controller('configuration')
export class ConfigurationController {
  @Get()
  findAll(): string {
    return 'Configuration are available only for admins';
  }
}
