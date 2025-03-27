import { Controller, Get } from '@nestjs/common';

@Controller('home')
export class HomeController {
  @Get()
  findAll(): string {
    return 'Home is public for all users, admins and guests';
  }
}
