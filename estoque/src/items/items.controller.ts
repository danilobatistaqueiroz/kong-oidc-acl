import { Controller, Get } from '@nestjs/common';

@Controller('items')
export class ItemsController {
    @Get()
    findAll(): string {
      return 'Users can see all items';
    }
}
