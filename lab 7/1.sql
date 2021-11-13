--1.1
--Large objects (photos, videos, CAD files, etc.) are stored as a large object:
--• blob: binary large object -- object is a large collection of uninterpreted binary data
-- (whose interpretation is left to an application outside of the database system)
--• clob: character large object -- object is a large collection of character data
--2
--Privilege is to give the user access to modify databases
-- Role and user use this privileges.
-- Role can either be a user or group of users, depends on how the role is set up
--2
--	create accountant, administrator, support roles and grant appropriate privileges
create role accountant;
grant select on transactions to accountant;
create role administrator;
grant insert, delete on accounts, customers, transactions to administrator;
create role support;
grant update on accounts, customers to support;
--	create some users and assign them roles,
create user Anna;
create user Alice;
grant support to Anna;
grant accountant to Alice;
--	give to some of them permission to grant roles to other users
grant select on transactions to Anna with grant option;
--	revoke some privilege from particular user
revoke select on transactions from Anna;
--3.2

ALTER TABLE transactions
    ALTER COLUMN date SET NOT NULL,
    ALTER COLUMN src_account SET NOT NULL,
    ALTER COLUMN dst_account SET NOT NULL,
    ALTER COLUMN amount SET NOT NULL,
    ALTER COLUMN status SET NOT NULL;
--5
CREATE UNIQUE INDEX curr on accounts (account_id, customer_id, currency);
CREATE INDEX checkk on accounts (account_id, currency, balance);
--6
begin;
INSERT INTO transactions VALUES (4, '2021-08-05 18:02:45.000000', 'RS88012', 'NT10204', 1000, 'init');
update accounts set balance=balance+1000 where account_id='NT10204';
update accounts set balance=balance-1000 where account_id='RS88012';

rollback;
update transactions set status='rollback' where id=4;

update transactions set status='commit' where id=4;
commit;
