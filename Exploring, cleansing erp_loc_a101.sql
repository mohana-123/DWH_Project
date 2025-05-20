-- Final Query
INSERT INTO silver.erp_loc_a101(cid, cntry)
SELECT
	REPLACE(cid,'-', '') AS cid,
	CASE WHEN TRIM(cntry) = 'DE' THEN 'Germany'
		 WHEN TRIM(cntry) IN ('US', 'USA') THEN 'United States'
		 WHEN TRIM(cntry) = '' OR cntry IS NULL THEN 'n/a'
		 ELSE TRIM(cntry)
	END AS cntry
FROM bronze.erp_loc_a101;



select * from silver.erp_loc_a101

-- ========================================================================================================

-- Check data standardisation and consistency

SELECT DISTINCT
	cntry
FROM silver.erp_loc_a101
ORDER BY cntry;