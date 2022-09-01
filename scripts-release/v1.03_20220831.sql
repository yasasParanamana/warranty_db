ALTER TABLE `reg_warranty_claim`
	ADD COLUMN `createdtime` DATETIME;
	
	
ALTER TABLE `reg_warranty_claim`
	ADD COLUMN `createduser` VARCHAR(64);
	
	
Commit;