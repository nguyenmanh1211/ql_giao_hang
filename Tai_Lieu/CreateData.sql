USE quanligiaohangdb;


INSERT INTO quanligiaohangdb.user (`created_on`, `updated_on`, `email`, `full_name`, `is_active`, `password`) 
VALUE (1601518287000, 1601518287000, 'a@gmail.com', N'Nguyễn Văn User 1', 1, '123456')

INSERT INTO quanligiaohangdb.role (`created_on`, `updated_on`, `code`, `name`)
VALUE (1601518287000, 1601518287000, 'R001', 'USER')

INSERT INTO quanligiaohangdb.user_role (`user_id`, `role_id`)
VALUE (2, 1)

INSERT INTO quanligiaohangdb.customer (`created_on`, `updated_on`, `address`, `ward`, `district`, `province`,`code`, `email`, `is_active`, `name`, `phone`)
VALUE (1601518287000, 1601518287000, N'Tòa nhà Ladeco', N'266 Đội Cấn', N'Ba Đình', N'Hà Nội', 'CUS0001', 'customer01@gmail.com', 1, N'Nguyễn Văn Customer 1', '0912312345')

INSERT INTO quanligiaohangdb.accounting (`created_on`, `updated_on`, `code`, `money_customer`, `transport_fee`, `customer_id`) 
VALUE (1601518287000, 1601518287000, 'ACC001', 100000, 12000, 1)

INSERT INTO quanligiaohangdb.address (`created_on`, `updated_on`, `address`, `ward`, `district`, `province`, `name`, `phone`, `status`, `customer_id`)
VALUE (1601518287000, 1601518287000, N'Tòa nhà Ladeco', N'266 Đội Cấn', N'Ba Đình', N'Hà Nội', N'Công ty Sapo', '0912312345', 1, 1)

INSERT INTO quanligiaohangdb.shipper (`created_on`, `updated_on`, `address`, `charge_area`, `code`, `description`, `email`, `name`, `is_active`, `phone`)
VALUE (1601518287000, 1601518287000,)

INSERT INTO quanligiaohangdb.products (`created_on`, `updated_on`,  `brand`,  `category`,  `code`, `description`,  `is_active`,  `mass`,  `name`,  `picture_path`,  `product_price`,  `quantity`)
VALUE (1601518287000, 1601518287000,)

INSERT INTO quanligiaohangdb.amount_customer_product (`created_on`, `updated_on`, `quantity`, `customer_id`, `product_id`)
VALUE (1601518287000, 1601518287000, 10, 1, 1)

INSERT INTO quanligiaohangdb.receipts (`created_on`, `updated_on`, `code`, `import_status`, `note`, `pay_status`, `status`, `tag`, `customer_id`)
VALUE (1601518287000, 1601518287000,)

INSERT INTO quanligiaohangdb.refund (`created_on`, `updated_on`, `code`, `note`, `customer_id`)
VALUE (1601518287000, 1601518287000,)

INSERT INTO quanligiaohangdb.tags (`created_on`, `updated_on`, `value`)
VALUE (1601518287000, 1601518287000,)

INSERT INTO quanligiaohangdb.product_receipts (`created_on`, `updated_on`, `quantity`, `product_id`, `receipt_id`) 
VALUE (1601518287000, 1601518287000,)

INSERT INTO quanligiaohangdb.product_refund (`created_on`, `updated_on`,  `quantity`, `product_id`, `refund_id`)
VALUE (1601518287000, 1601518287000,)

INSERT INTO quanligiaohangdb.product_tags (`product_id`, `tag_id`)
VALUE ()

INSERT INTO quanligiaohangdb.images (`is_active`, `path`, `product_id`)
VALUE ()

INSERT INTO quanligiaohangdb.fulfillment (`created_on`, `updated_on`, `cancelation_date`,  `code`,  `delivery_date`, `description`,  `payment_method`,  `payment_status`,  `shipping_payment_method`,  `shipping_status`,  `success_delivery_date`,  `total_money`,  `transport_fee`,  `calculation_id`,  `customer_id`,  `shipper_id`,  `shipping_from`,  `shipping_to`,  `user_id`)
VALUE (1601518287000, 1601518287000,)

INSERT INTO quanligiaohangdb.fulfillment_detail (`created_on`, `updated_on`, `price`, `quantity`, `fulfillment_id`, `product_id`)
VALUE (1601518287000, 1601518287000,)

INSERT INTO quanligiaohangdb.history_dialog (`created_on`, `updated_on`, `name`, `fulfillment_id`)
VALUE (1601518287000, 1601518287000,)


