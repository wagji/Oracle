CREATE TABLE ORDER10 (
    ORD_ID NUMBER(6) NOT NULL CONSTRAINT PK_ORDER10_ORD_ID PRIMARY KEY,
    M_ID NUMBER(4) NOT NULL, -- FK: MEMBER10 (M_ID)
    PRO_ID NUMBER(6) NOT NULL, -- FK: PRODUCT10 (PRO_ID)
    CONSTRAINT FK_ORDER10_M_ID FOREIGN KEY (M_ID) REFERENCES MEMBER10(M_ID),
    CONSTRAINT FK_ORDER10_PRO_ID FOREIGN KEY (PRO_ID) REFERENCES PRODUCT10(PRO_ID)
 ) ;