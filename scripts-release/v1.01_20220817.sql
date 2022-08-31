CREATE TABLE `state` (
	`state_id` VARCHAR(10) NOT NULL COLLATE 'utf8mb4_general_ci',
	`state_name` VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`status` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`state_id`) USING BTREE
)
COMMENT='No page needed. One time data'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;


ALTER TABLE `web_systemuser`
	ADD COLUMN `DEALERSHIP` VARCHAR(20);