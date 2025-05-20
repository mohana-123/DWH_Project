/*
SELECT TOP(100) * FROM bronze.crm_cust_info;

SELECT TOP(100) * FROM bronze.crm_prd_info;

SELECT TOP(100) * FROM bronze.crm_sales_details;

SELECT TOP(100) * FROM bronze.erp_cust_az12;

SELECT TOP(100) * FROM bronze.erp_loc_a101;

SELECT TOP(100) * FROM bronze.erp_px_cat_g1v2;
*/

-- check for nulls or duplicates in primary keys
-- Expectation: No Result

--SELECT TOP(100) * FROM bronze.crm_cust_info;


-- Queries for data transformation and data cleansing

-- check for the NULLS or duplicates in primary key
-- expectation: no results

SELECT
	cst_id,
	COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*) > 1 OR cst_id IS NULL 

-- check where are unwanted spaces
-- Expection: No Results

SELECT
	cst_key
FROM bronze.crm_cust_info
WHERE cst_key != TRIM(cst_key)

SELECT
	cst_lastname
FROM bronze.crm_cust_info
WHERE cst_lastname != TRIM(cst_lastname)


-- Data Standardisation and Consistency

SELECT
	DISTINCT cst_gndr
FROM bronze.crm_cust_info

-- FINAL CLEANSED QUERY

INSERT INTO silver.crm_cust_info(
	cst_id,
	cst_key,
	cst_firstname,
	cst_lastname,
	cst_marital_status,
	cst_gndr,
	cst_create_date
)
SELECT
	cst_id,
	cst_key,
	TRIM(cst_firstname) AS cst_firstname,
	TRIM(cst_lastname) AS cst_lastname,
	CASE WHEN UPPER(TRIM(cst_marital_status)) = 'S' THEN 'SINGLE'
		 WHEN UPPER(TRIM(cst_marital_status)) = 'M' THEN 'MARRIED'
		 ELSE 'n/a'
	END AS cst_marital_status,
	CASE WHEN UPPER(TRIM(cst_gndr)) = 'F' THEN 'FEMALE'
		 WHEN UPPER(TRIM(cst_gndr)) = 'M' THEN 'MALE'
		 ELSE 'n/a'
	END AS cst_gndr,
	cst_create_date
FROM
(
	SELECT
		*,
		ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date DESC) AS Flag_last
	FROM bronze.crm_cust_info
	WHERE cst_id IS NOT NULL
)T 
WHERE Flag_last = 1 


-- Final table

SELECT * FROM silver.crm_cust_info