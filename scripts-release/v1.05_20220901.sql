ALTER TABLE `reg_warranty_claim`
	ADD COLUMN `lastupdatedtime`DATETIME;
	
	
ALTER TABLE `reg_warranty_claim`
	ADD COLUMN `lastupdateduser` VARCHAR(64);
	
	
Commit;