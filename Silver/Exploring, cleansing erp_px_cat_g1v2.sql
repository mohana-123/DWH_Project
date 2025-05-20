-- Final Query
INSERT INTO silver.erp_px_cat_g1v2(
	id,
	cat,
	subcat,
	maintenance
)
SELECT 
	id,
	cat,
	subcat,
	maintenance
FROM bronze.erp_px_cat_g1v2;

SELECT * FROM silver.erp_px_cat_g1v2
-- ==============================================================================

-- check for unwanted spaces

SELECT *
FROM bronze.erp_px_cat_g1v2
WHERE cat != TRIM(cat) OR subcat != TRIM(subcat) OR maintenance != TRIM(maintenance)


-- Data standardisation and Consistency

SELECT DISTINCT
	cat
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT
	subcat
FROM bronze.erp_px_cat_g1v2

SELECT DISTINCT
	maintenance
FROM bronze.erp_px_cat_g1v2