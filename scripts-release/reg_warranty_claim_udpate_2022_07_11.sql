drop table reg_warranty_claim;

CREATE TABLE `reg_warranty_claim` (
	`id` VARCHAR(50) NOT NULL,
	`chassis` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Chassis Number',
	`model` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Model',
	`first_name` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Customer First Name',
	`last_name` VARCHAR(30) NULL DEFAULT NULL COMMENT 'Customer Last Name',
	`phone` VARCHAR(15) NULL DEFAULT NULL COMMENT 'Customer Phone Number',
	`email` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Customer Email',
	`address` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Customer Address',
	`surburb` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Customer Surburb',
	`state` VARCHAR(20) NULL DEFAULT NULL COMMENT 'Customer State',
	`postcode` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Customer Postcode',
	`dealership` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Dealership',
	`claim_type` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Stock Van, To be Delivered,Warranty Start Date',
	`purchasing_date` DATE NULL DEFAULT NULL COMMENT 'Purchasing Date',
	`purchasing_attachment_id` VARCHAR(40) NULL DEFAULT NULL,
	`description` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Description',
	`spareparts_id` VARCHAR(40) NULL DEFAULT NULL COMMENT 'Sparepart Request Id/Not Needed?',
	`failiure_type` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Type of Failiure',
	`failiure_area` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Area of Failiure',
	`repair_type` VARCHAR(10) NULL DEFAULT NULL COMMENT 'Type of Repair',
	`repair_description` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Description of Repair',
	`attachments_id` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Attachments Id/How?',
	`cost_type` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Type of Cost',
	`hours` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Hours',
	`labour_rate` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Labour Rate',
	`total_cost` DECIMAL(10,0) NULL DEFAULT NULL COMMENT 'Total Cost estimated by Dealership',
	`cost_description` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Description of Cost',
	`asignee` VARCHAR(50) NULL DEFAULT NULL,
	`supplier` VARCHAR(50) NULL DEFAULT NULL,
	`status` VARCHAR(16) NULL DEFAULT NULL,
	`is_in_house` TINYINT(1) NULL DEFAULT NULL,
	`in_house_status` VARCHAR(16) NULL DEFAULT NULL,
	`claim_on_supplier` DECIMAL(10,0) NULL DEFAULT NULL COMMENT 'Total Cost claimed by Headoffice',
	`supplier_url_token` VARCHAR(50) NULL DEFAULT NULL,
	`supplier_auth_amount` DECIMAL(10,0) NULL DEFAULT NULL COMMENT 'Total Cost authorized by Supplier',
	`supplier_tracking_num` VARCHAR(50) NULL DEFAULT NULL,
	`supplier_comment` VARCHAR(50) NULL DEFAULT NULL,
	`supplier_invoice` VARCHAR(50) NULL DEFAULT NULL,
	`acknowledged_date` DATE NULL DEFAULT NULL,
	`last_reminded_date` DATE NULL DEFAULT NULL,
	`is_critical` TINYINT(1) NULL DEFAULT '0',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `supplier_url_token` (`supplier_url_token`)
)
COMMENT='Page required. Controlled by price packages.'
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

INSERT INTO `reg_warranty_claim` (`id`, `chassis`, `model`, `first_name`, `last_name`, `phone`, `email`, `address`, `surburb`, `state`, `postcode`, `dealership`, `claim_type`, `purchasing_date`, `purchasing_attachment_id`, `description`, `spareparts_id`, `failiure_type`, `failiure_area`, `repair_type`, `repair_description`, `attachments_id`, `cost_type`, `hours`, `labour_rate`, `total_cost`, `cost_description`, `asignee`, `supplier`, `status`, `is_in_house`, `in_house_status`, `claim_on_supplier`, `supplier_url_token`, `supplier_auth_amount`, `supplier_tracking_num`, `supplier_comment`, `supplier_invoice`, `acknowledged_date`, `last_reminded_date`, `is_critical`) VALUES ('WDC-00005', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, '2022-07-03', NULL, NULL, '111', 'CRASH', 'DOOR', 'REPACE', 'Replace new Door', NULL, NULL, '4', '2.5', 12, 'Labour cost + handle fee', 'Mark', 'SUP-16562738117', 'WAR_REJECTED_SU', 0, NULL, 14, '11111111115', 0, NULL, 'HA HA - WAR_ACKNOW', NULL, '2022-07-07', NULL, NULL);
INSERT INTO `reg_warranty_claim` (`id`, `chassis`, `model`, `first_name`, `last_name`, `phone`, `email`, `address`, `surburb`, `state`, `postcode`, `dealership`, `claim_type`, `purchasing_date`, `purchasing_attachment_id`, `description`, `spareparts_id`, `failiure_type`, `failiure_area`, `repair_type`, `repair_description`, `attachments_id`, `cost_type`, `hours`, `labour_rate`, `total_cost`, `cost_description`, `asignee`, `supplier`, `status`, `is_in_house`, `in_house_status`, `claim_on_supplier`, `supplier_url_token`, `supplier_auth_amount`, `supplier_tracking_num`, `supplier_comment`, `supplier_invoice`, `acknowledged_date`, `last_reminded_date`, `is_critical`) VALUES ('WAR-00001', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, '2022-07-03', NULL, NULL, '111', 'CRASH', 'DOOR', 'REPLACE', 'Replace new Door', NULL, NULL, '4', '2.5', 12, 'Labour cost + handle fee', 'Mark', 'SUP-16562738117', 'WAR_APPROVE', 0, NULL, 10, '9b1deb4d-3b7d-4bad-9bdd-2b0d7b3dcb00', 8, 'JDFHUL-9056417', 'HA HA - WAR_ACKNOW', 'HA HA - WAR_ACKNOW', NULL, '2022-07-01', NULL);
INSERT INTO `reg_warranty_claim` (`id`, `chassis`, `model`, `first_name`, `last_name`, `phone`, `email`, `address`, `surburb`, `state`, `postcode`, `dealership`, `claim_type`, `purchasing_date`, `purchasing_attachment_id`, `description`, `spareparts_id`, `failiure_type`, `failiure_area`, `repair_type`, `repair_description`, `attachments_id`, `cost_type`, `hours`, `labour_rate`, `total_cost`, `cost_description`, `asignee`, `supplier`, `status`, `is_in_house`, `in_house_status`, `claim_on_supplier`, `supplier_url_token`, `supplier_auth_amount`, `supplier_tracking_num`, `supplier_comment`, `supplier_invoice`, `acknowledged_date`, `last_reminded_date`, `is_critical`) VALUES ('WDC-00001', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, '2022-07-03', NULL, NULL, '111', 'CRASH', 'DOOR', 'REPLACE', 'Replace new Door', NULL, NULL, '4', '2.5', 12, 'Labour cost + handle fee', 'Mark', 'SUP-16562738117', 'WAR_ACKNOW', 0, NULL, 10, '11111111111', 8, NULL, 'Yeet', 'HA HA - WAR_ACKNOW', '2022-06-01', '2022-07-03', NULL);
INSERT INTO `reg_warranty_claim` (`id`, `chassis`, `model`, `first_name`, `last_name`, `phone`, `email`, `address`, `surburb`, `state`, `postcode`, `dealership`, `claim_type`, `purchasing_date`, `purchasing_attachment_id`, `description`, `spareparts_id`, `failiure_type`, `failiure_area`, `repair_type`, `repair_description`, `attachments_id`, `cost_type`, `hours`, `labour_rate`, `total_cost`, `cost_description`, `asignee`, `supplier`, `status`, `is_in_house`, `in_house_status`, `claim_on_supplier`, `supplier_url_token`, `supplier_auth_amount`, `supplier_tracking_num`, `supplier_comment`, `supplier_invoice`, `acknowledged_date`, `last_reminded_date`, `is_critical`) VALUES ('WDC-00002', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, NULL, NULL, NULL, '222', 'CRASH', 'DOOR', 'MODIFY', 'Modify damaged door', NULL, NULL, '6', '2.5', 18, 'Labour cost + handle fee', NULL, NULL, 'PEND', 1, NULL, NULL, '11111111112', NULL, NULL, NULL, 'HA HA - WAR_ACKNOW', NULL, '2022-07-02', NULL);
INSERT INTO `reg_warranty_claim` (`id`, `chassis`, `model`, `first_name`, `last_name`, `phone`, `email`, `address`, `surburb`, `state`, `postcode`, `dealership`, `claim_type`, `purchasing_date`, `purchasing_attachment_id`, `description`, `spareparts_id`, `failiure_type`, `failiure_area`, `repair_type`, `repair_description`, `attachments_id`, `cost_type`, `hours`, `labour_rate`, `total_cost`, `cost_description`, `asignee`, `supplier`, `status`, `is_in_house`, `in_house_status`, `claim_on_supplier`, `supplier_url_token`, `supplier_auth_amount`, `supplier_tracking_num`, `supplier_comment`, `supplier_invoice`, `acknowledged_date`, `last_reminded_date`, `is_critical`) VALUES ('WDC-00004', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, '2022-07-03', NULL, NULL, '111', 'CRASH', 'DOOR', 'REPLACE', 'Replace new Door', NULL, NULL, '4', '2.5', 12, 'Labour cost + handle fee', 'Mark', 'SUP-16562738117', 'PEND', 0, NULL, 10, '11111111113', 8, NULL, NULL, 'HA HA - WAR_ACKNOW', NULL, '2022-07-03', NULL);
INSERT INTO `reg_warranty_claim` (`id`, `chassis`, `model`, `first_name`, `last_name`, `phone`, `email`, `address`, `surburb`, `state`, `postcode`, `dealership`, `claim_type`, `purchasing_date`, `purchasing_attachment_id`, `description`, `spareparts_id`, `failiure_type`, `failiure_area`, `repair_type`, `repair_description`, `attachments_id`, `cost_type`, `hours`, `labour_rate`, `total_cost`, `cost_description`, `asignee`, `supplier`, `status`, `is_in_house`, `in_house_status`, `claim_on_supplier`, `supplier_url_token`, `supplier_auth_amount`, `supplier_tracking_num`, `supplier_comment`, `supplier_invoice`, `acknowledged_date`, `last_reminded_date`, `is_critical`) VALUES ('WDC-00003', '1134533', 'MOD-0001', 'Jayana', 'Illuwkatte', '875676766', 'jayana@gmail.com', 'Kegalle', NULL, NULL, NULL, 'DEAL-0002', NULL, '2022-07-03', NULL, NULL, '111', 'CRASH', 'DOOR', 'REPLACE', 'Replace new Door', NULL, NULL, '4', '2.5', 12, 'Labour cost + handle fee', 'Mark', 'SUP-16562738117', 'PEND', 0, NULL, 10, '11111111114', 8, NULL, NULL, 'HA HA - WAR_ACKNOW', NULL, '2022-07-04', NULL);
