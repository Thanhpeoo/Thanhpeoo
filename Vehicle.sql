CREATE DATABASE Vehicle

CREATE TABLE Employee
(EmployeeID     INT NOT NULL IDENTITY(1001,1),
LastName        VARCHAR(20) NOT NULL,
Birthday        DATE NOT NULL,
Position        VARCHAR(20) NOT NULL,
MainOffice      TINYINT NOT NULL,
CONSTRAINT PK_Employee PRIMARY KEY (EmployeeID)
)
  
INSERT INTO Employee(LastName, Birthday, Position, MainOffice)
VALUES
('ALVA',     '1990-05-23' , 'Staff',    1),
('AMBER',    '1984-01-02' , 'Staff',    3),
('BARNES',   '1973-03-02' , 'Manager',  2),
('BARNEY',   '1996-12-11' , 'Staff',    3),
('STARK',    '1982-10-19' , 'Manager',  1)
  
CREATE TABLE Plant
(PlantNo            TINYINT NOT NULL,
PlantLocation       VARCHAR(20) NOT NULL,
SupervisorNo        INT NOT NULL,
ProdHoursLimit      INT NOT NULL,
CONSTRAINT PK_Plant PRIMARY KEY(PlantNo),
CONSTRAINT FK_toEmloyee FOREIGN KEY (SupervisorNo) REFERENCES Employee(EmployeeID)
)

INSERT INTO Plant(PlantNo, PlantLocation , SupervisorNo, ProdHoursLimit)
VALUES
(1,    'Thai Binh',    1005,    5000),
(2,    'Ninh Binh',    1003,    3600),
(3,    'Thai Nguyen',  1003,    2000)

CREATE TABLE Vehicle
(VehicleID      INT,        
VStatus         INT,
VehicleBrand    VARCHAR (20),
VehicleMake     VARCHAR (12),
PlantNo         TINYINT,
ProdHours       INT,
SellingPrice    FLOAT,
CONSTRAINT PK_Vehicle PRIMARY KEY (VehicleID),
CONSTRAINT FK_toPlant FOREIGN KEY (PlantNo) REFERENCES Plant(PlantNo)
)

INSERT INTO Vehicle(VehicleID, VStatus, VehicleBrand, VehicleMake, PlantNo, ProdHours, SellingPrice)
VALUES
(201201, 0, 'Winfast', 'Jazz',      1, 200, 15000),
(201401, 0, 'Winfast', 'Selantra',  1, 400, 20000),
(201601, 1, 'Winslow', 'Vitesse',   2, 300, 19000 ),
(201801, 1, 'Winfast', 'Viva',      1, 300, 21000 ),
(201802, 1, 'Winslow', 'Prego',     3, 500, 22000 ),
(201803, 0, 'Winfast', 'Preno',     1, 150, 15000 ),
(202001, 1, 'Winfast', 'Contho',    2, 350, 26000),
(202002, 1, 'Winslow', 'Conrua',    3, 400, 24000)