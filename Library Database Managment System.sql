-- Create a new database named "Library"
CREATE DATABASE Library;

-- Select the "Library" database for further operations
USE Library;

-- Create a table to store information about readers
CREATE TABLE readers (
    reader_id VARCHAR(20),    -- Unique identifier for readers
    fname VARCHAR(20),        -- First name of the reader
    mname VARCHAR(20),        -- Middle name of the reader
    lname VARCHAR(20),        -- Last name of the reader
    city VARCHAR(20),         -- City where the reader resides
    mobileno VARCHAR(15),     -- Mobile number of the reader
    occupation VARCHAR(50),   -- Occupation of the reader
    DOB DATE,                 -- Date of birth of the reader
    CONSTRAINT reader_pk PRIMARY KEY(reader_id)  -- Primary key constraint
);

-- Insert data into the 'readers' table
INSERT INTO readers VALUES ('LABID123A', 'Aarav', 'Vikram', 'Sharma', 'Chandrapur', '9923456789', 'Software Engineer', '1992-03-15');
INSERT INTO readers VALUES('LABID456B', 'Anika', null, 'Patel', 'Surayapur', '9078123456', 'Pediatrician', '1985-11-07');
INSERT INTO readers VALUES('LABID789C', 'Arjun', null, 'Kapoor', 'Rajnagar', '8210987654', 'Architect', '1990-06-22');
INSERT INTO readers VALUES('LABID234D', 'Priya', null, 'Khanna', 'Keralapuri', '7045678901', 'Graphic Designer', '1998-04-10');
INSERT INTO readers VALUES('LABID567E', 'Rohan', 'Suresh', 'Singh', 'Indrapur', '9001234567', 'Financial Analyst', '1993-09-05');
INSERT INTO readers VALUES('LABID890F', 'Naina', 'Deepak', 'Verma', 'Varanasi', '7054321098', 'Environmental Scientist', '1987-01-20');
INSERT INTO readers VALUES('LABID123G', 'Arnav', 'Prakash', 'Joshi', 'Jodhpur', '8209876543', 'Civil Engineer', '1995-10-12');
INSERT INTO readers VALUES('LABID456H', 'Diya', 'Anjali', 'Saha', 'Suryanagari', '9976543210', 'Marketing Manager', '1998-08-03');
INSERT INTO readers VALUES('LABID789I', 'Siddharth', 'Kumar', 'Reddy', 'Vishakhapatnam', '7012345678', 'Aerospace Engineer', '1984-12-18');
INSERT INTO readers VALUES('LABID234J', 'Aisha', 'Sanjana', 'Menon', 'Malabar City', '9087654321', 'Journalist', '1990-02-08');
-- Insert more reader data as needed

-- Create a table to store information about books
CREATE TABLE book (
    bid VARCHAR(6),      -- Unique identifier for books
    bname VARCHAR(40),   -- Name of the book
    bdomain VARCHAR(30), -- Domain or genre of the book
    CONSTRAINT book_bid_pk PRIMARY KEY(bid)  -- Primary key constraint
);

-- Insert data into the 'book' table
INSERT INTO book VALUES ('BID123', 'The Enigma Code', 'Mystery');
INSERT INTO book VALUES('BID234', 'Echoes of Eternity', 'Fantasy');
INSERT INTO book VALUES('BID345', 'Quantum Realms', 'Science Fiction');
-- Insert more book data as needed

-- Create a table to store information about active readers and their associated books
CREATE TABLE active_readers (
    account_id VARCHAR(6),  -- Unique identifier for reader accounts
    reader_id VARCHAR(20),  -- Identifier for readers
    bid VARCHAR(6),         -- Identifier for books
    atype VARCHAR(10),      -- Type of account (e.g., Regular, Premium)
    astatus VARCHAR(10),    -- Status of account (e.g., Active, Terminated)
    CONSTRAINT activereaders_acnumber_pk PRIMARY KEY(account_id),  -- Primary key constraint
    CONSTRAINT account_readerid_fk FOREIGN KEY(reader_id) REFERENCES readers(reader_id),  -- Foreign key constraint
    CONSTRAINT account_bid_fk FOREIGN KEY(bid) REFERENCES book(bid)  -- Foreign key constraint
);

-- Insert data into the 'active_readers' table
INSERT INTO active_readers VALUES ('ACC001', 'LABID123A', 'BID345', 'Premium', 'Terminated');
INSERT INTO active_readers VALUES('ACC002', 'LABID456B', 'BID234', 'Premium', 'Active');
INSERT INTO active_readers VALUES('ACC003', 'LABID789C', 'BID123', 'Regular', 'Suspended');
INSERT INTO active_readers VALUES('ACC004', 'LABID234D', 'BID234', 'Premium', 'Active');
INSERT INTO active_readers VALUES('ACC005', 'LABID567E', 'BID345', 'Regular', 'Terminated');
INSERT INTO active_readers VALUES('ACC006', 'LABID890F', 'BID123', 'Premium', 'Active');
INSERT INTO active_readers VALUES('ACC007', 'LABID123G', 'BID234', 'Regular', 'Suspended');
INSERT INTO active_readers VALUES('ACC008', 'LABID456H', 'BID345', 'Premium', 'Active');
INSERT INTO active_readers VALUES('ACC009', 'LABID789I', 'BID123', 'Regular', 'Active');
INSERT INTO active_readers VALUES('ACC010', 'LABID234J', 'BID234', 'Premium', 'Terminated');
-- Insert more active reader data as needed

-- Create a table to store details of book issues
CREATE TABLE bookissue_details (
    issuenumber INT(6),            -- Unique identifier for book issues
    account_id VARCHAR(6),         -- Identifier for reader accounts
    bid VARCHAR(6),                -- Identifier for books
    bookname VARCHAR(50),          -- Name of the issued book
    number_of_books_issued INT(7), -- Number of books issued
    CONSTRAINT trandetails_tnumber_pk PRIMARY KEY(issuenumber),  -- Primary key constraint
    CONSTRAINT trandetails_acnumber_fk FOREIGN KEY(account_id) REFERENCES active_readers(account_id)  -- Foreign key constraint
);

-- Insert data into the 'bookissue_details' table
INSERT INTO bookissue_details VALUES (101, 'ACC001', 'BID123', 'The Enchanted Forest', 2);
INSERT INTO bookissue_details VALUES (102, 'ACC002', 'BID234', 'Beyond the Horizon', 1);
INSERT INTO bookissue_details VALUES (103, 'ACC003', 'BID345', 'Quantum Leap', 3);
INSERT INTO bookissue_details VALUES (104, 'ACC004', 'BID234', 'Digital Dreams', 1);
INSERT INTO bookissue_details VALUES (105, 'ACC005', 'BID345', 'The Lost City', 2);
INSERT INTO bookissue_details VALUES (106, 'ACC006', 'BID123', 'Astro Adventures', 1);
INSERT INTO bookissue_details VALUES (107, 'ACC007', 'BID234', 'Starlight Serenade', 2);
INSERT INTO bookissue_details VALUES (108, 'ACC008', 'BID345', 'Marketing Mastery', 1);
INSERT INTO bookissue_details VALUES (109, 'ACC009', 'BID123', 'Skyward Bound', 3);
INSERT INTO bookissue_details VALUES (110, 'ACC010', 'BID234', 'Journalism Essentials', 1);
-- Insert more book issue data as needed

-- Query to select all active readers
SELECT * FROM active_readers;

-- Query to select active readers with 'Terminated' status
SELECT * FROM active_readers WHERE astatus='Terminated';

-- Query to select active readers with 'Active' status
SELECT * FROM active_readers WHERE astatus='Active';

-- Query to select active readers with 'Suspended' status
SELECT * FROM active_readers WHERE astatus='Suspended';
