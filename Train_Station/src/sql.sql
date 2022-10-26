DROP DATABASE IF EXISTS TrainStationProject;
CREATE DATABASE IF NOT EXISTS TrainStationProject;

USE TrainStationProject;

CREATE TABLE Train(
                      trainId VARCHAR(8) NOT NULL,
                      trainName VARCHAR(30),
                      startTime VARCHAR(5),
                      EndTime VARCHAR(5),
                      trainFrom VARCHAR(14),
                      trainTo VARCHAR(14),
                      CONSTRAINT PRIMARY KEY (trainId,trainName)
);

#
CREATE TABLE Schedule(
                         id VARCHAR(9) NOT NULL,
                         Destination VARCHAR(15),
                         date DATE,
                         trainId VARCHAR(8) NOT NULL,
                         trainName VARCHAR(30),
                         CONSTRAINT PRIMARY KEY (id),
                         CONSTRAINT FOREIGN KEY(trainId,trainName) REFERENCES Train(trainId,trainName) on Delete Cascade on Update Cascade
);

CREATE TABLE Station(
                        id VARCHAR(8) NOT NULL,
                        name VARCHAR(20) NOT NULL,
                        contact VARCHAR(10),
                        CONSTRAINT PRIMARY KEY (id,name)
);

#
CREATE TABLE StationSchedule(
                                cusFrom VARCHAR(14) ,
                                cusTo VARCHAR(14),
                                trainId VARCHAR(8) NOT NULL,
                                trainName VARCHAR(30),
                                startStationTime VARCHAR(5),
                                endStationTime VARCHAR(5),
                                trainStopTime VARCHAR(5),
                                trainStartStation VARCHAR(20),
                                trainStopStation VARCHAR(20),
                                CONSTRAINT FOREIGN KEY(trainId,trainName) REFERENCES Train(trainId,trainName) on Delete Cascade on Update Cascade

);

CREATE TABLE Employee(
                         id VARCHAR(8) NOT NULL,
                         name VARCHAR(20) NOT NULL,
                         address VARCHAR(20) NOT NULL,
                         age INT,
                         contact VARCHAR(10),
                         salary DECIMAL(8,2),
                         CONSTRAINT PRIMARY KEY (id)
);

CREATE TABLE Booking(
                        id VARCHAR(8) NOT NULL,
                        name VARCHAR(20) NOT NULL,
                        address VARCHAR(20) NOT NULL,
                        contact VARCHAR(10),
                        trainFrom VARCHAR(20),
                        trainTo VARCHAR(20),
                        time VARCHAR(5),
                        train VARCHAR(20),
                        seatNo int,
                        class VARCHAR(14),
                        price DECIMAL(8,2),
                        date DATE,
                        CONSTRAINT PRIMARY KEY (id)
);

CREATE TABLE ticket(
                       ticketNo VARCHAR(8),
                       destination VARCHAR(20),
                       price DECIMAL(6, 2),
                       class VARCHAR(6),
                       date DATE,
                       CONSTRAINT PRIMARY KEY(ticketNo)
);

CREATE TABLE Admin(
                      fName VARCHAR(20) NOT NULL,
                      lName VARCHAR(20) NOT NULL,
                      address VARCHAR(20) NOT NULL,
                      contact VARCHAR(10),
                      age Int,
                      gender text,
                      userName VARCHAR(20) NOT NULL,
                      password VARCHAR(20) NOT NULL,
                      CONSTRAINT PRIMARY KEY (userName)
);

CREATE TABLE `User`(
                       fName VARCHAR(20) NOT NULL,
                       lName VARCHAR(20) NOT NULL,
                       address VARCHAR(20) NOT NULL,
                       contact VARCHAR(10),
                       age Int,
                       gender text,
                       userName VARCHAR(20) NOT NULL,
                       password VARCHAR(20) NOT NULL,
                       CONSTRAINT PRIMARY KEY (userName)
);

#
# CREATE TABLE StationDetails(
#                                stationId VARCHAR(8) NOT NULL,
#                                stationName VARCHAR(20) NOT NULL,
#                                trainId VARCHAR(8) NOT NULL,
#                                trainName VARCHAR(20) NOT NULL,
#                                time VARCHAR(5),
#                                CONSTRAINT PRIMARY KEY (stationId,trainId),
#                                CONSTRAINT FOREIGN KEY (stationId) REFERENCES Station(id)
#                                    ON DELETE CASCADE ON UPDATE CASCADE,
#                                CONSTRAINT FOREIGN KEY (trainId) REFERENCES Train(trainId)
#                                    ON DELETE CASCADE ON UPDATE CASCADE
# );

DESC Train;
DESC Schedule;
DESC Station;
DESC Employee;
DESC Booking;
DESC Admin;
DESC `User`;
DESC StationSchedule;
# DESC StationDetails;


INSERT INTO Admin VALUE('Nipuna','Piyumal','Galle','0767554903','28','Male','admin123','12345');

INSERT INTO `User` VALUE('Nipuna','Piyumal','Galle','0767554903','28','Male','user123','12345');
INSERT INTO `User` VALUE('kavidu','chamara','colombo','0767554256','25','Male','user456','12345');
INSERT INTO `User` VALUE('Shehan','Pavindu','Galle','0767545632','32','Male','user234','12345');

#--------------------------------------------------------------------------

INSERT INTO booking VALUE('C00-001','Kamal','Galle','0714525658','Galle','Colombo','14.12','Rajarata','001','3','320.00','2022/02/01');
INSERT INTO booking VALUE('C00-002','Sadun','Matara','0712565985','Matara','Colombo','02.30','Ruhunu','002','2','520.00','2022/02/01');
INSERT INTO booking VALUE('C00-003','Namal','Colombo','0712535659','Colombo','Vavuniya','03.30','RajarataManike','004','3','420.00','2022/02/01');
INSERT INTO booking VALUE('C00-004','Lahiru','Galle','0775865985','Galle','Colombo','04.30','Maya','022','1','420.00','2022/02/01');
INSERT INTO booking VALUE('C00-005','Kasun','Galle','0714525636','Galle','Colombo','05.00','ExpressTrain','055','1','460.00','2022/02/01');
INSERT INTO booking VALUE('C00-006','Nadun','Vavuniya','0714255658','Vavuniya','Yapanaya','05.30','Intercity','066','2','550.00','2022/02/01');
INSERT INTO booking VALUE('C00-007','Sadun','Kurunagala','0777525658','Kurunagala','Yapanaya','05.40','RajarataExpress','062','3','320.00','2022/02/01');
INSERT INTO booking VALUE('C00-008','Chamara','Badulla','0768525658','Colombo','Badulla','02.00','UdarataManike','027','3','300.00','2022/02/01');
INSERT INTO booking VALUE('C00-009','Supun','Panaduara','0785525658','Panaduara','Colombo','06.00','Sagarika','087','2','400.00','2022/02/01');
INSERT INTO booking VALUE('C00-010','Nalidu','Galle','0782565896','Galle','Colombo','06.45','SamudraDevi','084','2','320.00','2022/02/01');
INSERT INTO booking VALUE('C00-011','Kavidu','Colombo','0765685659','Colombo','Yapanaya','07.00','YalDevi','026','1','800.00','2022/02/01');
INSERT INTO booking VALUE('C00-012','Vimukthi','Maradana','0714585658','Maradana','Colombo','07.30','Express','047','1','320.00','2022/02/01');
INSERT INTO booking VALUE('C00-013','Sudeva','Nugegoda','0775869956','Matara','Anuradhapuara','07.45','ACInterCity','037','3','320.00','2022/02/01');
INSERT INTO booking VALUE('C00-014','Supun','Galle','0767554903','Galle','Colombo','08.00','RuhunuKumari','027','2','420.00','2022/02/01');
INSERT INTO booking VALUE('C00-015','Buddika','Matara','0752562986','Beliaththa','Mannarama','09.00','InterCity','024','3','410.00','2022/02/01');

#--------------------------------------------------------------------------

INSERT INTO ticket VALUE('t00-001','Galle','320.00','3','2002.02.03');
INSERT INTO ticket VALUE('t00-002','Matara','420.00','3','2002.02.03');
INSERT INTO ticket VALUE('t00-003','Vavuniya','330.00','3','2002.02.05');
INSERT INTO ticket VALUE('t00-004','Badulla','300.00','2','2002.02.03');
INSERT INTO ticket VALUE('t00-005','Kalithara','320.00','3','2002.01.03');
INSERT INTO ticket VALUE('t00-006','Galle','220.00','2','2002.01.03');
INSERT INTO ticket VALUE('t00-007','Panaduara','200.00','3','2002.01.03');
INSERT INTO ticket VALUE('t00-018','Galle','340.00','1','2002.01.03');
INSERT INTO ticket VALUE('t00-010','Matara','320.00','2','2002.02.04');
INSERT INTO ticket VALUE('t00-011','Colombo','420.00','2','2002.01.03');

#--------------------------------------------------------------------------

INSERT INTO employee VALUE('E00-001','Saman','Galle','30','0752562986','40000.00');
INSERT INTO employee VALUE('E00-002','Perera','Kottava','29','0767554903','50000.00');
INSERT INTO employee VALUE('E00-003','Kalum','Matara','32','0775869956','45000.00');
INSERT INTO employee VALUE('E00-004','Siripala','Mathale','28','0765685659','35000.00');
INSERT INTO employee VALUE('E00-005','Somapala','Nuwara','30','0782565896','38000.00');
INSERT INTO employee VALUE('E00-006','Nandasena','Rathnapura','36','0725562986','40000.00');
INSERT INTO employee VALUE('E00-007','Chamara','Galle','33','0752252986','42000.00');
INSERT INTO employee VALUE('E00-008','Kodithuvakku','Panadura','30','0752562568','41000.00');
INSERT INTO employee VALUE('E00-009','Senanayaka','Colombo','28','0715562986','39000.00');
INSERT INTO employee VALUE('E00-010','Amal','Galle','29','0752525786','48000.00');

#--------------------------------------------------------------------------

INSERT INTO station VALUE('S00-001','Beliaththa','0712565458');
INSERT INTO station VALUE('S00-002','Matara','0782565859');
INSERT INTO station VALUE('S00-003','Galle','0714585698');
INSERT INTO station VALUE('S00-004','Hikkaduwa','0725645859');
INSERT INTO station VALUE('S00-005','Kaluthara','0745869587');
INSERT INTO station VALUE('S00-006','Panadura','0785878154');
INSERT INTO station VALUE('S00-008','Maradana','0714512325');
INSERT INTO station VALUE('S00-009','Colombo Fort','0783629857');
INSERT INTO station VALUE('S00-010','Gampaha','0714578956');
INSERT INTO station VALUE('S00-011','Kurunagala','0772569857');
INSERT INTO station VALUE('S00-012','Polgahawela','0742536657');
INSERT INTO station VALUE('S00-013','Anuradhapuara','0742585695');
INSERT INTO station VALUE('S00-014','Medavachchiya','0752536859');
INSERT INTO station VALUE('S00-015','Vavuniya','0745869875');
INSERT INTO station VALUE('S00-016','Jaffna','0712536985');
INSERT INTO station VALUE('S00-017','Badulla','0764579851');
INSERT INTO station VALUE('S00-018','Mannar','0774585698');

#--------------------------------------------------------------------------

INSERT INTO Train VALUE('T00-001','Dakshins Intercity','02.15','05.21','Beliaththa','Maradana');
INSERT INTO Train VALUE('T00-002','Galu Kumari','05.25','09.34','Beliaththa','Maradana');
INSERT INTO Train VALUE('T00-003','Express','05.50','09.20','Beliaththa','Colombo Fort');
INSERT INTO Train VALUE('T00-004','Rajarata Manike','08.45','12.42','Beliaththa','Colombo Fort');
INSERT INTO Train VALUE('T00-005','Express','15.30','19.00','Beliaththa','Maradana');
INSERT INTO Train VALUE('T00-006','Yal Devi','08.00','18.22','Beliaththa','Anuradhaura');
INSERT INTO Train VALUE('T00-007','Express2','05.00','15.00','Beliaththa','Jaffna');
INSERT INTO Train VALUE('T00-008','Express','06.09','09.17','Colombo Fort','Beliaththa');
INSERT INTO Train VALUE('T00-009','Galu Kumari','14.34','18.28','Colombo Fort','Beliaththa');
INSERT INTO Train VALUE('T00-010','Express1','15.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO Train VALUE('T00-011','Sagarika','16.44','20.11','Colombo Fort','Beliaththa');
INSERT INTO Train VALUE('T00-012','Rajarata Rajina','13.00','18.30','Colombo Fort','Anuradhaura');
INSERT INTO Train VALUE('T00-013','Sri Devi','15.30','19.30','Colombo Fort','Anuradhaura');
INSERT INTO Train VALUE('T00-014','Sagarika','06.00','14.30','Colombo Fort','Jaffna');
INSERT INTO Train VALUE('T00-015','Intercity','15.00','22.00','Colombo Fort','Jaffna');
INSERT INTO Train VALUE('T00-016','Express3','19.00','02.00','Colombo Fort','Mannar');
INSERT INTO Train VALUE('T00-017','Podi Manike','05.00','16.00','Colombo Fort','Badulla');
INSERT INTO Train VALUE('T00-018','Denuvara','06.30','15.00','Colombo Fort','Badulla');
INSERT INTO Train VALUE('T00-019','Udarata Manike','20.30','07.30','Colombo Fort','Badulla');
INSERT INTO Train VALUE('T00-020','Sri Devi','04.14','14.00','Anuradhaura','Beliaththa');
INSERT INTO Train VALUE('T00-021','Yal Devi','09.30','14.00','Anuradhaura','Colombo Fort');
INSERT INTO Train VALUE('T00-022','Rajarata Rajina','16.40','21.00','Anuradhaura','Colombo Fort');
INSERT INTO Train VALUE('T00-023','Express','06.00','16.30','Jaffna','Beliaththa');
INSERT INTO Train VALUE('T00-024','Sagarika','12.30','20.30','Jaffna','Colombo Fort');
INSERT INTO Train VALUE('T00-025','Intercity','08.30','14.00','Jaffna','Colombo Fort');
INSERT INTO Train VALUE('T00-026','Express3','14.00','23.30','Mannar','Colombo Fort');
INSERT INTO Train VALUE('T00-027','Podi Manike','10.00','21.30','Badulla','Colombo Fort');
INSERT INTO Train VALUE('T00-028','Denuvara','04.30','17.00','Badulla','Colombo Fort');
INSERT INTO Train VALUE('T00-029','Udarata Manike','05.00','16.00','Badulla','Colombo Fort');

#--------------------------------------------------------------------------

INSERT INTO stationschedule VALUE('Beliaththa','Matara','T00-001','Dakshins Intercity','02.15','03.15','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Matara','T00-002','Galu Kumari','05.25','06.15','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Matara','T00-003','Express','05.50','07.00','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Matara','T00-004','Rajarata Manike','08.45','09.30','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Matara','T00-005','Express','15.30','16.30','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Matara','T00-006','Yal Devi','08.00','09.15','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Matara','T00-007','Express2','05.00','06.15','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Beliaththa','Galle','T00-001','Dakshins Intercity','02.15','03.45','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Galle','T00-002','Galu Kumari','05.25','07.15','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Galle','T00-003','Express','05.50','08.00','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Galle','T00-004','Rajarata Manike','08.45','10.30','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Galle','T00-005','Express','15.30','17.30','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Galle','T00-006','Yal Devi','08.00','10.15','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Galle','T00-007','Express2','05.00','07.15','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Beliaththa','Hikkaduwa','T00-001','Dakshins Intercity','02.15','03.45','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Hikkaduwa','T00-002','Galu Kumari','05.25','07.45','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Hikkaduwa','T00-003','Express','05.50','08.30','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Hikkaduwa','T00-004','Rajarata Manike','08.45','11.30','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Hikkaduwa','T00-005','Express','15.30','18.00','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Hikkaduwa','T00-006','Yal Devi','08.00','10.45','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Hikkaduwa','T00-007','Express2','05.00','07.45','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Beliaththa','Kaluthara','T00-001','Dakshins Intercity','02.15','04.15','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Kaluthara','T00-002','Galu Kumari','05.25','08.15','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Kaluthara','T00-003','Express','05.50','09.00','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Kaluthara','T00-004','Rajarata Manike','08.45','11.30','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Kaluthara','T00-005','Express','15.30','18.30','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Kaluthara','T00-006','Yal Devi','08.00','11.15','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Kaluthara','T00-007','Express2','05.00','08.15','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Beliaththa','Panadura','T00-001','Dakshins Intercity','02.15','04.45','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Panadura','T00-002','Galu Kumari','05.25','08.45','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Panadura','T00-003','Express','05.50','09.10','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Panadura','T00-004','Rajarata Manike','08.45','12.15','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Panadura','T00-005','Express','15.30','18.40','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Panadura','T00-006','Yal Devi','08.00','11.45','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Panadura','T00-007','Express2','05.00','08.45','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Beliaththa','Colombo','T00-001','Dakshins Intercity','02.15','05.00','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Colombo','T00-002','Galu Kumari','05.25','09.00','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Colombo','T00-003','Express','05.50','09.20','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Colombo','T00-004','Rajarata Manike','08.45','12.42','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Beliaththa','Colombo','T00-005','Express','15.30','18.50','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Colombo','T00-006','Yal Devi','08.00','12.00','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Colombo','T00-007','Express2','05.00','09.00','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Beliaththa','Maradana','T00-001','Dakshins Intercity','02.15','05.21','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Maradana','T00-002','Galu Kumari','05.25','09.34','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Maradana','T00-005','Express','15.30','19.00','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Beliaththa','Maradana','T00-006','Yal Devi','08.00','12.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Maradana','T00-007','Express2','05.00','09.20','15.00','Beliaththa','Jaffna');#/////////

INSERT INTO stationschedule VALUE('Beliaththa','Gampaha','T00-006','Yal Devi','08.00','14.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Gampaha','T00-007','Express2','05.00','10.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Beliaththa','Kurunagala','T00-006','Yal Devi','08.00','13.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Kurunagala','T00-007','Express2','05.00','11.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Beliaththa','Polgahawela','T00-006','Yal Devi','08.00','15.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Polgahawela','T00-007','Express2','05.00','12.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Beliaththa','Anuradhapuara','T00-006','Yal Devi','08.00','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Beliaththa','Anuradhapuara','T00-007','Express2','05.00','13.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Beliaththa','Medavachchiya','T00-007','Express2','05.00','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Beliaththa','Vavuniya','T00-007','Express2','05.00','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Beliaththa','Jaffna','T00-007','Express2','05.00','15.00','15.00','Beliaththa','Jaffna');

#............................................................................

INSERT INTO stationschedule VALUE('Matara','Galle','T00-001','Dakshins Intercity','03.15','03.45','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Galle','T00-002','Galu Kumari','06.15','07.15','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Galle','T00-003','Express','07.00','08.00','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Matara','Galle','T00-004','Rajarata Manike','09.30','10.30','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Matara','Galle','T00-005','Express','16.30','17.30','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Galle','T00-006','Yal Devi','09.15','10.15','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Matara','Galle','T00-007','Express2','06.15','07.15','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Matara','Hikkaduwa','T00-001','Dakshins Intercity','03.15','03.45','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Hikkaduwa','T00-002','Galu Kumari','06.15','07.45','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Hikkaduwa','T00-003','Express','07.00','08.30','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Matara','Hikkaduwa','T00-004','Rajarata Manike','09.30','11.30','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Matara','Hikkaduwa','T00-005','Express','16.30','18.00','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Hikkaduwa','T00-006','Yal Devi','09.15','10.45','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Matara','Hikkaduwa','T00-007','Express2','06.15','07.45','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Matara','Kaluthara','T00-001','Dakshins Intercity','03.15','04.15','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Kaluthara','T00-002','Galu Kumari','06.15','08.15','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Kaluthara','T00-003','Express','07.00','09.00','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Matara','Kaluthara','T00-004','Rajarata Manike','09.30','11.30','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Matara','Kaluthara','T00-005','Express','16.30','18.30','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Kaluthara','T00-006','Yal Devi','09.15','11.15','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Matara','Kaluthara','T00-007','Express2','06.15','08.15','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Matara','Panadura','T00-001','Dakshins Intercity','03.15','04.45','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Panadura','T00-002','Galu Kumari','06.15','08.45','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Panadura','T00-003','Express','07.00','09.10','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Matara','Panadura','T00-004','Rajarata Manike','09.30','12.15','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Matara','Panadura','T00-005','Express','16.30','18.40','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Panadura','T00-006','Yal Devi','09.15','11.45','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Matara','Panadura','T00-007','Express2','06.15','08.45','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Matara','Colombo','T00-001','Dakshins Intercity','03.15','05.00','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Colombo','T00-002','Galu Kumari','06.15','09.00','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Colombo','T00-003','Express','07.00','09.20','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Matara','Colombo','T00-004','Rajarata Manike','09.30','12.42','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Matara','Colombo','T00-005','Express','16.30','18.50','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Colombo','T00-006','Yal Devi','09.15','12.00','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Matara','Colombo','T00-007','Express2','06.15','09.00','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Matara','Maradana','T00-001','Dakshins Intercity','03.15','05.21','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Maradana','T00-002','Galu Kumari','06.15','09.34','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Maradana','T00-005','Express','16.30','19.00','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Matara','Maradana','T00-006','Yal Devi','09.15','12.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Matara','Maradana','T00-007','Express2','06.15','09.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Matara','Gampaha','T00-006','Yal Devi','09.15','14.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Matara','Gampaha','T00-007','Express2','06.15','10.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Matara','Kurunagala','T00-006','Yal Devi','09.15','13.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Matara','Kurunagala','T00-007','Express2','06.15','11.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Matara','Polgahawela','T00-006','Yal Devi','09.15','15.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Matara','Polgahawela','T00-007','Express2','06.15','12.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Matara','Anuradhapuara','T00-006','Yal Devi','09.15','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Matara','Anuradhapuara','T00-007','Express2','06.15','13.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Matara','Medavachchiya','T00-007','Express2','06.15','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Matara','Vavuniya','T00-007','Express2','06.15','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Matara','Jaffna','T00-007','Express2','06.15','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Galle','Hikkaduwa','T00-001','Dakshins Intercity','03.45','04.00','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Hikkaduwa','T00-002','Galu Kumari','07.15','07.45','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Hikkaduwa','T00-003','Express','08.00','08.30','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Galle','Hikkaduwa','T00-004','Rajarata Manike','10.30','11.30','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Galle','Hikkaduwa','T00-005','Express','17.30','18.00','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Hikkaduwa','T00-006','Yal Devi','10.15','10.45','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Galle','Hikkaduwa','T00-007','Express2','07.15','07.45','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Galle','Kaluthara','T00-001','Dakshins Intercity','03.45','04.15','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Kaluthara','T00-002','Galu Kumari','07.15','08.15','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Kaluthara','T00-003','Express','08.00','09.00','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Galle','Kaluthara','T00-004','Rajarata Manike','10.30','11.30','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Galle','Kaluthara','T00-005','Express','17.30','18.30','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Kaluthara','T00-006','Yal Devi','10.15','11.15','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Galle','Kaluthara','T00-007','Express2','07.15','08.15','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Galle','Panadura','T00-001','Dakshins Intercity','03.45','04.45','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Panadura','T00-002','Galu Kumari','07.15','08.45','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Panadura','T00-003','Express','08.00','09.10','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Galle','Panadura','T00-004','Rajarata Manike','10.30','12.15','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Galle','Panadura','T00-005','Express','17.30','18.40','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Panadura','T00-006','Yal Devi','10.15','11.45','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Galle','Panadura','T00-007','Express2','07.15','08.45','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Galle','Colombo','T00-001','Dakshins Intercity','03.45','05.00','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Colombo','T00-002','Galu Kumari','07.15','09.00','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Colombo','T00-003','Express','08.00','09.20','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Galle','Colombo','T00-004','Rajarata Manike','10.30','12.42','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Galle','Colombo','T00-005','Express','17.30','18.50','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Colombo','T00-006','Yal Devi','10.15','12.00','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Galle','Colombo','T00-007','Express2','07.15','09.00','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Galle','Maradana','T00-001','Dakshins Intercity','03.45','05.21','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Maradana','T00-002','Galu Kumari','07.15','09.34','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Maradana','T00-005','Express','17.30','19.00','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Galle','Maradana','T00-006','Yal Devi','10.15','12.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Galle','Maradana','T00-007','Express2','07.15','09.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Galle','Gampaha','T00-006','Yal Devi','10.15','14.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Galle','Gampaha','T00-007','Express2','07.15','10.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Galle','Kurunagala','T00-006','Yal Devi','10.15','13.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Galle','Kurunagala','T00-007','Express2','07.15','11.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Galle','Polgahawela','T00-006','Yal Devi','10.15','15.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Galle','Polgahawela','T00-007','Express2','07.15','12.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Galle','Anuradhapuara','T00-006','Yal Devi','10.15','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Galle','Anuradhapuara','T00-007','Express2','07.15','13.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Galle','Medavachchiya','T00-007','Express2','07.15','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Galle','Vavuniya','T00-007','Express2','07.15','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Galle','Jaffna','T00-007','Express2','07.15','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Hikkaduwa','Kaluthara','T00-001','Dakshins Intercity','04.00','04.15','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Kaluthara','T00-002','Galu Kumari','07.45','08.15','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Kaluthara','T00-003','Express','08.30','09.00','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Hikkaduwa','Kaluthara','T00-004','Rajarata Manike','11.30','12.00','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Hikkaduwa','Kaluthara','T00-005','Express','18.00','18.30','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Kaluthara','T00-006','Yal Devi','10.15','11.15','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Hikkaduwa','Kaluthara','T00-007','Express2','07.45','08.15','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Hikkaduwa','Panadura','T00-001','Dakshins Intercity','04.00','04.45','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Panadura','T00-002','Galu Kumari','07.45','08.45','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Panadura','T00-003','Express','08.30','09.10','09.20','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Panadura','T00-004','Rajarata Manike','11.30','12.15','12.42','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Panadura','T00-005','Express','18.00','18.40','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Panadura','T00-006','Yal Devi','10.45','11.45','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Hikkaduwa','Panadura','T00-007','Express2','07.45','08.45','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Hikkaduwa','Colombo','T00-001','Dakshins Intercity','04.00','05.00','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Colombo','T00-002','Galu Kumari','07.45','09.00','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Colombo','T00-003','Express','08.30','09.20','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Hikkaduwa','Colombo','T00-004','Rajarata Manike','11.30','12.42','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Hikkaduwa','Colombo','T00-005','Express','18.00','18.50','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Colombo','T00-006','Yal Devi','10.45','12.00','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Hikkaduwa','Colombo','T00-007','Express2','07.45','09.00','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Hikkaduwa','Maradana','T00-001','Dakshins Intercity','04.00','05.21','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Maradana','T00-002','Galu Kumari','07.45','09.34','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Maradana','T00-005','Express','18.00','19.00','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Hikkaduwa','Maradana','T00-006','Yal Devi','10.45','12.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Hikkaduwa','Maradana','T00-007','Express2','07.45','09.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Hikkaduwa','Gampaha','T00-006','Yal Devi','10.45','14.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Hikkaduwa','Gampaha','T00-007','Express2','07.45','10.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Hikkaduwa','Kurunagala','T00-006','Yal Devi','10.45','13.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Hikkaduwa','Kurunagala','T00-007','Express2','07.45','11.20','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Hikkaduwa','Polgahawela','T00-006','Yal Devi','10.45','15.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Hikkaduwa','Polgahawela','T00-007','Express2','07.45','12.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Hikkaduwa','Anuradhapuara','T00-006','Yal Devi','10.45','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Hikkaduwa','Anuradhapuara','T00-007','Express2','07.45','13.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Hikkaduwa','Medavachchiya','T00-007','Express2','07.45','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Hikkaduwa','Vavuniya','T00-007','Express2','07.45','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Hikkaduwa','Jaffna','T00-007','Express2','07.45','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Kaluthara','Panadura','T00-001','Dakshins Intercity','04.15','04.45','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Panadura','T00-002','Galu Kumari','08.15','08.45','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Panadura','T00-003','Express','09.00','09.10','09.20','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Panadura','T00-004','Rajarata Manike','12.00','12.15','12.42','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Panadura','T00-005','Express','18.30','18.40','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Panadura','T00-006','Yal Devi','11.15','11.45','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Kaluthara','Panadura','T00-007','Express2','08.15','08.45','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Kaluthara','Colombo','T00-001','Dakshins Intercity','04.15','05.00','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Colombo','T00-002','Galu Kumari','08.15','09.00','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Colombo','T00-003','Express','09.00','09.20','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Kaluthara','Colombo','T00-004','Rajarata Manike','12.00','12.42','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Kaluthara','Colombo','T00-005','Express','18.30','18.50','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Colombo','T00-006','Yal Devi','11.15','12.00','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Kaluthara','Colombo','T00-007','Express2','08.15','09.00','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Kaluthara','Maradana','T00-001','Dakshins Intercity','04.15','05.21','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Maradana','T00-002','Galu Kumari','08.15','09.34','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Maradana','T00-005','Express','18.30','19.00','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Kaluthara','Maradana','T00-006','Yal Devi','11.15','12.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Kaluthara','Maradana','T00-007','Express2','08.15','09.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Kaluthara','Gampaha','T00-006','Yal Devi','11.15','14.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Kaluthara','Gampaha','T00-007','Express2','08.15','10.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Kaluthara','Kurunagala','T00-006','Yal Devi','11.15','13.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Kaluthara','Kurunagala','T00-007','Express2','08.15','11.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Kaluthara','Polgahawela','T00-006','Yal Devi','11.15','15.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Kaluthara','Polgahawela','T00-007','Express2','08.15','12.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Kaluthara','Anuradhapuara','T00-006','Yal Devi','11.15','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Kaluthara','Anuradhapuara','T00-007','Express2','08.15','13.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Kaluthara','Medavachchiya','T00-007','Express2','08.15','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Kaluthara','Vavuniya','T00-007','Express2','08.15','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Kaluthara','Jaffna','T00-007','Express2','08.15','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Panadura','Colombo','T00-001','Dakshins Intercity','04.45','05.00','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Panadura','Colombo','T00-002','Galu Kumari','08.45','09.00','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Panadura','Colombo','T00-003','Express','09.10','09.20','09.20','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Panadura','Colombo','T00-004','Rajarata Manike','12.15','12.42','12.42','Beliaththa','Colombo Fort');
INSERT INTO stationschedule VALUE('Panadura','Colombo','T00-005','Express','18.40','18.50','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Panadura','Colombo','T00-006','Yal Devi','11.45','12.00','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Panadura','Colombo','T00-007','Express2','08.45','09.00','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Panadura','Maradana','T00-001','Dakshins Intercity','04.45','05.21','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Panadura','Maradana','T00-002','Galu Kumari','08.45','09.34','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Panadura','Maradana','T00-005','Express','18.40','19.00','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Panadura','Maradana','T00-006','Yal Devi','11.45','12.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Panadura','Maradana','T00-007','Express2','08.45','09.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Panadura','Gampaha','T00-006','Yal Devi','11.15','14.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Panadura','Gampaha','T00-007','Express2','08.45','10.20','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Panadura','Kurunagala','T00-006','Yal Devi','11.45','13.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Panadura','Kurunagala','T00-007','Express2','08.45','11.20','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Panadura','Polgahawela','T00-006','Yal Devi','11.45','15.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Panadura','Polgahawela','T00-007','Express2','08.45','12.20','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Panadura','Anuradhapuara','T00-006','Yal Devi','11.45','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Panadura','Anuradhapuara','T00-007','Express2','08.45','13.20','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Panadura','Medavachchiya','T00-007','Express2','08.45','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Panadura','Vavuniya','T00-007','Express2','08.45','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Panadura','Jaffna','T00-007','Express2','08.45','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Colombo','Maradana','T00-001','Dakshins Intercity','05.00','05.21','05.21','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Colombo','Maradana','T00-002','Galu Kumari','09.00','09.34','09.34','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Colombo','Maradana','T00-005','Express','18.50','19.00','19.00','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Colombo','Maradana','T00-006','Yal Devi','12.00','12.20','18.22','Beliaththa','Maradana');
INSERT INTO stationschedule VALUE('Colombo','Maradana','T00-007','Express2','09.00','09.20','15.00','Beliaththa','Maradana');

INSERT INTO stationschedule VALUE('Colombo','Gampaha','T00-006','Yal Devi','12.00','14.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo','Gampaha','T00-007','Express2','09.00','10.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Colombo','Kurunagala','T00-006','Yal Devi','12.00','13.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo','Kurunagala','T00-007','Express2','09.00','11.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Colombo','Polgahawela','T00-006','Yal Devi','12.00','15.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo','Polgahawela','T00-007','Express2','09.00','12.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Colombo','Anuradhapuara','T00-006','Yal Devi','12.00','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo','Anuradhapuara','T00-007','Express2','09.00','13.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Colombo','Medavachchiya','T00-007','Express2','09.00','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Colombo','Vavuniya','T00-007','Express2','09.00','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Colombo','Jaffna','T00-007','Express2','09.00','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Maradana','Gampaha','T00-006','Yal Devi','12.20','10.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Maradana','Gampaha','T00-007','Express2','09.20','10.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Maradana','Kurunagala','T00-006','Yal Devi','12.20','13.20','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Maradana','Kurunagala','T00-007','Express2','09.20','11.20','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Maradana','Polgahawela','T00-006','Yal Devi','12.20','15.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Maradana','Polgahawela','T00-007','Express2','09.20','12.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Maradana','Anuradhapuara','T00-006','Yal Devi','12.20','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Maradana','Anuradhapuara','T00-007','Express2','09.20','13.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Maradana','Medavachchiya','T00-007','Express2','09.20','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Maradana','Vavuniya','T00-007','Express2','09.20','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Maradana','Jaffna','T00-007','Express2','09.20','15.00','15.00','Beliaththa','Jaffna');

#........................................................................................
INSERT INTO stationschedule VALUE('Gampaha','Kurunagala','T00-006','Yal Devi','14.30','15.00','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Gampaha','Kurunagala','T00-007','Express2','10.20','11.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Gampaha','Polgahawela','T00-006','Yal Devi','14.30','15.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Gampaha','Polgahawela','T00-007','Express2','10.20','12.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Gampaha','Anuradhapuara','T00-006','Yal Devi','14.30','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Gampaha','Anuradhapuara','T00-007','Express2','10.20','13.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Gampaha','Medavachchiya','T00-007','Express2','10.20','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Gampaha','Vavuniya','T00-007','Express2','10.20','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Gampaha','Jaffna','T00-007','Express2','10.20','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Kurunagala','Polgahawela','T00-006','Yal Devi','15.00','15.30','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Kurunagala','Polgahawela','T00-007','Express2','11.20','12.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Kurunagala','Anuradhapuara','T00-006','Yal Devi','15.30','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Kurunagala','Anuradhapuara','T00-007','Express2','11.20','13.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Kurunagala','Medavachchiya','T00-007','Express2','11.20','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Kurunagala','Vavuniya','T00-007','Express2','11.20','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Kurunagala','Jaffna','T00-007','Express2','11.20','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Polgahawela','Anuradhapuara','T00-006','Yal Devi','15.30','18.22','18.22','Beliaththa','Anuradhaura');
INSERT INTO stationschedule VALUE('Polgahawela','Anuradhapuara','T00-007','Express2','12.20','13.20','15.00','Beliaththa','Jaffna');

INSERT INTO stationschedule VALUE('Polgahawela','Medavachchiya','T00-007','Express2','12.20','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Polgahawela','Vavuniya','T00-007','Express2','12.20','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Polgahawela','Jaffna','T00-007','Express2','12.20','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Anuradhapuara','Medavachchiya','T00-007','Express2','13.20','13.30','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Anuradhapuara','Vavuniya','T00-007','Express2','13.20','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Anuradhapuara','Jaffna','T00-007','Express2','13.20','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Medavachchiya','Vavuniya','T00-007','Express2','13.30','13.40','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Medavachchiya','Jaffna','T00-007','Express2','13.30','15.00','15.00','Beliaththa','Jaffna');
INSERT INTO stationschedule VALUE('Vavuniya','Jaffna','T00-007','Express2','13.40','15.00','15.00','Beliaththa','Jaffna');

#.........................................................................................
#.........................................................................................

INSERT INTO stationschedule VALUE('Colombo Fort','Panadura','T00-008','Express','06.00','06.40','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Panadura','T00-009','Galu Kumari','14.34','15.00','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Panadura','T00-010','Express1','15.00','15.20','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Panadura','T00-011','Sagarika','16.44','17.00','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Kaluthara','T00-008','Express','06.00','07.00','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Kaluthara','T00-009','Galu Kumari','14.34','15.30','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Kaluthara','T00-010','Express1','15.00','15.40','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Kaluthara','T00-011','Sagarika','16.44','17.20','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Hikkaduwa','T00-008','Express','06.00','07.20','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Hikkaduwa','T00-009','Galu Kumari','14.34','16.00','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Hikkaduwa','T00-010','Express1','15.00','16.10','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Hikkaduwa','T00-011','Sagarika','16.44','17.40','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Galle','T00-008','Express','06.00','07.40','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Galle','T00-009','Galu Kumari','14.34','16.30','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Galle','T00-010','Express1','15.00','16.40','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Galle','T00-011','Sagarika','16.44','18.00','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Matara','T00-008','Express','06.00','08.30','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Matara','T00-009','Galu Kumari','14.34','17.00','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Matara','T00-010','Express1','15.00','17.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Matara','T00-011','Sagarika','16.44','18.30','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Beliaththa','T00-008','Express','06.00','09.17','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Beliaththa','T00-009','Galu Kumari','14.34','18.28','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Beliaththa','T00-010','Express1','15.00','18.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Beliaththa','T00-011','Sagarika','16.44','20.11','20.11','Colombo Fort','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Panadura','Kaluthara','T00-008','Express','06.40','07.00','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Kaluthara','T00-009','Galu Kumari','15.00','15.30','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Kaluthara','T00-010','Express1','15.20','15.40','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Kaluthara','T00-011','Sagarika','17.00','17.20','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Panadura','Hikkaduwa','T00-008','Express','06.40','07.20','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Hikkaduwa','T00-009','Galu Kumari','15.00','16.00','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Hikkaduwa','T00-010','Express1','15.20','16.10','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Hikkaduwa','T00-011','Sagarika','17.00','17.40','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Panadura','Galle','T00-008','Express','06.40','07.40','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Galle','T00-009','Galu Kumari','15.00','16.30','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Galle','T00-010','Express1','15.20','16.40','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Galle','T00-011','Sagarika','17.00','18.00','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Panadura','Matara','T00-008','Express','06.40','08.30','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Matara','T00-009','Galu Kumari','15.00','17.00','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Matara','T00-010','Express1','15.20','17.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Matara','T00-011','Sagarika','17.00','18.30','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Panadura','Beliaththa','T00-008','Express','06.40','09.17','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Beliaththa','T00-009','Galu Kumari','15.00','18.28','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Beliaththa','T00-010','Express1','15.20','18.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Beliaththa','T00-011','Sagarika','17.00','20.11','20.11','Colombo Fort','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Kaluthara','Hikkaduwa','T00-008','Express','07.00','07.20','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Hikkaduwa','T00-009','Galu Kumari','15.30','16.00','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Hikkaduwa','T00-010','Express1','15.40','16.10','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Hikkaduwa','T00-011','Sagarika','17.20','17.40','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Kaluthara','Galle','T00-008','Express','07.00','07.40','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Galle','T00-009','Galu Kumari','15.30','16.30','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Galle','T00-010','Express1','15.40','16.40','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Galle','T00-011','Sagarika','17.20','18.00','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Kaluthara','Matara','T00-008','Express','07.00','08.30','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Matara','T00-009','Galu Kumari','15.30','17.00','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Matara','T00-010','Express1','15.40','17.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Matara','T00-011','Sagarika','17.20','18.30','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Kaluthara','Beliaththa','T00-008','Express','07.00','09.17','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Beliaththa','T00-009','Galu Kumari','15.30','18.28','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Beliaththa','T00-010','Express1','15.40','18.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Beliaththa','T00-011','Sagarika','17.20','20.11','20.11','Colombo Fort','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Hikkaduwa','Galle','T00-008','Express','07.20','07.40','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Galle','T00-009','Galu Kumari','16.00','16.30','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Galle','T00-010','Express1','16.10','16.40','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Galle','T00-011','Sagarika','17.40','18.00','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Hikkaduwa','Matara','T00-008','Express','07.20','08.30','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Matara','T00-009','Galu Kumari','16.00','17.00','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Matara','T00-010','Express1','16.10','17.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Matara','T00-011','Sagarika','17.40','18.30','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Hikkaduwa','Beliaththa','T00-008','Express','07.20','09.17','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Beliaththa','T00-009','Galu Kumari','16.00','18.28','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Beliaththa','T00-010','Express1','16.10','18.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Beliaththa','T00-011','Sagarika','17.40','20.11','20.11','Colombo Fort','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Galle','Matara','T00-008','Express','07.40','08.30','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Galle','Matara','T00-009','Galu Kumari','16.30','17.00','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Galle','Matara','T00-010','Express1','16.40','17.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Galle','Matara','T00-011','Sagarika','18.00','18.30','20.11','Colombo Fort','Beliaththa');

INSERT INTO stationschedule VALUE('Galle','Beliaththa','T00-008','Express','07.40','09.17','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Galle','Beliaththa','T00-009','Galu Kumari','16.30','18.28','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Galle','Beliaththa','T00-010','Express1','16.40','18.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Galle','Beliaththa','T00-011','Sagarika','18.00','20.11','20.11','Colombo Fort','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Matara','Beliaththa','T00-008','Express','08.30','09.17','09.17','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Matara','Beliaththa','T00-009','Galu Kumari','17.00','18.28','18.28','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Matara','Beliaththa','T00-010','Express1','17.00','18.00','18.00','Colombo Fort','Beliaththa');
INSERT INTO stationschedule VALUE('Matara','Beliaththa','T00-011','Sagarika','18.30','20.11','20.11','Colombo Fort','Beliaththa');

#.........................................................................................
#.........................................................................................

INSERT INTO stationschedule VALUE('Colombo Fort','Gampaha','T00-012','Rajarata Rajina','13.00','13.17','18.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo Fort','Gampaha','T00-013','Sri Devi','15.30','16.00','19.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo Fort','Gampaha','T00-014','Sagarika','06.00','06.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Colombo Fort','Gampaha','T00-015','Intercity','15.00','15.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Colombo Fort','Kurunagala','T00-012','Rajarata Rajina','13.00','15.00','18.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo Fort','Kurunagala','T00-013','Sri Devi','15.30','17.30','19.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo Fort','Kurunagala','T00-014','Sagarika','06.00','06.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Colombo Fort','Kurunagala','T00-015','Intercity','15.00','16.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Colombo Fort','Polgahawela','T00-012','Rajarata Rajina','13.00','16.30','18.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo Fort','Polgahawela','T00-013','Sri Devi','15.30','18.30','19.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo Fort','Polgahawela','T00-014','Sagarika','06.00','09.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Colombo Fort','Polgahawela','T00-015','Intercity','15.00','17.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Colombo Fort','Anuradhapuara','T00-012','Rajarata Rajina','13.00','18.30','18.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo Fort','Anuradhapuara','T00-013','Sri Devi','15.30','19.30','19.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Colombo Fort','Anuradhapuara','T00-014','Sagarika','06.00','10.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Colombo Fort','Anuradhapuara','T00-015','Intercity','15.00','18.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Colombo Fort','Medavachchiya','T00-014','Sagarika','06.00','11.00','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Colombo Fort','Medavachchiya','T00-015','Intercity','15.00','19.00','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Colombo Fort','Vavuniya','T00-014','Sagarika','06.00','12.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Colombo Fort','Vavuniya','T00-015','Intercity','15.00','20.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Colombo Fort','Jaffna','T00-014','Sagarika','06.00','14.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Colombo Fort','Jaffna','T00-015','Intercity','15.00','22.00','22.00','Colombo Fort','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Gampaha','Kurunagala','T00-012','Rajarata Rajina','13.17','15.00','18.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Gampaha','Kurunagala','T00-013','Sri Devi','16.00','17.30','19.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Gampaha','Kurunagala','T00-014','Sagarika','06.30','08.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Gampaha','Kurunagala','T00-015','Intercity','15.00','16.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Gampaha','Polgahawela','T00-012','Rajarata Rajina','13.17','16.30','18.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Gampaha','Polgahawela','T00-013','Sri Devi','16.00','18.30','19.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Gampaha','Polgahawela','T00-014','Sagarika','06.30','09.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Gampaha','Polgahawela','T00-015','Intercity','15.00','17.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Gampaha','Anuradhapuara','T00-012','Rajarata Rajina','13.17','18.30','18.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Gampaha','Anuradhapuara','T00-013','Sri Devi','16.00','19.30','19.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Gampaha','Anuradhapuara','T00-014','Sagarika','06.30','10.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Gampaha','Anuradhapuara','T00-015','Intercity','15.00','18.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Gampaha','Medavachchiya','T00-014','Sagarika','06.30','11.00','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Gampaha','Medavachchiya','T00-015','Intercity','15.00','19.00','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Gampaha','Vavuniya','T00-014','Sagarika','06.30','12.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Gampaha','Vavuniya','T00-015','Intercity','15.00','20.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Gampaha','Jaffna','T00-014','Sagarika','06.30','14.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Gampaha','Jaffna','T00-015','Intercity','15.00','22.00','22.00','Colombo Fort','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Kurunagala','Polgahawela','T00-012','Rajarata Rajina','15.00','16.30','18.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Kurunagala','Polgahawela','T00-013','Sri Devi','17.30','18.30','19.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Kurunagala','Polgahawela','T00-014','Sagarika','08.30','09.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Kurunagala','Polgahawela','T00-015','Intercity','16.30','17.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Kurunagala','Anuradhapuara','T00-012','Rajarata Rajina','15.00','18.30','18.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Kurunagala','Anuradhapuara','T00-013','Sri Devi','17.30','19.30','19.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Kurunagala','Anuradhapuara','T00-014','Sagarika','08.30','10.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Kurunagala','Anuradhapuara','T00-015','Intercity','16.30','18.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Kurunagala','Medavachchiya','T00-014','Sagarika','08.30','11.00','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Kurunagala','Medavachchiya','T00-015','Intercity','16.30','19.00','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Kurunagala','Vavuniya','T00-014','Sagarika','08.30','12.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Kurunagala','Vavuniya','T00-015','Intercity','16.30','20.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Kurunagala','Jaffna','T00-014','Sagarika','08.30','14.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Kurunagala','Jaffna','T00-015','Intercity','16.30','22.00','22.00','Colombo Fort','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Polgahawela','Anuradhapuara','T00-012','Rajarata Rajina','16.30','18.30','18.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Polgahawela','Anuradhapuara','T00-013','Sri Devi','18.30','19.30','19.30','Colombo Fort','Anuradhaura');
INSERT INTO stationschedule VALUE('Polgahawela','Anuradhapuara','T00-014','Sagarika','09.30','10.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Polgahawela','Anuradhapuara','T00-015','Intercity','17.30','18.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Polgahawela','Medavachchiya','T00-014','Sagarika','09.30','11.00','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Polgahawela','Medavachchiya','T00-015','Intercity','17.30','19.00','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Polgahawela','Vavuniya','T00-014','Sagarika','09.30','12.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Polgahawela','Vavuniya','T00-015','Intercity','17.30','20.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Polgahawela','Jaffna','T00-014','Sagarika','09.30','14.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Polgahawela','Jaffna','T00-015','Intercity','17.30','22.00','22.00','Colombo Fort','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Anuradhapuara','Medavachchiya','T00-014','Sagarika','10.30','11.00','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Anuradhapuara','Medavachchiya','T00-015','Intercity','17.30','19.00','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Anuradhapuara','Vavuniya','T00-014','Sagarika','10.30','12.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Anuradhapuara','Vavuniya','T00-015','Intercity','17.30','20.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Anuradhapuara','Jaffna','T00-014','Sagarika','10.30','14.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Anuradhapuara','Jaffna','T00-015','Intercity','20.30','22.00','22.00','Colombo Fort','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Medavachchiya','Vavuniya','T00-014','Sagarika','11.00','12.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Medavachchiya','Vavuniya','T00-015','Intercity','19.00','20.30','22.00','Colombo Fort','Jaffna');

INSERT INTO stationschedule VALUE('Medavachchiya','Jaffna','T00-014','Sagarika','11.00','12.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Medavachchiya','Jaffna','T00-015','Intercity','19.00','20.30','22.00','Colombo Fort','Jaffna');

#.........................................................................................

INSERT INTO stationschedule VALUE('Vavuniya','Jaffna','T00-014','Sagarika','12.30','14.30','14.30','Colombo Fort','Jaffna');
INSERT INTO stationschedule VALUE('Vavuniya','Jaffna','T00-015','Intercity','20.30','22.00','22.00','Colombo Fort','Jaffna');

#.........................................................................................
#.........................................................................................

INSERT INTO stationschedule VALUE('Colombo Fort','Gampaha','T00-016','Express3','19.00','20.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Colombo Fort','Kurunagala','T00-016','Express3','19.00','21.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Colombo Fort','Polgahawela','T00-016','Express3','19.00','22.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Colombo Fort','Anuradhapuara','T00-016','Express3','19.00','23.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Colombo Fort','Vavuniya','T00-016','Express3','19.00','24.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Colombo Fort','Mannar','T00-016','Express3','19.00','02.00','02.00','Colombo Fort','Mannar');

INSERT INTO stationschedule VALUE('Gampaha','Kurunagala','T00-016','Express3','20.00','21.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Gampaha','Polgahawela','T00-016','Express3','20.00','22.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Gampaha','Anuradhapuara','T00-016','Express3','20.00','23.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Gampaha','Vavuniya','T00-016','Express3','20.00','24.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Gampaha','Mannar','T00-016','Express3','20.00','02.00','02.00','Colombo Fort','Mannar');

INSERT INTO stationschedule VALUE('Kurunagala','Polgahawela','T00-016','Express3','21.00','22.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Kurunagala','Anuradhapuara','T00-016','Express3','21.00','23.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Kurunagala','Vavuniya','T00-016','Express3','21.00','24.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Kurunagala','Mannar','T00-016','Express3','21.00','02.00','02.00','Colombo Fort','Mannar');

INSERT INTO stationschedule VALUE('Polgahawela','Anuradhapuara','T00-016','Express3','22.00','23.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Polgahawela','Vavuniya','T00-016','Express3','22.00','24.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Polgahawela','Mannar','T00-016','Express3','22.00','02.00','02.00','Colombo Fort','Mannar');

INSERT INTO stationschedule VALUE('Anuradhapuara','Vavuniya','T00-016','Express3','23.00','24.00','02.00','Colombo Fort','Mannar');
INSERT INTO stationschedule VALUE('Anuradhapuara','Mannar','T00-016','Express3','23.00','02.00','02.00','Colombo Fort','Mannar');

INSERT INTO stationschedule VALUE('Vavuniya','Mannar','T00-016','Express3','24.00','02.00','02.00','Colombo Fort','Mannar');
#.........................................................................................
#........................................................................................

INSERT INTO stationschedule VALUE('Anuradhaura','Polgahawela','T00-020','Sri Devi','04.14','05.00','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhaura','Polgahawela','T00-021','Yal Devi','09.30','10.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhaura','Polgahawela','T00-022','Rajarata Rajina','16.40','18.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Anuradhaura','Kurunagala','T00-020','Sri Devi','04.14','06.00','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhaura','Kurunagala','T00-021','Yal Devi','09.30','11.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhaura','Kurunagala','T00-022','Rajarata Rajina','16.40','19.00','21.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhaura','Gampaha','T00-020','Sri Devi','04.14','07.00','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhaura','Gampaha','T00-021','Yal Devi','09.30','12.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhaura','Gampaha','T00-022','Rajarata Rajina','16.40','20.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Anuradhaura','Colombo Fort','T00-020','Sri Devi','04.14','07.30','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhaura','Colombo Fort','T00-021','Yal Devi','09.30','14.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhaura','Colombo Fort','T00-022','Rajarata Rajina','16.40','21.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Anuradhaura','Maradana','T00-020','Sri Devi','04.14','08.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Anuradhaura','Panadura','T00-020','Sri Devi','04.14','09.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Anuradhaura','Kaluthara','T00-020','Sri Devi','04.14','10.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Anuradhaura','Hikkaduwa','T00-020','Sri Devi','04.14','11.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Anuradhaura','Galle','T00-020','Sri Devi','04.14','12.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Anuradhaura','Matara','T00-020','Sri Devi','04.14','13.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Anuradhaura','Beliaththa','T00-020','Sri Devi','04.14','14.00','14.00','Anuradhaura','Beliaththa');

# #.........................................................................................

INSERT INTO stationschedule VALUE('Polgahawela','Kurunagala','T00-020','Sri Devi','05.00','06.00','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Kurunagala','T00-021','Yal Devi','10.00','11.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Polgahawela','Kurunagala','T00-022','Rajarata Rajina','18.00','19.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Polgahawela','Gampaha','T00-020','Sri Devi','05.00','07.00','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Gampaha','T00-021','Yal Devi','10.00','12.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhaura','Gampaha','T00-022','Rajarata Rajina','18.00','20.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Polgahawela','Colombo Fort','T00-020','Sri Devi','05.00','07.30','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Colombo Fort','T00-021','Yal Devi','10.00','14.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Polgahawela','Colombo Fort','T00-022','Rajarata Rajina','18.00','21.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Polgahawela','Maradana','T00-020','Sri Devi','05.00','08.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Polgahawela','Panadura','T00-020','Sri Devi','05.00','09.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Polgahawela','Kaluthara','T00-020','Sri Devi','05.00','10.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Polgahawela','Hikkaduwa','T00-020','Sri Devi','05.00','11.00','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Galle','T00-020','Sri Devi','05.00','12.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Polgahawela','Matara','T00-020','Sri Devi','05.00','13.00','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Beliaththa','T00-020','Sri Devi','05.00','14.00','14.00','Anuradhaura','Beliaththa');

# #.........................................................................................

INSERT INTO stationschedule VALUE('Polgahawela','Kurunagala','T00-020','Sri Devi','05.00','06.00','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Kurunagala','T00-021','Yal Devi','10.00','11.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Polgahawela','Kurunagala','T00-022','Rajarata Rajina','18.00','19.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Polgahawela','Gampaha','T00-020','Sri Devi','05.00','07.00','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Gampaha','T00-021','Yal Devi','10.00','12.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhaura','Gampaha','T00-022','Rajarata Rajina','18.00','20.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Polgahawela','Colombo Fort','T00-020','Sri Devi','05.00','07.30','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Colombo Fort','T00-021','Yal Devi','10.00','14.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Polgahawela','Colombo Fort','T00-022','Rajarata Rajina','18.00','21.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Polgahawela','Maradana','T00-020','Sri Devi','05.00','08.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Polgahawela','Panadura','T00-020','Sri Devi','05.00','09.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Polgahawela','Kaluthara','T00-020','Sri Devi','05.00','10.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Polgahawela','Hikkaduwa','T00-020','Sri Devi','05.00','11.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Polgahawela','Galle','T00-020','Sri Devi','05.00','12.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Polgahawela','Matara','T00-020','Sri Devi','05.00','13.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Polgahawela','Beliaththa','T00-020','Sri Devi','05.00','14.00','14.00','Anuradhaura','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Kurunagala','Gampaha','T00-020','Sri Devi','06.00','07.00','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Kurunagala','Gampaha','T00-021','Yal Devi','11.00','12.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Kurunagala','Gampaha','T00-022','Rajarata Rajina','19.00','20.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Kurunagala','Colombo Fort','T00-020','Sri Devi','06.00','07.30','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Kurunagala','Colombo Fort','T00-021','Yal Devi','11.00','14.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Kurunagala','Colombo Fort','T00-022','Rajarata Rajina','19.00','21.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Kurunagala','Maradana','T00-020','Sri Devi','06.00','08.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Kurunagala','Panadura','T00-020','Sri Devi','06.00','09.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Kurunagala','Kaluthara','T00-020','Sri Devi','06.00','10.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Kurunagala','Hikkaduwa','T00-020','Sri Devi','06.00','11.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Kurunagala','Galle','T00-020','Sri Devi','06.00','12.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Kurunagala','Matara','T00-020','Sri Devi','06.00','13.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Kurunagala','Beliaththa','T00-020','Sri Devi','06.00','14.00','14.00','Anuradhaura','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Gampaha','Colombo Fort','T00-020','Sri Devi','07.00','07.30','14.00','Anuradhaura','Beliaththa');
INSERT INTO stationschedule VALUE('Gampaha','Colombo Fort','T00-021','Yal Devi','12.00','14.00','14.00','Anuradhaura','Colombo Fort');
INSERT INTO stationschedule VALUE('Gampaha','Colombo Fort','T00-022','Rajarata Rajina','20.00','21.00','21.00','Anuradhaura','Colombo Fort');

INSERT INTO stationschedule VALUE('Gampaha','Maradana','T00-020','Sri Devi','07.00','08.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Gampaha','Panadura','T00-020','Sri Devi','07.00','09.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Gampaha','Kaluthara','T00-020','Sri Devi','07.00','10.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Gampaha','Hikkaduwa','T00-020','Sri Devi','07.00','11.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Gampaha','Galle','T00-020','Sri Devi','07.00','12.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Gampaha','Matara','T00-020','Sri Devi','07.00','13.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Gampaha','Beliaththa','T00-020','Sri Devi','07.00','14.00','14.00','Anuradhaura','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Colombo Fort','Maradana','T00-020','Sri Devi','07.30','08.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Panadura','T00-020','Sri Devi','07.30','09.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Kaluthara','T00-020','Sri Devi','07.30','10.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Hikkaduwa','T00-020','Sri Devi','07.30','11.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Galle','T00-020','Sri Devi','07.30','12.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Matara','T00-020','Sri Devi','07.30','13.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Colombo Fort','Beliaththa','T00-020','Sri Devi','07.30','14.00','14.00','Anuradhaura','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Maradana','Panadura','T00-020','Sri Devi','08.00','09.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Maradana','Kaluthara','T00-020','Sri Devi','08.00','10.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Maradana','Hikkaduwa','T00-020','Sri Devi','08.00','11.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Maradana','Galle','T00-020','Sri Devi','08.00','12.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Maradana','Matara','T00-020','Sri Devi','08.00','13.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Maradana','Beliaththa','T00-020','Sri Devi','08.00','14.00','14.00','Anuradhaura','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Panadura','Kaluthara','T00-020','Sri Devi','09.00','10.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Panadura','Hikkaduwa','T00-020','Sri Devi','09.00','11.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Panadura','Galle','T00-020','Sri Devi','09.00','12.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Panadura','Matara','T00-020','Sri Devi','09.00','13.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Panadura','Beliaththa','T00-020','Sri Devi','09.00','14.00','14.00','Anuradhaura','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Kaluthara','Hikkaduwa','T00-020','Sri Devi','10.00','11.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Kaluthara','Galle','T00-020','Sri Devi','10.00','12.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Kaluthara','Matara','T00-020','Sri Devi','10.00','13.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Kaluthara','Beliaththa','T00-020','Sri Devi','10.00','14.00','14.00','Anuradhaura','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Hikkaduwa','Galle','T00-020','Sri Devi','11.00','12.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Hikkaduwa','Matara','T00-020','Sri Devi','11.00','13.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Hikkaduwa','Beliaththa','T00-020','Sri Devi','11.00','14.00','14.00','Anuradhaura','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Galle','Matara','T00-020','Sri Devi','12.00','13.00','14.00','Anuradhaura','Beliaththa');

INSERT INTO stationschedule VALUE('Galle','Beliaththa','T00-020','Sri Devi','12.00','14.00','14.00','Anuradhaura','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Matara','Beliaththa','T00-020','Sri Devi','13.00','14.00','14.00','Anuradhaura','Beliaththa');

#.........................................................................................
#.........................................................................................

INSERT INTO stationschedule VALUE('Jaffna','Vavuniya','T00-023','Express','06.00','08.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Vavuniya','T00-024','Sagarika','12.30','14.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Jaffna','Vavuniya','T00-025','Intercity','08.30','10.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Jaffna','Medavachchiya','T00-023','Express','06.00','08.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Medavachchiya','T00-024','Sagarika','12.30','15.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Jaffna','Medavachchiya','T00-025','Intercity','08.30','10.30','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Jaffna','Anuradhapuara','T00-023','Express','06.00','09.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Anuradhapuara','T00-024','Sagarika','12.30','16.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Jaffna','Anuradhapuara','T00-025','Intercity','08.30','11.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Jaffna','Polgahawela','T00-023','Express','06.00','09.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Polgahawela','T00-024','Sagarika','12.30','17.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Jaffna','Polgahawela','T00-025','Intercity','08.30','11.30','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Jaffna','Kurunagala','T00-023','Express','06.00','10.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Kurunagala','T00-024','Sagarika','12.30','18.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Jaffna','Kurunagala','T00-025','Intercity','08.30','12.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Jaffna','Gampaha','T00-023','Express','06.00','10.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Gampaha','T00-024','Sagarika','12.30','19.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Jaffna','Gampaha','T00-025','Intercity','08.30','13.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Jaffna','Colombo Fort','T00-023','Express','06.00','11.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Colombo Fort','T00-024','Sagarika','12.30','20.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Jaffna','Colombo Fort','T00-025','Intercity','08.30','14.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Jaffna','Maradana','T00-023','Express','06.00','11.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Panadura','T00-023','Express','06.00','12.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Kaluthara','T00-023','Express','06.00','12.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Hikkaduwa','T00-023','Express','06.00','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Galle','T00-023','Express','06.00','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Matara','T00-023','Express','06.00','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Jaffna','Beliaththa','T00-023','Express','06.00','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Vavuniya','Medavachchiya','T00-023','Express','08.00','08.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Medavachchiya','T00-024','Sagarika','14.30','15.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Vavuniya','Medavachchiya','T00-025','Intercity','10.00','10.30','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Vavuniya','Anuradhapuara','T00-023','Express','08.00','09.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Anuradhapuara','T00-024','Sagarika','14.30','16.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Vavuniya','Anuradhapuara','T00-025','Intercity','10.00','11.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Vavuniya','Polgahawela','T00-023','Express','08.00','09.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Polgahawela','T00-024','Sagarika','14.30','17.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Vavuniya','Polgahawela','T00-025','Intercity','10.00','11.30','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Vavuniya','Kurunagala','T00-023','Express','08.00','10.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Kurunagala','T00-024','Sagarika','14.30','18.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Vavuniya','Kurunagala','T00-025','Intercity','10.00','12.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Vavuniya','Gampaha','T00-023','Express','08.00','10.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Gampaha','T00-024','Sagarika','14.30','19.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Vavuniya','Gampaha','T00-025','Intercity','10.00','13.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Vavuniya','Colombo Fort','T00-023','Express','08.00','11.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Colombo Fort','T00-024','Sagarika','14.30','20.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Vavuniya','Colombo Fort','T00-025','Intercity','10.00','14.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Vavuniya','Maradana','T00-023','Express','08.00','11.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Panadura','T00-023','Express','08.00','12.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Kaluthara','T00-023','Express','08.00','12.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Hikkaduwa','T00-023','Express','08.00','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Galle','T00-023','Express','08.00','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Matara','T00-023','Express','08.00','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Vavuniya','Beliaththa','T00-023','Express','08.00','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Medavachchiya','Anuradhapuara','T00-023','Express','08.30','09.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Anuradhapuara','T00-024','Sagarika','15.30','16.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Medavachchiya','Anuradhapuara','T00-025','Intercity','10.30','11.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Medavachchiya','Polgahawela','T00-023','Express','08.30','09.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Polgahawela','T00-024','Sagarika','15.30','17.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Medavachchiya','Polgahawela','T00-025','Intercity','10.30','11.30','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Medavachchiya','Kurunagala','T00-023','Express','08.30','10.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Kurunagala','T00-024','Sagarika','15.30','18.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Medavachchiya','Kurunagala','T00-025','Intercity','10.30','12.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Medavachchiya','Gampaha','T00-023','Express','08.30','10.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Gampaha','T00-024','Sagarika','15.30','19.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Medavachchiya','Gampaha','T00-025','Intercity','10.30','13.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Medavachchiya','Colombo Fort','T00-023','Express','08.30','11.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Colombo Fort','T00-024','Sagarika','15.30','20.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Medavachchiya','Colombo Fort','T00-025','Intercity','10.30','14.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Medavachchiya','Maradana','T00-023','Express','08.30','11.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Panadura','T00-023','Express','08.30','12.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Kaluthara','T00-023','Express','08.30','12.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Hikkaduwa','T00-023','Express','08.30','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Galle','T00-023','Express','08.30','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Matara','T00-023','Express','08.30','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Medavachchiya','Beliaththa','T00-023','Express','08.30','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Anuradhapuara','Polgahawela','T00-023','Express','09.00','09.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhapuara','Polgahawela','T00-024','Sagarika','16.30','17.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhapuara','Polgahawela','T00-025','Intercity','10.30','11.30','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Anuradhapuara','Kurunagala','T00-023','Express','09.00','10.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhapuara','Kurunagala','T00-024','Sagarika','16.30','18.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhapuara','Kurunagala','T00-025','Intercity','10.30','12.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Anuradhapuara','Gampaha','T00-023','Express','09.00','10.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhapuara','Gampaha','T00-024','Sagarika','16.30','19.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhapuara','Gampaha','T00-025','Intercity','10.30','13.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Anuradhapuara','Colombo Fort','T00-023','Express','09.00','11.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhapuara','Colombo Fort','T00-024','Sagarika','16.30','20.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhapuara','Colombo Fort','T00-025','Intercity','10.30','14.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Anuradhapuara','Maradana','T00-023','Express','09.00','11.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhapuara','Panadura','T00-023','Express','09.00','12.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhapuara','Kaluthara','T00-023','Express','09.00','12.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhapuara','Hikkaduwa','T00-023','Express','09.00','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhapuara','Galle','T00-023','Express','09.00','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhapuara','Matara','T00-023','Express','09.00','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Anuradhapuara','Beliaththa','T00-023','Express','09.00','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Polgahawela','Kurunagala','T00-023','Express','09.30','10.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Kurunagala','T00-024','Sagarika','17.30','18.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Polgahawela','Kurunagala','T00-025','Intercity','11.30','12.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Polgahawela','Gampaha','T00-023','Express','09.30','10.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Gampaha','T00-024','Sagarika','17.30','19.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Polgahawela','Gampaha','T00-025','Intercity','11.30','13.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Polgahawela','Colombo Fort','T00-023','Express','09.30','11.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Colombo Fort','T00-024','Sagarika','17.30','20.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Polgahawela','Colombo Fort','T00-025','Intercity','11.30','14.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Polgahawela','Maradana','T00-023','Express','09.30','11.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Panadura','T00-023','Express','09.30','12.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Kaluthara','T00-023','Express','09.30','12.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Hikkaduwa','T00-023','Express','09.30','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Galle','T00-023','Express','09.30','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Matara','T00-023','Express','09.30','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Polgahawela','Beliaththa','T00-023','Express','09.30','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Kurunagala','Gampaha','T00-023','Express','10.00','10.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kurunagala','Gampaha','T00-024','Sagarika','18.30','19.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Kurunagala','Gampaha','T00-025','Intercity','12.00','13.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Kurunagala','Colombo Fort','T00-023','Express','10.00','11.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kurunagala','Colombo Fort','T00-024','Sagarika','18.30','20.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Kurunagala','Colombo Fort','T00-025','Intercity','12.00','14.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Kurunagala','Maradana','T00-023','Express','10.00','11.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kurunagala','Panadura','T00-023','Express','10.00','12.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kurunagala','Kaluthara','T00-023','Express','10.00','12.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kurunagala','Hikkaduwa','T00-023','Express','10.00','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kurunagala','Galle','T00-023','Express','10.00','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kurunagala','Matara','T00-023','Express','10.00','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kurunagala','Beliaththa','T00-023','Express','10.00','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Gampaha','Colombo Fort','T00-023','Express','10.30','11.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Gampaha','Colombo Fort','T00-024','Sagarika','19.30','20.30','20.30','Jaffna','Colombo Fort');
INSERT INTO stationschedule VALUE('Gampaha','Colombo Fort','T00-025','Intercity','13.00','14.00','14.00','Jaffna','Colombo Fort');

INSERT INTO stationschedule VALUE('Gampaha','Maradana','T00-023','Express','10.30','11.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Gampaha','Panadura','T00-023','Express','10.30','12.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Gampaha','Kaluthara','T00-023','Express','10.30','12.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Gampaha','Hikkaduwa','T00-023','Express','10.30','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Gampaha','Galle','T00-023','Express','10.30','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Gampaha','Matara','T00-023','Express','10.30','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Gampaha','Beliaththa','T00-023','Express','10.30','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Colombo Fort','Maradana','T00-023','Express','11.00','11.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Panadura','T00-023','Express','11.00','12.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Kaluthara','T00-023','Express','11.00','12.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Hikkaduwa','T00-023','Express','11.00','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Galle','T00-023','Express','11.00','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Matara','T00-023','Express','11.00','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Colombo Fort','Beliaththa','T00-023','Express','11.00','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Maradana','Panadura','T00-023','Express','11.30','12.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Maradana','Kaluthara','T00-023','Express','11.30','12.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Maradana','Hikkaduwa','T00-023','Express','11.30','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Maradana','Galle','T00-023','Express','11.30','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Maradana','Matara','T00-023','Express','11.30','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Maradana','Beliaththa','T00-023','Express','11.30','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Panadura','Kaluthara','T00-023','Express','12.00','12.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Hikkaduwa','T00-023','Express','12.00','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Galle','T00-023','Express','12.00','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Matara','T00-023','Express','12.00','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Panadura','Beliaththa','T00-023','Express','12.00','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Kaluthara','Hikkaduwa','T00-023','Express','12.30','13.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Galle','T00-023','Express','12.30','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Matara','T00-023','Express','12.30','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Kaluthara','Beliaththa','T00-023','Express','12.30','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Hikkaduwa','Galle','T00-023','Express','13.00','13.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Matara','T00-023','Express','13.00','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Hikkaduwa','Beliaththa','T00-023','Express','13.00','16.30','16.30','Jaffna','Beliaththa');

#.........................................................................................

INSERT INTO stationschedule VALUE('Galle','Matara','T00-023','Express','13.30','14.00','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Galle','Beliaththa','T00-023','Express','13.30','16.30','16.30','Jaffna','Beliaththa');
INSERT INTO stationschedule VALUE('Matara','Beliaththa','T00-023','Express','14.00','16.30','16.30','Jaffna','Beliaththa');
#.........................................................................................
#.........................................................................................

INSERT INTO stationschedule VALUE('Mannar','Anuradhapuara','T00-026','Express3','14.00','16.00','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Mannar','Polgahawela','T00-026','Express3','14.00','18.00','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Mannar','Kurunagala','T00-026','Express3','14.00','20.00','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Mannar','Gampaha','T00-026','Express3','14.00','21.00','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Mannar','Colombo Fort','T00-026','Express3','14.00','23.30','23.30','Mannar','Colombo Fort');

#.........................................................................................

INSERT INTO stationschedule VALUE('Anuradhapuara','Polgahawela','T00-026','Express3','16.00','18.00','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhapuara','Kurunagala','T00-026','Express3','16.00','20.00','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhapuara','Gampaha','T00-026','Express3','16.00','21.00','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Anuradhapuara','Colombo Fort','T00-026','Express3','16.00','23.30','23.30','Mannar','Colombo Fort');

#.........................................................................................

INSERT INTO stationschedule VALUE('Polgahawela','Kurunagala','T00-026','Express3','18.00','20.00','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Polgahawela','Gampaha','T00-026','Express3','18.00','21.00','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Polgahawela','Colombo Fort','T00-026','Express3','18.00','23.30','23.30','Mannar','Colombo Fort');

#.........................................................................................

INSERT INTO stationschedule VALUE('Kurunagala','Gampaha','T00-026','Express3','20.00','21.00','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Kurunagala','Colombo Fort','T00-026','Express3','20.00','23.30','23.30','Mannar','Colombo Fort');
INSERT INTO stationschedule VALUE('Gampaha','Colombo Fort','T00-026','Express3','21.00','23.30','23.30','Mannar','Colombo Fort');

#.........................................................................................
#.........................................................................................

INSERT INTO stationschedule VALUE('Badulla','Colombo Fort','T00-027','Podi Manike','10.00','21.30','21.30','Badulla','Colombo Fort');
INSERT INTO stationschedule VALUE('Badulla','Colombo Fort','T00-028','Denuvara','04.30','17.00','17.00','Badulla','Colombo Fort');
INSERT INTO stationschedule VALUE('Badulla','Colombo Fort','T00-029','Udarata Manike','05.00','16.00','16.00','Badulla','Colombo Fort');

#.........................................................................................
#.........................................................................................

#--------------------------------------------------------------------------


INSERT INTO Schedule VALUE('SC00-001','Beliaththa','2022.03.19','T00-001','Dakshins Intercity');
INSERT INTO Schedule VALUE('SC00-002','Beliaththa','2022.03.19','T00-002','Galu Kumari');
INSERT INTO Schedule VALUE('SC00-003','Beliaththa','2022.03.19','T00-003','Express');
INSERT INTO Schedule VALUE('SC00-004','Beliaththa','2022.03.19','T00-004','Rajarata Manike');
INSERT INTO Schedule VALUE('SC00-005','Beliaththa','2022.03.19','T00-005','Express');
INSERT INTO Schedule VALUE('SC00-006','Beliaththa','2022.03.19','T00-007','Express2');
INSERT INTO Schedule VALUE('SC00-007','Colombo Fort','2022.03.19','T00-008','Express');
INSERT INTO Schedule VALUE('SC00-008','Colombo Fort','2022.03.19','T00-009','Galu Kumari');
INSERT INTO Schedule VALUE('SC00-009','Colombo Fort','2022.03.19','T00-011','Sagarika');
INSERT INTO Schedule VALUE('SC00-010','Colombo Fort','2022.03.19','T00-012','Rajarata Rajina');
INSERT INTO Schedule VALUE('SC00-011','Colombo Fort','2022.03.19','T00-013','Sri Devi');
INSERT INTO Schedule VALUE('SC00-012','Colombo Fort','2022.03.19','T00-014','Sagarika');
INSERT INTO Schedule VALUE('SC00-013','Colombo Fort','2022.03.19','T00-015','Intercity');
INSERT INTO Schedule VALUE('SC00-014','Colombo Fort','2022.03.19','T00-016','Express3');
INSERT INTO Schedule VALUE('SC00-015','Colombo Fort','2022.03.19','T00-017','Podi Manike');
INSERT INTO Schedule VALUE('SC00-016','Colombo Fort','2022.03.19','T00-018','Denuvara');
INSERT INTO Schedule VALUE('SC00-017','Colombo Fort','2022.03.19','T00-019','Udarata Manike');
INSERT INTO Schedule VALUE('SC00-018','Anuradhaura','2022.03.19','T00-020','Sri Devi');
INSERT INTO Schedule VALUE('SC00-019','Anuradhaura','2022.03.19','T00-021','Yal Devi');
INSERT INTO Schedule VALUE('SC00-020','Anuradhaura','2022.03.19','T00-022','Rajarata Rajina');
INSERT INTO Schedule VALUE('SC00-021','Jaffna','2022.03.19','T00-023','Express');
INSERT INTO Schedule VALUE('SC00-022','Jaffna','2022.03.19','T00-025','Intercity');
INSERT INTO Schedule VALUE('SC00-023','Jaffna','2022.03.19','T00-025','Intercity');
INSERT INTO Schedule VALUE('SC00-024','Mannar','2022.03.19','T00-026','Express3');
INSERT INTO Schedule VALUE('SC00-025','Badulla','2022.03.19','T00-028','Denuvara');
INSERT INTO Schedule VALUE('SC00-026','Badulla','2022.03.19','T00-027','Podi Manike');
INSERT INTO Schedule VALUE('SC00-027','Badulla','2022.03.19','T00-029','Udarata Manike');
INSERT INTO Schedule VALUE('SC00-028','Beliaththa','2022.03.20','T00-001','Dakshins Intercity');
INSERT INTO Schedule VALUE('SC00-029','Beliaththa','2022.03.20','T00-002','Galu Kumari');
INSERT INTO Schedule VALUE('SC00-030','Beliaththa','2022.03.20','T00-003','Express');
INSERT INTO Schedule VALUE('SC00-031','Beliaththa','2022.03.20','T00-004','Rajarata Manike');
INSERT INTO Schedule VALUE('SC00-032','Beliaththa','2022.03.20','T00-005','Express');
INSERT INTO Schedule VALUE('SC00-033','Beliaththa','2022.03.20','T00-007','Express2');
INSERT INTO Schedule VALUE('SC00-034','Colombo Fort','2022.03.20','T00-008','Express');
INSERT INTO Schedule VALUE('SC00-035','Colombo Fort','2022.03.20','T00-009','Galu Kumari');
INSERT INTO Schedule VALUE('SC00-036','Colombo Fort','2022.03.20','T00-011','Sagarika');
INSERT INTO Schedule VALUE('SC00-037','Colombo Fort','2022.03.20','T00-012','Rajarata Rajina');
INSERT INTO Schedule VALUE('SC00-038','Colombo Fort','2022.03.20','T00-013','Sri Devi');
INSERT INTO Schedule VALUE('SC00-039','Colombo Fort','2022.03.20','T00-014','Sagarika');
INSERT INTO Schedule VALUE('SC00-040','Colombo Fort','2022.03.20','T00-015','Intercity');

#--------------------------------------------------------------------------


# INSERT INTO StationSchedule VALUE ()


SELECT * FROM admin;
SELECT * FROM booking;
SELECT * FROM ticket;
SELECT * FROM employee;
SELECT * FROM station;
SELECT * FROM Train;
SELECT * FROM Schedule;
SELECT * FROM stationschedule;
