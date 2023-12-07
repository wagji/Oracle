create user C##HR identified by 1234
default tablespace USERS
temporary tablespace TEMP;

grant resource, connect to C##HR;

alter user c##HR quota unlimited on USERS;