--2024-08-23--
CREATE TABLE IF NOT EXISTS dealer_shop (
                                           id INT AUTO_INCREMENT PRIMARY KEY,
                                           shop_name VARCHAR(50)  COMMENT '店铺名称',
    shop_address VARCHAR(100)  COMMENT '店铺地址',
    shop_description VARCHAR(500)  COMMENT '店铺描述',
    shop_state INT(2) COMMENT '店铺状态(0:关闭,1:审核中,2:正常)',
    user_uid  VARCHAR(64) COMMENT '所属用户uid',
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间'
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='经销商店铺表';

CREATE TABLE IF NOT EXISTS dealer_product (
                                              id VARCHAR(64)  PRIMARY KEY,
    product_name VARCHAR(50)  COMMENT '商品名称',
    product_category INT(10)  COMMENT '商品类别',
    product_price DOUBLE  COMMENT '商品单价',
    product_inventory INT(10) COMMENT '商品库存',
    dealer_id  int(10) COMMENT '所属店铺id',
    product_delete int(1)  COMMENT '商品状态(0:删除,1:正常,2:已下架)',
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE        CURRENT_TIMESTAMP COMMENT '修改时间'
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='经销商商品表';


CREATE TABLE IF NOT EXISTS orders (
                                      order_id VARCHAR(64)  PRIMARY KEY,
    user_id  BIGINT(10) COMMENT '用户id',
    dealer_shop_id  VARCHAR(64) COMMENT '经销商店铺id',
    product_id  VARCHAR(64) COMMENT '商品id',
    order_num  int(10) COMMENT '购买商品数量',
    order_state int(1)  COMMENT '订单状态(1：新建,:2：待支付,:3：已发货,:4：完成)',
    create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE        CURRENT_TIMESTAMP COMMENT '修改时间'
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='订单表';

