-- Final Query
INSERT INTO silver.erp_cust_az12(
	cid,
	bdate,
	gen
)
SELECT
	CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid, 4, LEN(cid))
		ELSE cid
	END AS cid,
	CASE WHEN bdate > GETDATE() THEN NULL
		ELSE bdate
	END bdate,
	CASE WHEN UPPER(TRIM(gen)) IN ('F','FEMALE') THEN 'Female'
		 WHEN UPPER(TRIM(gen)) IN ('M','MALE') THEN 'Male'
		 ELSE 'n/a'
	END AS gen
FROM bronze.erp_cust_az12

SELECT * FROM silver.erp_cust_az12
-- ====================================================================================================>


select * from silver.crm_cust_info

--check nulls in cid
SELECT
	cid
FROM silver.erp_cust_az12
WHERE cid IS NULL

-- Identify out-of-range Dates

SELECT 
	DISTINCT 
	bdate,
	CASE WHEN bdate > GETDATE() THEN NULL
		ELSE bdate
	END bdate_af
FROM silver.erp_cust_az12
WHERE bdate > GETDATE()

-- Data standardisation and consistency

SELECT 
	gen,
	count(*)
FROM silver.erp_cust_az12
group by gen

SELECT DISTINCT
	gen
FROM silver.erp_cust_az12