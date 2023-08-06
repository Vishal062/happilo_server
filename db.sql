-- Adminer 4.8.1 PostgreSQL 15.0 dump

DROP TABLE IF EXISTS "tbl_address";
DROP SEQUENCE IF EXISTS tbl_address_id_seq;
CREATE SEQUENCE tbl_address_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_address" (
    "id" integer DEFAULT nextval('tbl_address_id_seq') NOT NULL,
    "customer_id" integer NOT NULL,
    "address_type" character varying NOT NULL,
    "area_id" integer NOT NULL,
    CONSTRAINT "tbl_address_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."tbl_address"."address_type" IS 'e.g. Home, Work';


DROP TABLE IF EXISTS "tbl_area";
DROP SEQUENCE IF EXISTS tbl_area_id_seq;
CREATE SEQUENCE tbl_area_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_area" (
    "id" integer DEFAULT nextval('tbl_area_id_seq') NOT NULL,
    "name" character varying(999) NOT NULL,
    "city" character varying(255) NOT NULL,
    "state" character varying(255) NOT NULL,
    "pin_code" character varying(100) NOT NULL,
    "country" character varying(255) NOT NULL,
    CONSTRAINT "tbl_area_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."tbl_area"."name" IS 'Area Name / Street Name';


DROP TABLE IF EXISTS "tbl_banner";
DROP SEQUENCE IF EXISTS tbl_banner_id_seq1;
CREATE SEQUENCE tbl_banner_id_seq1 INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_banner" (
    "id" integer DEFAULT nextval('tbl_banner_id_seq1') NOT NULL,
    "image_id" integer NOT NULL,
    "status" smallint NOT NULL,
    "date_added" timestamp NOT NULL,
    CONSTRAINT "tbl_banner_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_banner" ("id", "image_id", "status", "date_added") VALUES
(8,	28,	1,	'2023-08-06 16:45:18.372'),
(9,	29,	1,	'2023-08-06 16:45:18.373'),
(10,	30,	1,	'2023-08-06 16:45:18.38'),
(11,	31,	1,	'2023-08-06 16:45:18.382'),
(12,	32,	1,	'2023-08-06 16:45:18.388'),
(13,	33,	1,	'2023-08-06 16:45:18.398'),
(14,	34,	1,	'2023-08-06 16:45:18.511');

DROP TABLE IF EXISTS "tbl_brand_logo";
DROP SEQUENCE IF EXISTS tbl_brand_logo_id_seq;
CREATE SEQUENCE tbl_brand_logo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_brand_logo" (
    "id" integer DEFAULT nextval('tbl_brand_logo_id_seq') NOT NULL,
    "image_id" integer NOT NULL,
    "status" smallint NOT NULL,
    "date_added" character varying NOT NULL,
    CONSTRAINT "tbl_brand_logo_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_brand_logo" ("id", "image_id", "status", "date_added") VALUES
(1,	3,	0,	'2023-08-06T15:14:49.253+05:30'),
(2,	4,	0,	'2023-08-06T15:16:07.919+05:30'),
(3,	19,	0,	'2023-08-06T16:37:49.674+05:30'),
(4,	20,	0,	'2023-08-06T16:41:42.820+05:30'),
(5,	35,	1,	'2023-08-06T16:46:13.533+05:30');

DROP TABLE IF EXISTS "tbl_categories";
DROP SEQUENCE IF EXISTS tbl_categories_id_seq;
CREATE SEQUENCE tbl_categories_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_categories" (
    "id" integer DEFAULT nextval('tbl_categories_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    CONSTRAINT "tbl_categories_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_customer";
DROP SEQUENCE IF EXISTS tbl_customer_id_seq;
CREATE SEQUENCE tbl_customer_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_customer" (
    "id" integer DEFAULT nextval('tbl_customer_id_seq') NOT NULL,
    "first_name" character varying(100),
    "last_name" character varying(100) NOT NULL,
    "email" character varying(100) NOT NULL,
    "phone" character varying(100) NOT NULL,
    "password" character varying(255) NOT NULL,
    "status" smallint,
    "image_id" integer,
    CONSTRAINT "tbl_customer_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."tbl_customer"."image_id" IS 'Profile Pic referring image table';


DROP TABLE IF EXISTS "tbl_discounts";
DROP SEQUENCE IF EXISTS tbl_discounts_id_seq;
CREATE SEQUENCE tbl_discounts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_discounts" (
    "id" integer DEFAULT nextval('tbl_discounts_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "seller_id" integer NOT NULL,
    "discount_percentage" integer,
    "start_date" date,
    "end_date" date,
    CONSTRAINT "tbl_discounts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_image";
DROP SEQUENCE IF EXISTS tbl_image_id_seq;
CREATE SEQUENCE tbl_image_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_image" (
    "id" integer DEFAULT nextval('tbl_image_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "original_name" character varying(255) NOT NULL,
    "date_added" timestamp NOT NULL,
    CONSTRAINT "tbl_image_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_image" ("id", "name", "original_name", "date_added") VALUES
(3,	'1691315089123-97084b1ce4e208c8cea322dfbeb33e56454acf71.png',	'logohappilo.png',	'2023-08-06 15:14:49.235'),
(4,	'1691315167821-fb1d1cf55e9ac9c9b354f4dd5e4798f0d9382567.png',	'logohappilo.png',	'2023-08-06 15:16:07.909'),
(12,	'1691316041540-8493a10799f38de67d8c4932b5dae5cc1a76f59f.webp',	'Frame_30_1.webp',	'2023-08-06 15:30:41.623'),
(13,	'1691316041535-17f77637e81c1ead5da5e8eab20199ef01de52bb.webp',	'Announcement_IPL_Banner_Desktop_1lakh_Ticket_Desktop_1_2_1728x.webp',	'2023-08-06 15:30:41.624'),
(14,	'1691316041546-3beb51fd50b9a50cea11444dd82506a2f57c914b.webp',	'Happilo_Website_Banners_11112022_Chocolate_Spread_1512X515_88a2608e-f6e5-49bd-a547-c85270cdbdf3.webp',	'2023-08-06 15:30:41.636'),
(15,	'1691316041545-6377b16586906048dd64d7a395e194f0840b3d68.webp',	'Happilo_Website_Banners_11112022_Barfi_Brittles_1512X515_Option_1_1.webp',	'2023-08-06 15:30:41.645'),
(16,	'1691316041546-c9c2b341a789c8088f45fe2202147123f8670371.webp',	'Main_IPL_Banner_Desktop_IPL_Main_Banner_DESKTOP_1_1728x.webp',	'2023-08-06 15:30:41.648'),
(17,	'1691316041547-acf9314947b10270b305735457fe7248c20ad8c9.webp',	'Marvel-desk_1728x.webp',	'2023-08-06 15:30:41.649'),
(18,	'1691316041548-c861988a4a0c81abc9644304566b5cddcfcf0018.webp',	'NEWLY_UPDATED_ipl_desktop_banner_2260x.webp',	'2023-08-06 15:30:41.657'),
(19,	'1691320069474-02849c9dd48997647956e7df6839c0c229f068d8.webp',	'Frame_30_1.webp',	'2023-08-06 16:37:49.573'),
(20,	'1691320302705-ee895efc0cd05a795dee0e828a5354d468e7efeb.webp',	'Frame_30_1.webp',	'2023-08-06 16:41:42.809'),
(28,	'1691320518277-ff947be33b6269cdafb9f684b395e48302e7f67e.webp',	'Announcement_IPL_Banner_Desktop_1lakh_Ticket_Desktop_1_2_1728x.webp',	'2023-08-06 16:45:18.369'),
(29,	'1691320518282-fdde7cd869d131db5f44e0b58b1acb08681551b6.webp',	'Frame_30_1.webp',	'2023-08-06 16:45:18.371'),
(30,	'1691320518288-7e7e85cb2866e7f18b4a0e32abf0f960432cb23a.webp',	'Happilo_Website_Banners_11112022_Barfi_Brittles_1512X515_Option_1_1.webp',	'2023-08-06 16:45:18.378'),
(31,	'1691320518290-9b801bcc0528e793fa7dbf5fa6bfd1605e66e53b.webp',	'Happilo_Website_Banners_11112022_Chocolate_Spread_1512X515_88a2608e-f6e5-49bd-a547-c85270cdbdf3.webp',	'2023-08-06 16:45:18.381'),
(32,	'1691320518291-d1fec13a89f3a96b7579617522ef03beed479056.webp',	'Marvel-desk_1728x.webp',	'2023-08-06 16:45:18.386'),
(33,	'1691320518295-59868cac3508a30d24735782cd19aac50c9ed645.webp',	'NEWLY_UPDATED_ipl_desktop_banner_2260x.webp',	'2023-08-06 16:45:18.396'),
(34,	'1691320518291-1d20464e15d6e21ef2034d57df97e494dbeb6544.webp',	'Main_IPL_Banner_Desktop_IPL_Main_Banner_DESKTOP_1_1728x.webp',	'2023-08-06 16:45:18.507'),
(35,	'1691320573466-fbc00d1d047d8241a4de4f856b41b76485635f18.png',	'logohappilo.png',	'2023-08-06 16:46:13.53');

DROP TABLE IF EXISTS "tbl_product";
DROP SEQUENCE IF EXISTS tbl_product_id_seq1;
CREATE SEQUENCE tbl_product_id_seq1 INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_product" (
    "id" integer DEFAULT nextval('tbl_product_id_seq1') NOT NULL,
    "name" character varying(999) NOT NULL,
    "catagory_id" integer NOT NULL,
    "description_id" integer NOT NULL,
    "base_price" integer NOT NULL,
    CONSTRAINT "tbl_product_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_product_images";
DROP SEQUENCE IF EXISTS tbl_product_images_id_seq;
CREATE SEQUENCE tbl_product_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_product_images" (
    "id" integer DEFAULT nextval('tbl_product_images_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "image_id" integer NOT NULL,
    CONSTRAINT "tbl_product_images_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_sellers";
DROP SEQUENCE IF EXISTS tbl_sellers_id_seq;
CREATE SEQUENCE tbl_sellers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_sellers" (
    "id" integer DEFAULT nextval('tbl_sellers_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "email" character varying(255) NOT NULL,
    "phone" character varying(255) NOT NULL,
    CONSTRAINT "tbl_sellers_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_stock";
DROP SEQUENCE IF EXISTS tbl_stock_id_seq;
CREATE SEQUENCE tbl_stock_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_stock" (
    "id" integer DEFAULT nextval('tbl_stock_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "seller_id" integer NOT NULL,
    "available_quantity" integer NOT NULL,
    CONSTRAINT "tbl_stock_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."tbl_address" ADD CONSTRAINT "tbl_address_area_id_fkey" FOREIGN KEY (area_id) REFERENCES tbl_area(id) ON DELETE RESTRICT NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_address" ADD CONSTRAINT "tbl_address_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES tbl_customer(id) ON DELETE RESTRICT NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_customer" ADD CONSTRAINT "tbl_customer_image_id_fkey" FOREIGN KEY (image_id) REFERENCES tbl_image(id) ON DELETE RESTRICT NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_discounts" ADD CONSTRAINT "tbl_discounts_seller_id_fkey" FOREIGN KEY (seller_id) REFERENCES tbl_sellers(id) ON DELETE RESTRICT NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_stock" ADD CONSTRAINT "tbl_stock_seller_id_fkey" FOREIGN KEY (seller_id) REFERENCES tbl_sellers(id) ON DELETE RESTRICT NOT DEFERRABLE;

-- 2023-08-06 17:45:21.422888+05:30