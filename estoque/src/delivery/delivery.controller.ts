import { Controller, Get } from '@nestjs/common';

@Controller('delivery')
export class DeliveryController {
  @Get()
  findAll(): string {
    return 'Delivery is available for all users and admins';
  }
}
