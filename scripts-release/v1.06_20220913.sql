ALTER TABLE `reg_warranty_attachments`
	ADD COLUMN `attachment_type` VARCHAR(10) NULL DEFAULT NULL AFTER `createdtime`;
	
	COMMIT;