CREATE TABLE `reg_warranty_attachments` (
   attachment_id INT(11) NOT NULL AUTO_INCREMENT ,
	warranty_id VARCHAR(50) NOT NULL ,
	file_name VARCHAR(20) NULL ,
	file_format VARCHAR(10) NULL DEFAULT NULL ,
	attachment_file VARCHAR(20) NULL DEFAULT NULL,
	createdtime DATETIME NULL DEFAULT NULL,
	PRIMARY KEY (attachment_id) USING BTREE
)
;

COMMIT;