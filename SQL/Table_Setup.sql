-- ============================================================
-- FinNova Digital Lending Analytics
-- Snowflake Database & Raw Layer Setup
-- ============================================================

-- 1. Create database
CREATE DATABASE IF NOT EXISTS FINNOVA_DB;

USE DATABASE FINNOVA_DB;

-- 2. Create schemas
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS ANALYTICS;

-- 3. Use RAW schema
USE SCHEMA RAW;

-- 4. Create internal stage for data loading
CREATE OR REPLACE STAGE FINNOVA_STAGE;

-- ============================================================
-- Raw Tables
-- ============================================================

-- Customers
-- Expected cleaned row count: 50,000

-- Applications
-- Expected cleaned row count: 100,000

-- Credit Assessments
-- Expected cleaned row count: 100,000

-- Loans
-- Expected row count: 48,702

-- Repayments
-- Expected cleaned row count: 465,782

-- Collections
-- Expected row count: 31,477

-- Loan Status History
-- Expected cleaned row count: 465,782

-- ============================================================
-- Data Loading
-- ============================================================

-- CSV files were loaded into the RAW schema using
-- the FINNOVA_STAGE internal Snowflake stage.

-- ============================================================
-- Validation
-- ============================================================

SELECT COUNT(*) AS CUSTOMER_COUNT
FROM FINNOVA_DB.RAW.CUSTOMERS;

SELECT COUNT(*) AS APPLICATION_COUNT
FROM FINNOVA_DB.RAW.APPLICATIONS;

SELECT COUNT(*) AS CREDIT_ASSESSMENT_COUNT
FROM FINNOVA_DB.RAW.CREDIT_ASSESSMENTS;

SELECT COUNT(*) AS LOAN_COUNT
FROM FINNOVA_DB.RAW.LOANS;

SELECT COUNT(*) AS REPAYMENT_COUNT
FROM FINNOVA_DB.RAW.REPAYMENTS;

SELECT COUNT(*) AS COLLECTION_COUNT
FROM FINNOVA_DB.RAW.COLLECTIONS;

SELECT COUNT(*) AS LOAN_STATUS_HISTORY_COUNT
FROM FINNOVA_DB.RAW.LOAN_STATUS_HISTORY;