CREATE TABLE PRODUCTS (
    MFR_ID CHAR(3) NOT NULL,
    PRODUCT_ID CHAR(5) NOT NULL,
    [DESCRIPTION] VARCHAR(50) NOT NULL,
    PRICE DECIMAL(9, 2) NOT NULL,
    QTY_ON_HAND INT NOT NULL,
    CONSTRAINT PK_PRODUCTS PRIMARY KEY (MFR_ID, PRODUCT_ID)
);

CREATE TABLE OFFICES (
    OFFICE INT NOT NULL,
    CITY VARCHAR(15) NOT NULL UNIQUE,
    REGION VARCHAR(10) NOT NULL DEFAULT 'Eastern',
    MGR INT DEFAULT 106,
    [TARGET] DECIMAL(9, 2) CHECK ([TARGET] >= 0),
    SALES DECIMAL(9, 2) NOT NULL DEFAULT 0.00,
    CONSTRAINT PK_OFFICES PRIMARY KEY (OFFICE)
);


CREATE TABLE SALESREPS (
    EMPL_NUM INT NOT NULL PRIMARY KEY CHECK (EMPL_NUM BETWEEN 101 AND 199),
    NAME VARCHAR(15) NOT NULL,
    AGE INT CHECK (AGE >= 21),
    REPOFFICE INT,
    TITLE VARCHAR(10),
    HIREDATE DATE NOT NULL,
    MANAGER INT,
    QUOTA DECIMAL(9, 2) CHECK (QUOTA >= 0),
    SALES DECIMAL(9, 2) NOT NULL
);

ALTER TABLE SALESREPS
ADD CONSTRAINT FK_SALESREPS_MANAGER FOREIGN KEY (MANAGER) REFERENCES SALESREPS(EMPL_NUM);


ALTER TABLE OFFICES
ADD CONSTRAINT FK_OFFICES_MANAGER FOREIGN KEY (MGR) REFERENCES SALESREPS(EMPL_NUM);

