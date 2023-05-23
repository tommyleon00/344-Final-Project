create database banks_portal;
use banks_portal;
create table accounts
( 
accountId int not null unique auto_increment primary key,
ownerName varchar (45) not null,
owner_ssn int not null,
balance decimal (10,2) default 0.00,
account_status varchar(45)
);

create table Transactions 
(
transactionID int not null unique auto_increment primary key,
accountID int not null,
transactionType varchar (45) not null,
transactionAmount decimal (10,2) not null
);

insert into accounts(ownerName, owner_ssn, balance, account_status)
values 
( "maria Jozef" , 123456789,10000.00, “active”), 
("linda Jones", 987654321, 2600.00, “inactive”),
("John McGrail",222222222, 100.50, “active”),
("Patty Luna", 111111111,509.75, "inactive");

insert into Transactions(accountID, transactionType, transactionAmount)
values
(1, deposit, 650.98), 
(3, withdraw, 899.87), 
(3, deposit,350.00);

delimiter//
create procedure accountTransactions(in accountID int)
begin
select * from Transactions
where accountID=accountID
end;
delimiter ;

delimiter // 
create procedure deposit(in accountID int,in amount int )
begin
insert into Transactions(accountID,transacionType, transcationAmount)
values (accountID, "deposit", amount);
update accounts set balance= balance +amount where accountId= accountID;
end;
delimiter ; 

delimiter //
create procedure withdraw(in accountID int, in amount int)
begin
insert into Transactions (accountId,transactionType,transactionAmount)
values(acountID,"withdraw",amount);
update acounts set balance= balance-amount where accountId=accountID;
end;
delimiter ; 
















