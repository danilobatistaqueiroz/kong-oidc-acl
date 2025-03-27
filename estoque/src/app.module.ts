import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigurationController } from './configuration/configuration.controller';
import { DashboardController } from './dashboard/dashboard.controller';
import { HomeController } from './home/home.controller';
import { ItemsController } from './items/items.controller';
import { FaqController } from './faq/faq.controller';
import { DeliveryController } from './delivery/delivery.controller';

@Module({
  imports: [],
  controllers: [AppController, ConfigurationController, DashboardController, HomeController, ItemsController, FaqController, DeliveryController],
  providers: [AppService],
})
export class AppModule {}
