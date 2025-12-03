import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';

import { UsersService } from './users.service';
import { UsersController } from './users.controller';
import { User } from './entities/user.entity';
import { Privilege } from './entities/privilege.entity';
import { UserPrivilege } from './entities/user-privilege.entity';

@Module({
  imports: [TypeOrmModule.forFeature([User, Privilege, UserPrivilege])],
  controllers: [UsersController],
  providers: [UsersService],
  exports: [UsersService],
})
export class UsersModule {}
