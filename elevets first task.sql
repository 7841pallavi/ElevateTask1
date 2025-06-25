-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS library_db;

USE library_db;

-- Step 2: Create Categories Table
CREATE TABLE categories (
    categoryID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Step 3: Create Authors Table
CREATE TABLE authors (
    authorID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Step 4: Create Books Table
CREATE TABLE books (
    bookID INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    categoryID INT,
    published_year INT,
    FOREIGN KEY (categoryID) REFERENCES categories(categoryID)
);

-- Step 5: Create BookAuthors Table (Many-to-Many relation)
CREATE TABLE book_authors (
    bookID INT,
    authorID INT,
    PRIMARY KEY (bookID, authorID),
    FOREIGN KEY (bookID) REFERENCES books(bookID),
    FOREIGN KEY (authorID) REFERENCES authors(authorID)
);

-- Step 6: Create Members Table
CREATE TABLE members (
    memberID INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE 
);

-- Step 7: Create Loans Table
CREATE TABLE loans (
    loanID INT AUTO_INCREMENT PRIMARY KEY,
    bookID INT,
    memberID INT,
    loan_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (bookID) REFERENCES books(bookID),
    FOREIGN KEY (memberID) REFERENCES members(memberID)
);
