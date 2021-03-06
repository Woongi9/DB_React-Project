grant all privileges on  *.* to 'root'@'%' identified by 'mysql1234';
delete from mysql.user where host="localhost" and user="root";
flush privileges;
select host,user,plugin,authentication_string from mysql.user;

DROP DATABASE IF EXISTS `battlegrounddb` ;

CREATE DATABASE IF NOT EXISTS `battlegrounddb` 
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;

USE `battlegrounddb` ;

CREATE TABLE `weapon` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `type` VARCHAR(100) NOT NULL,
  `bullet` VARCHAR(255) NULL,
  `damage` VARCHAR(255) NULL,
  `bullet_speed` VARCHAR(255) NULL,
  `burst_speed` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;
  
CREATE TABLE `healpack` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `usage_time` VARCHAR(255) NULL,
  `recovery_amount` VARCHAR(255) NULL,
  `weight` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;
  
CREATE TABLE `booster` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `gauge` VARCHAR(100) NOT NULL,
  `usage_time` VARCHAR(255) NULL,
  `weight` VARCHAR(255) NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;  
  
CREATE TABLE `image` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `weapon_id` INT NOT NULL,
  `filename` VARCHAR(255) NOT NULL,
  `description` TEXT NULL,
  PRIMARY KEY (`id`),
  INDEX (`weapon_id`),
  FOREIGN KEY (`weapon_id`) REFERENCES `weapon` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB
  DEFAULT CHARACTER SET utf8 
  DEFAULT COLLATE utf8_general_ci;  
  
######################################

insert into weapon(id, name, type, bullet, damage, bullet_speed, burst_speed) VALUES
    (1, 'UMP9', 'SMG', '45 ACP', '39', '400m/s', '0.092sec'),
    (2, 'Micro UZI', 'SMG', '9mm', '25', '350m/s', '0.048sec'),
    (3, 'Vector', 'SMG', '9mm', '33', '300m/s', '0.0545sec'),
    (4, 'SCAR-L', 'AR', '5.56mm', '44', '870m/s', '0.096sec'),
    (5, 'M416', 'AR', '5.56mm', '44', '880m/s', '0.086sec'),
    (6, 'AKM', 'AR', '7.62mm', '49', '715m/s', '0.100sec'),
    (7, 'GROZA', 'AR', '7,62mm', '49', '720m/s', '0.080sec'),
    (8, 'Mini14', 'DMR', '5.56mm', '45', '990m/s', '0.133sec'),
    (9, 'SKS', 'DMR', '7.62mm', '57', '800m/s', '0.133sec'),
    (10, 'Kar98', 'SR', '7.62mm', '75', '760m/s', '1.900sec'),
    (11, 'AWM', 'SR', '300 ?????????', '120', '945m/s', '1.850sec'),
    (12, 'M24', 'SR', '7.62mm', '88', '790m/s', '1.800sec'),
    (13, 'Mk14', 'DMR', '7.62mm', '61', '853m/s', '0.090sec');
    
insert into healpack(id, name, usage_time, recovery_amount, weight) VALUES 
    (1, '????????? ??????', '7sec', '100%', '20 ??????'),
    (2, '?????? ??????', '6sec', '75%', '10 ??????'),
    (3, '??????', '4sec', '10%', '2 ??????');

insert into booster(id, name, gauge, usage_time, weight) VALUES 
    (1, '??????????????? ?????????', '100%', '6sec', '20 ??????'),
    (2, '?????????', '60%', '6sec', '10 ??????'),
    (3, '????????? ?????????', '40%', '4sec', '4 ??????');
    
insert into image(id, weapon_id, filename, description) VALUES
    (null, 1, 'ump9.png', '?????? ?????????'),
    (null, 2, 'uzi.png', '?????? ?????????'),
    (null, 3, 'vector.png', '?????? ?????????'),
    (null, 4, 'scar-l.png', '?????? ?????????'),
    (null, 5, 'm416.png', '?????? ?????????'),
    (null, 6, 'akm.png', 'ak ?????????'),
    (null, 7, 'groza.png', '????????? ?????????'),
    (null, 8, 'mini14.png', '?????? ?????????'),
    (null, 9, 'sks.png', '????????? ?????????'),
    (null, 10, 'kar98.png', '????????? ?????????'),
    (null, 11, 'awm.png', '?????? ?????????'),
    (null, 12, 'm24.png', 'm24 ?????????'),
    (null, 13, 'mk14.png', 'mk14 ?????????');
