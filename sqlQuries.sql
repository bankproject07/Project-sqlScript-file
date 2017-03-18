create table Account_Master
(Account_ID NUMBER(10) primary key,
Account_Type VARCHAR2(25),
Account_Balance NUMBER(10,2),
Open_Date DATE);

create table Customer(
Customer_ID NUMBER(10) primary key,
customer_name VARCHAR2(50), 
Email VARCHAR2(30),
Address VARCHAR2(100), 
Pancard VARCHAR2(15));

create table Transaction
(
Transaction_ID NUMBER primary key ,
Tran_description VARCHAR2(100),
DateofTransaction DATE ,TransactionType VARCHAR2(1),TranAmount NUMBER(15) ,
Account_ID NUMBER(10),
FOREIGN KEY(Account_ID) REFERENCES Account_Master(Account_ID)
);

create table Service_Tracker(
Service_ID NUMBER(15) primary key, 
Service_Description VARCHAR2(100),
Account_ID NUMBER, 
Service_Raised_Date DATE ,
Service_status VARCHAR2(20),
foreign key(Account_ID) references Account_Master(Account_ID) 
);


create table User_Table
(
user_id NUMBER primary key,
Account_ID NUMBER,
login_password VARCHAR2(15),
secret_question VARCHAR2(50),
Transaction_password VARCHAR2(15),
lock_status VARCHAR2(10),
foreign key(Account_ID) references Account_Master(Account_ID) 
);

create table Fund_Transfer(
FundTransfer_ID NUMBER primary key ,
Account_ID NUMBER(10),
Payee_Account_ID NUMBER(10),
Date_Of_Transfer DATE,
Transfer_Amount NUMBER(15),
foreign key(Account_ID) references Account_Master(Account_ID)
);

create table Payee_Table
(
Payee_Account_Id NUMBER primary key, 
Account_Id NUMBER,
Nick_name VARCHAR2(40),
foreign key(Account_ID) references Account_Master(Account_ID)
);