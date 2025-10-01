
-- 1)
create table Members (
    MemberID int primary key,
    Name varchar(20) not null,
    Email varchar(25) unique check(Email LIKE '%@%.%'),
    JoinDate date default sysdate 
);

create table Books (
    BookID int primary key,
    Title varchar(50) not null ,
    Author varchar(30) not null,
    CopiesAvailable int check(CopiesAvailable >= 0),
    CONSTRAINT unique_title_author UNIQUE (Title, Author)
);

create table IssuedBooks (
    IssueID int primary key,
    MemberID int,
    BookID int,
    IssueDate date default sysdate not null,
    ReturnDate date not null,
    foreign key(MemberID) references Members(MemberID),
    foreign key (BookID) references Books(BookID),
    check ( ReturnDate >= IssueDate)
);

-- 2)

create table Relations(
    relation_name varchar(20) not null unique,
    no_of_cols int default 1
);

create table ColumnsDetails(
    column_name varchar(20) not null,
    data_type varchar(20),
    constraint_name varchar(40),
    belongs_to_relation varchar(20),
    foreign key (belongs_to_relation) references Relations(relation_name)
);


insert into Relations values('Members',4);
insert into Relations values('Books',4);
insert into Relations values('IssuedBooks',5);

insert into ColumnsDetails values ('memberid','int','primary key','Members');
insert into ColumnsDetails values ('fullname','varchar(100)','not null','Members');
insert into ColumnsDetails values ('email','varchar(100)','unique, check(email like ''%@%.%'')','Members');
insert into ColumnsDetails values ('joindate','date','default sysdate','Members');

insert into ColumnsDetails values ('bookid','int','primary key','Books');
insert into ColumnsDetails values ('title','varchar(150)','not null unique','Books');
insert into ColumnsDetails values ('author','varchar(100)','not null','Books');
insert into ColumnsDetails values ('copies','int','check(copies >= 0)','Books');

insert into ColumnsDetails values ('issueid','int','primary key','IssuedBooks');
insert into ColumnsDetails values ('memberid','int','foreign key references Members(MemberID)','IssuedBooks');
insert into ColumnsDetails values ('bookid','int','foreign key references Books(BookID)','IssuedBooks');
insert into ColumnsDetails values ('issuedate','date','default sysdate not null','IssuedBooks');
insert into ColumnsDetails values ('returndate','date','not null check(returndate >= issuedate)','IssuedBooks');

-- 3) Sample Data Inserts
insert into Members (MemberID,Name,Email) values (101,'Ali Ahmed','k230101@nu.edu.pk');
insert into Members (MemberID,Name,Email) values (102,'Sara Khan','k230102@nu.edu.pk');
insert into Members (MemberID,Name,Email) values (103,'Usman Tariq','k230103@nu.edu.pk');

insert into Books (BookID,Title,Author,CopiesAvailable) values 
(201,'Operating Systems Concepts','arhadm',12);
insert into Books (BookID,Title,Author,CopiesAvailable) values 
(202,'Artificial Intelligence Basics','ali',8);
insert into Books (BookID,Title,Author,CopiesAvailable) values 
(203,'Computer Networks','talha rusman',5);

insert into IssuedBooks values (301,101,201,default,sysdate+10);
update Books set CopiesAvailable = CopiesAvailable - 1 where BookID = 201;

insert into IssuedBooks values (302,103,202,default,sysdate+7);
update Books set CopiesAvailable = CopiesAvailable - 1 where BookID = 202;

insert into IssuedBooks values (303,101,203,default,sysdate+5);
update Books set CopiesAvailable = CopiesAvailable - 1 where BookID = 203;

select m.Name, i.BookID 
from Members m join IssuedBooks i on m.MemberID = i.MemberID;

-- 4) 
insert into Members (MemberID,Name,Email) values (101,'Hina Malik','k230199@nu.edu.pk'); -- Primary Key Violation
insert into IssuedBooks values (304,110,201,default,sysdate+3); -- Foreign Key Violation
insert into Books (BookID,Title,Author,CopiesAvailable) values (204,'Deep Learning','Ian Goodfellow',-3); -- Check Constraint Violation

-- 5) 
-- 1. Issuing a book decreases CopiesAvailable; returning it increases CopiesAvailable.
-- 2. If the ReturnDate is overdue, a fine should be applied automatically.

-- 6) Queries
-- a) 
select * from Members m 
where m.MemberID not in (select MemberID from IssuedBooks);

-- b) 
select b.Title, b.CopiesAvailable 
from Books b 
where b.CopiesAvailable = (select max(CopiesAvailable) from Books);

-- c) 
select MemberID, BOOK_COUNT 
from (select MemberID, count(*) as BOOK_COUNT 
      from IssuedBooks group by MemberID 
      order by BOOK_COUNT desc) 
where rownum <= 1;

-- d) 
select * from Books b 
where b.BookID not in (select BookID from IssuedBooks);

-- e) 
select * from Members m 
where m.MemberID in (
    select MemberID from IssuedBooks i 
    where i.ReturnDate is null 
    or i.ReturnDate >= i.IssueDate + 30
);
