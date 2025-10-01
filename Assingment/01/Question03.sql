create table Patient(
    Patient_ID int primary key,
    Name varchar(30) not null,
    Gender varchar(1) check(Gender in ('M','F')),
    DOB date,
    Email varchar(50) unique,
    Phone varchar(20),
    Address varchar(100),
    Username varchar(30),
    Password varchar(15)
);

create table Doctor(
    Doctor_ID int primary key,
    Name varchar(30) not null,
    Specialization varchar(30),
    Username varchar(30),
    Password varchar(15)
);


create table Appointment(
    Appointment_ID int primary key,
    Appointment_Date date not null,
    Appointment_Time varchar(10) not null, 
    Status varchar(15) default 'Pending',
    Clinic_Number int,
    Patient_ID int,
    Doctor_ID int,
    constraint FK_PatientA foreign key(Patient_ID) references Patient(Patient_ID),
    constraint FK_DoctorA foreign key(Doctor_ID) references Doctor(Doctor_ID)
);


create table Prescription(
    Prescription_ID int primary key,
    Prescription_Date date,
    Doctor_Advice varchar(200),
    Followup_Required varchar(3) default 'No',
    Patient_ID int,
    Doctor_ID int,
    constraint FK_PatientP foreign key(Patient_ID) references Patient(Patient_ID),
    constraint FK_DoctorP foreign key(Doctor_ID) references Doctor(Doctor_ID)
);


create table Invoice(
    Invoice_ID int primary key,
    Invoice_Date date,
    Amount decimal(10,2),
    Payment_Status varchar(15) default 'Unpaid',
    Payment_Method varchar(30) default 'Cash',
    Patient_ID int,
    constraint FK_PatientI foreign key(Patient_ID) references Patient(Patient_ID)
);

create table Tests(
    Test_ID int primary key,
    Blood_Test varchar(3) default 'No',
    X_Ray varchar(3) default 'No',
    MRI varchar(3) default 'No',
    CT_Scan varchar(3) default 'No'
);


insert into Patient values (11, 'Bilal Hussain', 'M', TO_DATE('1992-05-11','YYYY-MM-DD'), 'bilal.hussain@gmail.com', '03005551234', 'Faisalabad, Pakistan', 'bilal92', 'bilalpass');
insert into Patient values (12, 'Hira Sheikh', 'F', TO_DATE('2000-08-19','YYYY-MM-DD'), 'hira.sheikh@yahoo.com', '03219876543', 'Multan, Pakistan', 'hira2000', 'hirapass');
insert into Patient values (13, 'Omar Farooq', 'M', TO_DATE('1985-11-25','YYYY-MM-DD'), 'omar.farooq@hotmail.com', '03331234567', 'Rawalpindi, Pakistan', 'omar85', 'omarpass');

insert into Doctor values (201, 'Dr. Imran Qureshi', 'Neurologist', 'imranQ', 'neu123');
insert into Doctor values (202, 'Dr. Nadia Javed', 'Gynecologist', 'nadiaJ', 'gyn456');
insert into Doctor values (203, 'Dr. Saad Khalid', 'ENT Specialist', 'saadK', 'ent789');

insert into Appointment values (4001, TO_DATE('2025-10-02','YYYY-MM-DD'), '11:00', 'Pending', 5, 11, 201);
insert into Appointment values (4002, TO_DATE('2025-10-03','YYYY-MM-DD'), '13:15', 'Confirmed', 2, 12, 202);
insert into Appointment values (4003, TO_DATE('2025-10-04','YYYY-MM-DD'), '15:30', 'Completed', 4, 13, 203);


insert into Prescription values (6001, TO_DATE('2025-10-01','YYYY-MM-DD'), '2 tablets of vitamin daily', 'Yes', 11, 201);
insert into Prescription values (6002, TO_DATE('2025-10-03','YYYY-MM-DD'), 'Use nasal spray before sleeping', 'No', 12, 203);
insert into Prescription values (6003, TO_DATE('2025-10-04','YYYY-MM-DD'), 'Drink 8 glasses of water daily', 'Yes', 13, 201);

insert into Invoice values (7001, TO_DATE('2025-10-02','YYYY-MM-DD'), 2200.00, 'Paid', 'Cash', 11);
insert into Invoice values (7002, TO_DATE('2025-10-03','YYYY-MM-DD'), 3100.50, 'Unpaid', 'Online', 12);
insert into Invoice values (7003, TO_DATE('2025-10-04','YYYY-MM-DD'), 1750.25, 'Paid', 'Debit Card', 13);

insert into Tests values (8001, 'Yes', 'No', 'No', 'No');
insert into Tests values (8002, 'No', 'Yes', 'No', 'No');
insert into Tests values (8003, 'No', 'No', 'Yes', 'Yes');
-- a) 
update Patient set Phone = '03169998877', Email = 'bilal.hussain1@gmail.com' where Patient_ID = 11;

-- b) 
update Invoice set Payment_Status = 'Paid' where Invoice_ID = 7002;
-- c) 
delete from Appointment where Status = 'Cancelled';

-- d)
delete from Invoice where Payment_Status = 'Refunded';
-- e) 
select * from Appointment where Status = 'Pending';

-- f) 
select * from Invoice where Payment_Status = 'Unpaid';

-- g) 
select * from Tests where Blood_Test = 'Yes';

-- h) 
select * from Prescription where Prescription_Date = TO_DATE('2025-10-01','YYYY-MM-DD');
-- a) 
select d.Doctor_ID, p.* 
from Patient p join Appointment a on p.Patient_ID = a.Patient_ID
join Doctor d on a.Doctor_ID = d.Doctor_ID 
where a.Status in ('Pending');

-- b) 
select p.Name, d.Name, t.Test_ID 
from Patient p 
join Appointment a on p.Patient_ID = a.Patient_ID
join Doctor d on a.Doctor_ID = d.Doctor_ID
join Tests t on t.Test_ID = a.Appointment_ID;

-- c) 
select pr.* from Prescription pr 
where pr.Patient_ID = (select pa.Patient_ID from Patient pa where pa.Name = 'Bilal Hussain');

-- d) 
select d.Doctor_ID, pr.* 
from Prescription pr, Doctor d 
where d.Doctor_ID = pr.Doctor_ID and pr.Followup_Required = 'Yes';
