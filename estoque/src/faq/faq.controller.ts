import { Controller, Get } from '@nestjs/common';

@Controller('faq')
export class FaqController {
  @Get()
  findAll(): string {
    return 'Faq is public for all users, admins and guests';
  }
}
