import { Controller, Get } from '@nestjs/common';

@Controller('dashboard')
export class DashboardController {
  @Get()
  findAll(): string {
    return 'Users can see the stock';
  }
}
