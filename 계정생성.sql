create user C##HR1 identified by 1234
default tablespace USERS
temporary tablespace TEMP;

grant resource, connect to C##HR1;

alter user c##HR1 quota unlimited on USERS;

GRANT RESOURCE,CONNECT TO C##HR1;
GRANT CREATE VIEW TO C##HR1;


