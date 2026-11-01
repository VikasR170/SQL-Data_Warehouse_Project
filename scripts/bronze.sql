-- Creating TABLE BRONZE

CREATE TABLE bronze.crm_cust_info(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr  NVARCHAR(50),
	cst_create_date DATE
);

GO

CREATE TABLE bronze.crm_prd_info (
    prd_id INT,
    prd_key NVARCHAR(50),
    prd_nm NVARCHAR(50),
    prd_cost INT,
    prd_line NVARCHAR(50),
    prd_start_dt DATE,
    prd_end_dt DATE

);

GO

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT,
    sls_ship_dt  INT,
    sls_due_dt   INT,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);
GO

CREATE TABLE bronze.erp_loc_a101 (
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);
GO

CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);
GO

CREATE TABLE bronze.erp_px_cat_g1v2 (
    id           NVARCHAR(50),
    cat          NVARCHAR(50),
    subcat       NVARCHAR(50),
    maintenance  NVARCHAR(50)
);
GO


-- =============================================
-- STORED PROCEDURE: LOAD BRONZE LAYER
-- =============================================

EXEC bronze.load_bronze;

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN

    PRINT '=====================================';
    PRINT 'STARTING BRONZE LAYER DATA LOAD';
    PRINT '=====================================';


    -- =============================================
    -- CRM TABLES
    -- =============================================

    PRINT ' ';
    PRINT 'Loading CRM data...';

    -- 1. Load CRM Customer Information
    PRINT 'Loading table: bronze.crm_cust_info';

    TRUNCATE TABLE bronze.crm_cust_info;

    BULK INSERT bronze.crm_cust_info
    FROM 'C:\Users\VIKAS RAJBHAR\OneDrive\Desktop\Sql warehouse project\datasets\source_crm\cust_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT 'Loaded table: bronze.crm_cust_info';


    -- 2. Load CRM Product Information
    PRINT 'Loading table: bronze.crm_prd_info';
    TRUNCATE TABLE bronze.crm_prd_info;

    BULK INSERT bronze.crm_prd_info
    FROM 'C:\Users\VIKAS RAJBHAR\OneDrive\Desktop\Sql warehouse project\datasets\source_crm\prd_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT 'Loaded table: bronze.crm_prd_info';


    -- 3. Load CRM Sales Details
    PRINT 'Loading table: bronze.crm_sales_details';
    TRUNCATE TABLE bronze.crm_sales_details;

    BULK INSERT bronze.crm_sales_details
    FROM 'C:\Users\VIKAS RAJBHAR\OneDrive\Desktop\Sql warehouse project\datasets\source_crm\sales_details.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT 'Loaded table: bronze.crm_sales_details';


    PRINT 'CRM data loading completed.';


    -- =============================================
    -- ERP TABLES
    -- =============================================

    PRINT ' ';
    PRINT 'Loading ERP data...';


    -- 4. Load ERP Location Data
    PRINT 'Loading table: bronze.erp_loc_a101';

    TRUNCATE TABLE bronze.erp_loc_a101;
    BULK INSERT bronze.erp_loc_a101
    FROM 'C:\Users\VIKAS RAJBHAR\OneDrive\Desktop\Sql warehouse project\datasets\source_erp\LOC_A101.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT 'Loaded table: bronze.erp_loc_a101';


    -- 5. Load ERP Customer Data
    PRINT 'Loading table: bronze.erp_cust_az12';

    TRUNCATE TABLE bronze.erp_cust_az12;
    BULK INSERT bronze.erp_cust_az12
    FROM 'C:\Users\VIKAS RAJBHAR\OneDrive\Desktop\Sql warehouse project\datasets\source_erp\CUST_AZ12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT 'Loaded table: bronze.erp_cust_az12';


    -- 6. Load ERP Product Category Data
    PRINT 'Loading table: bronze.erp_px_cat_g1v2';

    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    BULK INSERT bronze.erp_px_cat_g1v2
    FROM 'C:\Users\VIKAS RAJBHAR\OneDrive\Desktop\Sql warehouse project\datasets\source_erp\PX_CAT_G1V2.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        TABLOCK
    );

    PRINT 'Loaded table: bronze.erp_px_cat_g1v2';


    PRINT 'ERP data loading completed.';


    -- =============================================
    -- LOAD COMPLETED
    -- =============================================

    PRINT ' ';
    PRINT '=====================================';
    PRINT 'BRONZE LAYER DATA LOAD COMPLETED!';
    PRINT '=====================================';

END;

