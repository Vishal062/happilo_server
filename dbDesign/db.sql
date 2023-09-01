-- Adminer 4.8.1 PostgreSQL 14.5 dump

DROP TABLE IF EXISTS "tbl_address";
DROP SEQUENCE IF EXISTS tbl_address_id_seq;
CREATE SEQUENCE tbl_address_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

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
CREATE SEQUENCE tbl_area_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

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


DROP TABLE IF EXISTS "tbl_area_product_availability";
DROP SEQUENCE IF EXISTS tbl_area_product_availability_id_seq;
CREATE SEQUENCE tbl_area_product_availability_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_area_product_availability" (
    "id" integer DEFAULT nextval('tbl_area_product_availability_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "area_id" integer NOT NULL,
    "seller_id" integer NOT NULL,
    "available_quantity" integer NOT NULL,
    CONSTRAINT "tbl_area_product_availability_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_banner";
DROP SEQUENCE IF EXISTS tbl_banner_id_seq1;
CREATE SEQUENCE tbl_banner_id_seq1 INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 7 CACHE 1;

CREATE TABLE "public"."tbl_banner" (
    "id" integer DEFAULT nextval('tbl_banner_id_seq1') NOT NULL,
    "image_id" integer NOT NULL,
    "status" smallint NOT NULL,
    "date_added" timestamp NOT NULL,
    CONSTRAINT "tbl_banner_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_banner" ("id", "image_id", "status", "date_added") VALUES
(1,	16,	1,	'2023-08-25 12:50:44.699'),
(4,	19,	1,	'2023-08-25 12:50:44.71'),
(6,	21,	1,	'2023-08-25 12:50:44.712'),
(2,	17,	1,	'2023-08-25 12:50:44.703'),
(5,	20,	1,	'2023-08-25 12:50:44.71'),
(7,	22,	1,	'2023-08-25 12:50:44.714'),
(3,	18,	1,	'2023-08-25 12:50:44.706');

DROP TABLE IF EXISTS "tbl_brand_logo";
DROP SEQUENCE IF EXISTS tbl_brand_logo_id_seq;
CREATE SEQUENCE tbl_brand_logo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_brand_logo" (
    "id" integer DEFAULT nextval('tbl_brand_logo_id_seq') NOT NULL,
    "image_id" integer NOT NULL,
    "status" smallint NOT NULL,
    "date_added" character varying NOT NULL,
    CONSTRAINT "tbl_brand_logo_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_brand_logo" ("id", "image_id", "status", "date_added") VALUES
(1,	15,	1,	'2023-08-25T12:49:00.842+05:30');

DROP TABLE IF EXISTS "tbl_cart";
DROP SEQUENCE IF EXISTS tbl_cart_id_seq;
CREATE SEQUENCE tbl_cart_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_cart" (
    "id" integer DEFAULT nextval('tbl_cart_id_seq') NOT NULL,
    "customer_id" integer NOT NULL,
    CONSTRAINT "tbl_cart_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_cart_item";
DROP SEQUENCE IF EXISTS tbl_cart_item_id_seq;
CREATE SEQUENCE tbl_cart_item_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_cart_item" (
    "id" integer DEFAULT nextval('tbl_cart_item_id_seq') NOT NULL,
    "cart_id" integer NOT NULL,
    "product_id" integer NOT NULL,
    "seller_id" integer NOT NULL,
    "quantity" integer NOT NULL,
    CONSTRAINT "tbl_cart_item_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_customer";
DROP SEQUENCE IF EXISTS tbl_customer_id_seq;
CREATE SEQUENCE tbl_customer_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

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


DROP TABLE IF EXISTS "tbl_image";
DROP SEQUENCE IF EXISTS tbl_image_id_seq;
CREATE SEQUENCE tbl_image_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 257 CACHE 1;

CREATE TABLE "public"."tbl_image" (
    "id" integer DEFAULT nextval('tbl_image_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "original_name" character varying(255) NOT NULL,
    "date_added" timestamp NOT NULL,
    CONSTRAINT "tbl_image_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_image" ("id", "name", "original_name", "date_added") VALUES
(1,	'1692942978723-241023130.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-25 11:26:18.885'),
(2,	'1692942978724-226454059.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-25 11:26:18.885'),
(3,	'1692942978725-467993432.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-25 11:26:18.885'),
(4,	'1692942978726-678170191.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-25 11:26:18.885'),
(5,	'1692942978727-513348263.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-25 11:26:18.885'),
(6,	'1692942978731-276232053.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-25 11:26:18.885'),
(7,	'1692942978735-257945720.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-25 11:26:18.885'),
(8,	'1692942978750-776499720.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-25 11:26:18.885'),
(9,	'1692942978752-535483367.webp',	'almondspackof4.webp',	'2023-08-25 11:26:18.885'),
(10,	'1692942978756-448438077.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-25 11:26:18.885'),
(11,	'1692942978757-101946697.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-25 11:26:18.885'),
(12,	'1692942978757-857586348.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-25 11:26:18.885'),
(15,	'1692947940714-883066905.png',	'logohappilo.png',	'2023-08-25 12:49:00.82'),
(16,	'1692948044601-540009001.webp',	'Announcement_IPL_Banner_Desktop_1lakh_Ticket_Desktop_1_2_1728x.webp',	'2023-08-25 12:50:44.695'),
(17,	'1692948044606-406010610.webp',	'Frame_30_1.webp',	'2023-08-25 12:50:44.698'),
(18,	'1692948044608-713047547.webp',	'Happilo_Website_Banners_11112022_Barfi_Brittles_1512X515_Option_1_1.webp',	'2023-08-25 12:50:44.704'),
(19,	'1692948044612-498198352.webp',	'Happilo_Website_Banners_11112022_Chocolate_Spread_1512X515_88a2608e-f6e5-49bd-a547-c85270cdbdf3.webp',	'2023-08-25 12:50:44.708'),
(20,	'1692948044613-273679085.webp',	'Main_IPL_Banner_Desktop_IPL_Main_Banner_DESKTOP_1_1728x.webp',	'2023-08-25 12:50:44.708'),
(21,	'1692948044617-360319900.webp',	'Marvel-desk_1728x.webp',	'2023-08-25 12:50:44.71'),
(22,	'1692948044621-800230246.webp',	'NEWLY_UPDATED_ipl_desktop_banner_2260x.webp',	'2023-08-25 12:50:44.712'),
(23,	'1692948384744-472922196.webp',	'1v2_7ac90a96-200f-496f-b86b-9633c66476c7.webp',	'2023-08-25 12:56:24.876'),
(24,	'1692948384746-288980840.webp',	'3_afb85a93-babf-482d-9484-f9160beaecb4.webp',	'2023-08-25 12:56:24.876'),
(25,	'1692948384747-56408673.webp',	'4v2_b0033650-4d0a-49a2-9c3c-7973a697a533.webp',	'2023-08-25 12:56:24.876'),
(26,	'1692948384753-478415399.webp',	'5_bda3a8c8-ddf8-4a2a-9f35-6be3c7ef45bb.webp',	'2023-08-25 12:56:24.876'),
(27,	'1692948384758-35668074.webp',	'6_b571921b-956a-42bf-9d9f-2b8d784b270e.webp',	'2023-08-25 12:56:24.876'),
(28,	'1692948384764-837086754.webp',	'7_1579a399-48f7-4eef-8a80-01e8d3d5d5b9.webp',	'2023-08-25 12:56:24.876'),
(29,	'1692948384769-522885126.webp',	'back_b6cbb1ef-1cf7-4a1d-83ea-f7397c56a74e.webp',	'2023-08-25 12:56:24.876'),
(30,	'1692948384778-183189212.webp',	'packof2_c8bc297e-3cfe-4b97-b393-3bddc7c85cae.webp',	'2023-08-25 12:56:24.876'),
(31,	'1692948384779-835030376.webp',	'packof5_e7bafd63-8360-4b3a-b207-32d405a6948f.webp',	'2023-08-25 12:56:24.876'),
(32,	'1692949434694-221770795.webp',	'1.webp',	'2023-08-25 13:13:54.893'),
(33,	'1692949434697-688534545.webp',	'3_3a52ee1d-439d-4e04-9378-026c5e79ed90.webp',	'2023-08-25 13:13:54.895'),
(34,	'1692949434702-858244219.webp',	'4v2_70e933b4-dbeb-46de-8559-cec23cedf793.webp',	'2023-08-25 13:13:54.895'),
(35,	'1692949434705-130634939.webp',	'5_3b1b5603-06e1-4785-9447-b7214fe40659.webp',	'2023-08-25 13:13:54.895'),
(36,	'1692949434707-53645130.webp',	'6_0e1d4e0a-d077-4db6-88a1-acf7855c3a82.webp',	'2023-08-25 13:13:54.895'),
(37,	'1692949434708-127844459.webp',	'7_c79d2493-6c0d-4cb4-8795-9fc5cf484c38.webp',	'2023-08-25 13:13:54.895'),
(38,	'1692949434720-194032921.webp',	'41fkpfNaIQL.webp',	'2023-08-25 13:13:54.895'),
(39,	'1692949434723-995739333.webp',	'back_76457f39-ddcb-43d3-8b05-46f385886f54.webp',	'2023-08-25 13:13:54.895'),
(40,	'1692949434724-858130703.webp',	'cashewspackof5 (1).webp',	'2023-08-25 13:13:54.895'),
(41,	'1692949434725-193504582.webp',	'cashewspackof5.webp',	'2023-08-25 13:13:54.895'),
(42,	'1692949434726-337404696.webp',	'cashewspackof5-PhotoRoom.png-PhotoRoom.webp',	'2023-08-25 13:13:54.896'),
(43,	'1692949434728-839340054.webp',	'Front_6c2e2b11-7e60-465b-8262-1998aaf8e852.webp',	'2023-08-25 13:13:54.896'),
(44,	'1692949434729-716111567.webp',	'packof2_0bc5fcbe-5e98-4e27-9df0-2c553b572ea7.webp',	'2023-08-25 13:13:54.896'),
(45,	'1692949434734-763174133.webp',	'packof2_2a0ded68-7c8e-493a-9ec3-130a67e53213.webp',	'2023-08-25 13:13:54.896'),
(46,	'1692949623622-130890886.webp',	'1.webp',	'2023-08-25 13:17:03.768'),
(47,	'1692949623623-176704861.webp',	'3_0cda340b-0d0b-4b16-b3e7-b900b40a8ec8.webp',	'2023-08-25 13:17:03.768'),
(48,	'1692949623625-555401028.webp',	'4v2_973926cd-e9a2-4bd3-b0b9-c3e3d93f4be9.webp',	'2023-08-25 13:17:03.768'),
(49,	'1692949623628-742436661.webp',	'5_86cc4bce-49ae-48e4-a01c-f9e46db5bfef.webp',	'2023-08-25 13:17:03.768'),
(50,	'1692949623631-747388191.webp',	'6_f9360128-ce18-47bb-a28b-50e791d31de7.webp',	'2023-08-25 13:17:03.768'),
(51,	'1692949623635-129324570.webp',	'7_baae73bc-a8cc-4acd-9d63-a5c1406b9ede.webp',	'2023-08-25 13:17:03.768'),
(52,	'1692949623642-767493290.webp',	'back_098392ee-187b-42c6-956d-75f2f2af1b7c.webp',	'2023-08-25 13:17:03.768'),
(53,	'1692949623644-927559856.webp',	'Front_eaa92a65-ad0d-4fa4-8cc1-7d1b37052d58.webp',	'2023-08-25 13:17:03.768'),
(54,	'1692949623646-471452274.webp',	'PAckof2_3317ce2f-a656-4576-850d-d956d59b6a31.webp',	'2023-08-25 13:17:03.768'),
(55,	'1692949623660-641378784.webp',	'PAckof2_be4b6a65-f41e-454a-b546-0c8dbc38f20e.webp',	'2023-08-25 13:17:03.768'),
(56,	'1692949623668-592046653.webp',	'packof5_997daace-76bf-4750-ba33-984e3a31533c.webp',	'2023-08-25 13:17:03.768'),
(57,	'1692949748444-268871363.webp',	'1.webp',	'2023-08-25 13:19:08.587'),
(58,	'1692949748445-625666791.webp',	'3_a0969ee9-b119-4bd0-bfb9-162de93fb8f3.webp',	'2023-08-25 13:19:08.588'),
(59,	'1692949748447-450111698.webp',	'4v2_db9db915-5b2e-4cfa-8cf8-3354c6213528.webp',	'2023-08-25 13:19:08.588'),
(60,	'1692949748447-153409595.webp',	'5_f35c749e-36db-44e1-a08c-a745da5fdbe4.webp',	'2023-08-25 13:19:08.588'),
(61,	'1692949748449-974677286.webp',	'6_f3cd8d1b-8ffa-4d21-a5d6-2434fb614b7d.webp',	'2023-08-25 13:19:08.588'),
(62,	'1692949748451-662547286.webp',	'7_f5d5ff6c-c9e3-48b4-94dd-3c359c744b2e.webp',	'2023-08-25 13:19:08.588'),
(63,	'1692949748460-532484632.webp',	'back_73a96eb4-3fa4-4f99-be3e-5c7904592e66.webp',	'2023-08-25 13:19:08.588'),
(64,	'1692949748462-644520226.webp',	'Front_fc754c84-c841-4847-b7cf-5ae3dcf3fda5.webp',	'2023-08-25 13:19:08.588'),
(65,	'1692949748470-896231507.webp',	'packof2_483841cc-3267-457c-9fcd-8a581818c4c3.webp',	'2023-08-25 13:19:08.588'),
(66,	'1692949748473-344415915.webp',	'packof2_a9aedef5-7407-4663-801c-795256cf95c2.webp',	'2023-08-25 13:19:08.588'),
(67,	'1692949748475-394403321.webp',	'packof5_c3d70991-5b21-4582-a9ab-f67dc6794cfc.webp',	'2023-08-25 13:19:08.588'),
(68,	'1692949887379-521736947.webp',	'1.webp',	'2023-08-25 13:21:27.511'),
(69,	'1692949887380-420070951.webp',	'3_2d926e69-373c-4f93-a724-b1a0f9683810.webp',	'2023-08-25 13:21:27.512'),
(70,	'1692949887381-755048059.webp',	'4v2_d2f2c0e6-d887-483b-8e38-e0ae4274c12f.webp',	'2023-08-25 13:21:27.512'),
(71,	'1692949887382-529733083.webp',	'5_2877b3ba-7f86-4d85-9793-9272ccf39759.webp',	'2023-08-25 13:21:27.512'),
(72,	'1692949887382-914819321.webp',	'6_c7ea8c3c-0f40-4c70-9790-c21f34fa59e9.webp',	'2023-08-25 13:21:27.512'),
(73,	'1692949887383-781308847.webp',	'7_2699bfc5-2438-4493-a04a-7acb1545ff1f.webp',	'2023-08-25 13:21:27.512'),
(74,	'1692949887384-393302712.webp',	'71AZWQymBYL._SL1500.webp',	'2023-08-25 13:21:27.512'),
(75,	'1692949887385-55346565.webp',	'71qm_jFZzTL._SL1500.webp',	'2023-08-25 13:21:27.512'),
(76,	'1692949887385-711468919.webp',	'back_338c9bc2-34f7-4bd9-9ea4-1f036ebe94c4.webp',	'2023-08-25 13:21:27.512'),
(77,	'1692950006106-710151321.webp',	'1.webp',	'2023-08-25 13:23:26.244'),
(78,	'1692950006107-489030301.webp',	'3_4f0345b6-02fd-42ec-97de-ccf240db0235.webp',	'2023-08-25 13:23:26.245'),
(79,	'1692950006114-244734879.webp',	'4v2_75f9be64-b557-4f97-b6c2-ef2142aa9bf2.webp',	'2023-08-25 13:23:26.245'),
(80,	'1692950006115-409124991.webp',	'5_67cfd8b1-d03d-4dfe-a180-1cf353d9f91c.webp',	'2023-08-25 13:23:26.245'),
(81,	'1692950006122-888302053.webp',	'6v2_a8e89e2f-1ad8-4df8-b134-f687d029786f.webp',	'2023-08-25 13:23:26.245'),
(82,	'1692950006123-358615018.webp',	'7_5e2b9201-100d-47f1-9e88-2e7f0b2152fb.webp',	'2023-08-25 13:23:26.245'),
(83,	'1692950006127-746111158.webp',	'back_4c0b9b18-4220-4117-ab60-1f91750cca29.webp',	'2023-08-25 13:23:26.245'),
(84,	'1692950006138-318770255.webp',	'packof2_854ede4f-575a-4fc6-9813-2dabbd6b0dc2.webp',	'2023-08-25 13:23:26.245'),
(85,	'1692950006139-669543060.webp',	'packof5_0cc5d783-7ded-4e13-ac25-8482d95701bb.webp',	'2023-08-25 13:23:26.245'),
(86,	'1692950125774-872324723.webp',	'1v2_31f6f791-8f26-464d-b873-977135c3b410.webp',	'2023-08-25 13:25:25.902'),
(87,	'1692950125775-465920808.webp',	'3_75dd4efd-fbbf-4383-945e-77a774cc4697.webp',	'2023-08-25 13:25:25.902'),
(88,	'1692950125776-516278645.webp',	'4v2_c8636e3c-589d-4d87-ae20-de5e1f7a14d9.webp',	'2023-08-25 13:25:25.902'),
(89,	'1692950125780-215664240.webp',	'5_aaaf22e8-3f5c-4061-873e-8075c37c8e85.webp',	'2023-08-25 13:25:25.902'),
(90,	'1692950125781-717096450.webp',	'6_225bbcea-e785-41f9-af11-abad042b24bc.webp',	'2023-08-25 13:25:25.902'),
(91,	'1692950125784-724551705.webp',	'7_ccf8ace0-5186-4cae-ada4-1ff4d3927196.webp',	'2023-08-25 13:25:25.902'),
(92,	'1692950125786-579801870.webp',	'back_83848e86-ecf5-4035-b333-f9061aee826d.webp',	'2023-08-25 13:25:25.902'),
(93,	'1692950125803-184664370.webp',	'packof2_3827db98-6455-4df4-a189-a52e11970069.webp',	'2023-08-25 13:25:25.902'),
(94,	'1692950125804-274076818.webp',	'packof5_304038ab-b81b-41e7-a525-9fc95072fb49.webp',	'2023-08-25 13:25:25.902'),
(95,	'1692950293620-859703506.webp',	'1.webp',	'2023-08-25 13:28:13.761'),
(96,	'1692950293621-134809327.webp',	'3_81de3f52-490a-42dd-8367-dd75d35f3ab1.webp',	'2023-08-25 13:28:13.761'),
(97,	'1692950293622-979209436.webp',	'4v2_274252aa-36f1-4da0-afc2-b6f9d132e907.webp',	'2023-08-25 13:28:13.761'),
(98,	'1692950293623-553691665.webp',	'5_a28402d6-4a75-4414-b17f-d835f66d7201.webp',	'2023-08-25 13:28:13.761'),
(99,	'1692950293626-781415551.webp',	'6_081c3ae3-828b-45db-84c9-960fa738a04e.webp',	'2023-08-25 13:28:13.761'),
(100,	'1692950293628-49102817.webp',	'7_a256f8cc-678c-4701-9c8e-fb657d811d1a.webp',	'2023-08-25 13:28:13.761'),
(101,	'1692950293638-533141291.webp',	'back_0f3f33f7-c2c9-4596-9606-f7525faa22dc.webp',	'2023-08-25 13:28:13.761'),
(102,	'1692950293645-377263533.webp',	'packof2_5a8d8a48-be7f-42fe-ab66-1a92229d6c31.webp',	'2023-08-25 13:28:13.761'),
(103,	'1692950293646-510650327.webp',	'packof2_74fd9419-7995-4b40-bb5f-f5dc80b36551.webp',	'2023-08-25 13:28:13.761'),
(104,	'1692950293654-153921458.webp',	'packof5_1007138d-8730-463c-b41c-99b789a9633f.webp',	'2023-08-25 13:28:13.761'),
(105,	'1693372819927-407156464.webp',	'1.webp',	'2023-08-30 10:50:20.014'),
(106,	'1693372819932-686685747.webp',	'4_df2cd298-c85a-4f44-a0f2-29a05688dff0.webp',	'2023-08-30 10:50:20.016'),
(107,	'1693372819943-988444117.webp',	'5_15e5304d-6d75-47d6-b566-5266f8265eaa.webp',	'2023-08-30 10:50:20.016'),
(108,	'1693372819945-738244168.webp',	'6_a493dd64-748f-43be-ba10-36f27abc4a09.webp',	'2023-08-30 10:50:20.016'),
(109,	'1693372819948-79060356.webp',	'8_b590d837-065a-4802-8859-a50e471614d7 (1).webp',	'2023-08-30 10:50:20.016'),
(110,	'1693372819949-638980990.webp',	'8_b590d837-065a-4802-8859-a50e471614d7.webp',	'2023-08-30 10:50:20.016'),
(111,	'1693372819950-443250153.webp',	'rosealmond_2_f5465ba9-ebd0-410d-82d5-171a6ca560b8.webp',	'2023-08-30 10:50:20.016'),
(112,	'1693399838697-76512546.webp',	'1.webp',	'2023-08-30 18:20:38.832'),
(113,	'1693399838701-648869368.webp',	'3_6d3d8e06-cdbd-4e5b-a08d-d0f1692a3af0.webp',	'2023-08-30 18:20:38.832'),
(114,	'1693399838704-168436243.webp',	'4_658a6d34-c4c1-4f75-9139-d0cd4440fd34.webp',	'2023-08-30 18:20:38.832'),
(115,	'1693399838713-864359655.webp',	'5_528be5c1-6731-4167-a889-3912629d4ab3.webp',	'2023-08-30 18:20:38.832'),
(116,	'1693399838715-18888706.webp',	'6_8cbbe720-e17d-4925-989e-191cfc3774a7.webp',	'2023-08-30 18:20:38.833'),
(117,	'1693399838737-475237802.webp',	'7_e20cd05e-4828-4acf-8ceb-94039dbe9659.webp',	'2023-08-30 18:20:38.833'),
(118,	'1693399838738-949265308.webp',	'pista_1.webp',	'2023-08-30 18:20:38.833'),
(119,	'1693399838739-518283374.webp',	'pista_2.webp',	'2023-08-30 18:20:38.833'),
(120,	'1693400042495-495347266.webp',	'1.webp',	'2023-08-30 18:24:02.563'),
(121,	'1693400042496-965499765.webp',	'3_d7e13bac-bf5c-4f64-aef2-cd7365bd9749.webp',	'2023-08-30 18:24:02.563'),
(122,	'1693400042497-52047076.webp',	'4_a0755d2f-eb06-4cab-b6c3-fa9c7375b6f7.webp',	'2023-08-30 18:24:02.563'),
(123,	'1693400042498-331506214.webp',	'5_b2dd5ea3-633f-40d3-9a76-55ba753882b3.webp',	'2023-08-30 18:24:02.563'),
(124,	'1693400042499-899748295.webp',	'6_e39202f3-2216-4ef3-80b9-9519586c53d9.webp',	'2023-08-30 18:24:02.563'),
(125,	'1693400042511-755047494.webp',	'7_f72fbf4f-20ab-4a7b-bdd6-937e45b7081b.webp',	'2023-08-30 18:24:02.563'),
(126,	'1693400042512-272493647.webp',	'rosealmond_1.webp',	'2023-08-30 18:24:02.563'),
(127,	'1693400042512-738911417.webp',	'rosealmond_2.webp',	'2023-08-30 18:24:02.563'),
(128,	'1693400230737-742053779.webp',	'1.webp',	'2023-08-30 18:27:10.799'),
(129,	'1693400230737-508044304.webp',	'2_22361d92-8bfd-4ed1-8e3a-adbea51b337a.webp',	'2023-08-30 18:27:10.799'),
(130,	'1693400230738-536655988.webp',	'3_d607ffd8-45f0-4069-a17a-278e6dd0cfa2.webp',	'2023-08-30 18:27:10.799'),
(131,	'1693400230739-675065119.webp',	'5_9dd69a06-04a5-488a-aecb-4c7c663272b4.webp',	'2023-08-30 18:27:10.799'),
(132,	'1693400230740-515932754.webp',	'6_c238a94a-87d5-44ef-be81-e50ca7e767c5.webp',	'2023-08-30 18:27:10.799'),
(133,	'1693400230750-874644633.webp',	'Back_2_e85ac4cd-3f47-4d69-a9a1-aba236225a6e.webp',	'2023-08-30 18:27:10.799'),
(134,	'1693400230755-221573280.webp',	'rosealmond_1_c0b9c35c-77a2-41b3-973f-fee6b251e278.webp',	'2023-08-30 18:27:10.799'),
(135,	'1693400230756-55117477.webp',	'rosealmond_2_47448a89-546b-44ff-8323-84b436f55885.webp',	'2023-08-30 18:27:10.799'),
(136,	'1693400722897-92349783.webp',	'1.webp',	'2023-08-30 18:35:22.971'),
(137,	'1693400722898-981173144.webp',	'2_00101c40-565d-4e56-a422-180822b64ec9.webp',	'2023-08-30 18:35:22.971'),
(138,	'1693400722898-318815319.webp',	'3_4a3958aa-1362-47d2-bc0a-a5957a5d6c6e.webp',	'2023-08-30 18:35:22.972'),
(139,	'1693400722900-79302519.webp',	'4_5a60deca-dba3-4b86-a948-85fad03f66ee.webp',	'2023-08-30 18:35:22.972'),
(140,	'1693400722901-832657047.webp',	'5_cdc38840-63a6-4ba9-bdf1-a30509e40153.webp',	'2023-08-30 18:35:22.972'),
(141,	'1693400722902-315693089.webp',	'6_a5ad47da-f6f9-4f49-99b8-e430bcbeeedb.webp',	'2023-08-30 18:35:22.972'),
(142,	'1693400722904-557166105.webp',	'7_5483f7ea-8048-41d3-b3b1-bee1b2b1a133.webp',	'2023-08-30 18:35:22.972'),
(143,	'1693400722905-695104651.webp',	'8_3adc39ff-60aa-4bd0-878e-32ed9880568a.webp',	'2023-08-30 18:35:22.972'),
(144,	'1693401014297-170221219.webp',	'1.webp',	'2023-08-30 18:40:14.353'),
(145,	'1693401014297-765241545.webp',	'2_d51f1183-78fb-450a-8fd6-b5a834e76193.webp',	'2023-08-30 18:40:14.354'),
(146,	'1693401014298-357638801.webp',	'3v2.webp',	'2023-08-30 18:40:14.354'),
(147,	'1693401014301-595019341.webp',	'4_4027e504-b739-4499-b317-74a9b43ac268.webp',	'2023-08-30 18:40:14.354'),
(148,	'1693401014302-437728727.webp',	'5_d3febecb-d445-4552-abcc-fd4dbcfb089e.webp',	'2023-08-30 18:40:14.354'),
(149,	'1693401014303-164535375.webp',	'6_6638a01d-8414-40b2-a6f0-d94c89edf499.webp',	'2023-08-30 18:40:14.354'),
(150,	'1693401014304-781647989.webp',	'7_aa44a36e-705d-435e-8434-5aeccc008ab6.webp',	'2023-08-30 18:40:14.354'),
(151,	'1693401014310-410789674.webp',	'8_acdb6359-7d9a-4ed9-bc70-df0cfe8398ee.webp',	'2023-08-30 18:40:14.354'),
(152,	'1693401919999-835349614.webp',	'1.webp',	'2023-08-30 18:55:20.06'),
(153,	'1693401920001-816795520.webp',	'2_e8c01f47-0bb0-4f14-a673-4a266e1f6eed.webp',	'2023-08-30 18:55:20.06'),
(154,	'1693401920001-271156818.webp',	'3_9d0aa563-f120-42bf-8c8c-9ca08951f100.webp',	'2023-08-30 18:55:20.06'),
(155,	'1693401920003-929544148.webp',	'4_3cfea713-e7bc-4857-9c73-1f3555868864.webp',	'2023-08-30 18:55:20.06'),
(156,	'1693401920003-586383729.webp',	'5_53d4b37e-79b4-4201-bde9-908d34195656.webp',	'2023-08-30 18:55:20.06'),
(157,	'1693401920004-527161358.webp',	'6_a0ab0389-1a18-4b75-a486-45c85e9af66e.webp',	'2023-08-30 18:55:20.06'),
(158,	'1693401920007-420858560.webp',	'7_40e875e6-8927-4d91-9f57-9ad76dce1de6.webp',	'2023-08-30 18:55:20.06'),
(159,	'1693401920010-522931267.webp',	'8_a0f31fb0-9ae4-4ff0-b40a-ce3cb0216b62.webp',	'2023-08-30 18:55:20.06'),
(160,	'1693402083449-598369773.webp',	'1.webp',	'2023-08-30 18:58:03.502'),
(161,	'1693402083449-382504879.webp',	'2_acf5e021-d74c-4b0f-a0b2-cc48905b560a.webp',	'2023-08-30 18:58:03.502'),
(162,	'1693402083449-801197316.webp',	'3v2_7a516d2b-0dca-4da1-985a-d99913d304c6.webp',	'2023-08-30 18:58:03.502'),
(163,	'1693402083454-617172145.webp',	'4_cb23a139-5db3-4fe2-90cd-8df75b5b6d3f.webp',	'2023-08-30 18:58:03.502'),
(164,	'1693402083455-268288383.webp',	'5_af0fe680-ba31-40c2-b08c-bfe3b1de65de.webp',	'2023-08-30 18:58:03.502'),
(165,	'1693402083456-444421251.webp',	'6_814091d8-3955-4afb-b229-2c11c0f14220.webp',	'2023-08-30 18:58:03.502'),
(166,	'1693402083457-292130530.webp',	'7_31739c91-2312-43e9-a4b3-e44401e61d4c.webp',	'2023-08-30 18:58:03.502'),
(167,	'1693402083458-240164641.webp',	'8_aeac9872-23d8-4fed-bd99-71ca89d15f15.webp',	'2023-08-30 18:58:03.502'),
(168,	'1693402707089-5482957.webp',	'1.webp',	'2023-08-30 19:08:27.168'),
(169,	'1693402707099-327183880.webp',	'3_5dacdfce-4b01-4d5e-8094-1aae7170d0c7.webp',	'2023-08-30 19:08:27.169'),
(170,	'1693402707100-685636519.webp',	'4_b13ea2bd-3610-40a6-ad6b-a5ef19882591.webp',	'2023-08-30 19:08:27.169'),
(171,	'1693402707101-213304972.webp',	'5_4da54dd4-8e81-4562-a949-4035c12c4d45.webp',	'2023-08-30 19:08:27.169'),
(172,	'1693402707103-231553034.webp',	'7_c35485e0-a57a-42cc-a675-7ffc083b3772.webp',	'2023-08-30 19:08:27.169'),
(173,	'1693402707103-434347914.webp',	'pistachiobrittle_1_4f87c618-4078-4842-a442-def3d7bf32e3.webp',	'2023-08-30 19:08:27.169'),
(174,	'1693402707103-836257280.webp',	'pistachiobrittle_2_c47052fe-80fa-40cb-aa6c-108ae2f05d21.webp',	'2023-08-30 19:08:27.169'),
(175,	'1693402707109-741985085.webp',	'pistachiobrittle_3_d4252041-2465-47bb-af8d-bd9ceb6a2061.webp',	'2023-08-30 19:08:27.169'),
(176,	'1693403201744-13806988.webp',	'1.webp',	'2023-08-30 19:16:41.81'),
(177,	'1693403201749-779529867.webp',	'71EYIf3e4CL._SL1500.webp',	'2023-08-30 19:16:41.81'),
(178,	'1693403201750-178349246.webp',	'71wAnjCrRgL._SL1500.webp',	'2023-08-30 19:16:41.81'),
(179,	'1693403201750-179595444.webp',	'81e5a2xE5QL._SL1500.webp',	'2023-08-30 19:16:41.81'),
(180,	'1693403201751-584364365.webp',	'81JPl41RsCL._SL1500.webp',	'2023-08-30 19:16:41.81'),
(181,	'1693403201759-868433642.webp',	'81WtREI_v_L._SL1500.webp',	'2023-08-30 19:16:41.81'),
(182,	'1693403201762-951796379.webp',	'81XfxnnfbFL._SL1500.webp',	'2023-08-30 19:16:41.81'),
(183,	'1693403201763-266634990.webp',	'v2_21.webp',	'2023-08-30 19:16:41.81'),
(184,	'1693403733513-63010532.webp',	'1.webp',	'2023-08-30 19:25:33.595'),
(185,	'1693403733518-672172185.webp',	'3_dede78a2-cf48-470c-acc1-4108e7a995c6.webp',	'2023-08-30 19:25:33.596'),
(186,	'1693403733518-399364215.webp',	'4_86d22319-9af4-424c-a3b7-0efc1bc57cab.webp',	'2023-08-30 19:25:33.596'),
(187,	'1693403733521-189161179.webp',	'5_a3fe1694-3b88-4be7-89cf-c73c706ae660.webp',	'2023-08-30 19:25:33.596'),
(188,	'1693403733522-422593859.webp',	'7_c2eedf5d-c5df-4f78-adbb-d1b448e42607.webp',	'2023-08-30 19:25:33.596'),
(189,	'1693403733524-757694795.webp',	'cashewbrittle_1.webp',	'2023-08-30 19:25:33.596'),
(190,	'1693403733525-696412578.webp',	'cashewbrittle_2_c941c5a9-1769-4740-92bd-14562b894cde.webp',	'2023-08-30 19:25:33.596'),
(191,	'1693403733526-2093011.webp',	'cashewbrittle_3_7ca6a182-223a-4889-80b8-d6e0559f0244.webp',	'2023-08-30 19:25:33.596'),
(192,	'1693404805549-147548269.webp',	'1.webp',	'2023-08-30 19:43:25.6'),
(193,	'1693404805550-679466192.webp',	'3_ae73fd94-6db9-4efd-b840-dc353fd84588.webp',	'2023-08-30 19:43:25.6'),
(194,	'1693404805550-777668155.webp',	'4_1cca094f-f92f-4859-9ce2-cec683defe4f.webp',	'2023-08-30 19:43:25.6'),
(195,	'1693404805555-786303358.webp',	'5_42c3220b-ea91-4ae6-a1ec-abaf3011e7c2.webp',	'2023-08-30 19:43:25.6'),
(196,	'1693404805556-729241932.webp',	'7_f2fbd7d1-b5f2-427f-ad3d-18fd5b70af61.webp',	'2023-08-30 19:43:25.6'),
(197,	'1693404805556-270932581.webp',	'AlmondBrittle_1_c1309bb1-ab0c-4318-b4a8-ed51fe0c352a.webp',	'2023-08-30 19:43:25.6'),
(198,	'1693404805559-54376357.webp',	'AlmondBrittle_2_a2529521-48cc-45f6-a3d3-0bc5f7c7717a.webp',	'2023-08-30 19:43:25.6'),
(199,	'1693404805559-79725190.webp',	'AlmondBrittle_3_15c54827-0559-4cc9-a88d-2a2b77b33238.webp',	'2023-08-30 19:43:25.6'),
(200,	'1693405204780-158957027.webp',	'1.webp',	'2023-08-30 19:50:04.856'),
(201,	'1693405204781-37986542.webp',	'2_108.webp',	'2023-08-30 19:50:04.856'),
(202,	'1693405204782-936076976.webp',	'3copy_1.webp',	'2023-08-30 19:50:04.856'),
(203,	'1693405204786-537215762.webp',	'4_69.webp',	'2023-08-30 19:50:04.856'),
(204,	'1693405204787-73742325.webp',	'5_8.webp',	'2023-08-30 19:50:04.856'),
(205,	'1693405204789-319193934.webp',	'7_6.webp',	'2023-08-30 19:50:04.856'),
(206,	'1693406187405-69969335.webp',	'1.webp',	'2023-08-30 20:06:27.465'),
(207,	'1693406187408-732043502.webp',	'2_4eb653fc-d71f-4930-8e98-b2afce45061d.webp',	'2023-08-30 20:06:27.465'),
(208,	'1693406187417-600020909.webp',	'3_417f8913-5cc2-4791-b87b-0037e09e45df.webp',	'2023-08-30 20:06:27.465'),
(209,	'1693406187418-509430602.webp',	'4v2_85ae5ad1-f863-4d5b-a801-f9ba9e7c7a14.webp',	'2023-08-30 20:06:27.465'),
(210,	'1693406187419-776974543.webp',	'5_7d01cdab-9343-4f81-b27e-38e9d9a55520.webp',	'2023-08-30 20:06:27.465'),
(211,	'1693406187421-212343031.webp',	'6v3_d6d99ac9-b24f-4de5-a411-70e12ba38af5.webp',	'2023-08-30 20:06:27.465'),
(212,	'1693406187422-839212555.webp',	'7_4cbe0bca-93b9-4f69-aa5a-676bcfa5c898.webp',	'2023-08-30 20:06:27.465'),
(213,	'1693406781290-33330906.webp',	'1.webp',	'2023-08-30 20:16:21.349'),
(214,	'1693406781290-407572712.webp',	'2_8f4484d1-0feb-44e8-962c-1c2670452ac3.webp',	'2023-08-30 20:16:21.349'),
(215,	'1693406781291-705937127.webp',	'3_1a3b8148-c2ee-480b-bf31-8e89b5cb4ba7.webp',	'2023-08-30 20:16:21.349'),
(216,	'1693406781292-632744967.webp',	'4v2_e1a0b3e9-fa9d-4a74-a335-9ded29b34dd7.webp',	'2023-08-30 20:16:21.349'),
(217,	'1693406781294-233463547.webp',	'5_fe838721-b6df-4960-b945-c3c42254464c.webp',	'2023-08-30 20:16:21.349'),
(218,	'1693406781295-213511547.webp',	'6v3_1df4db21-d669-4ab5-bb90-d93bd27d41b2.webp',	'2023-08-30 20:16:21.349'),
(219,	'1693406781295-554477155.webp',	'7_58951a50-386a-4a49-87ee-e7c6017face9.webp',	'2023-08-30 20:16:21.349'),
(220,	'1693466242801-784717971.webp',	'1.webp',	'2023-08-31 12:47:22.87'),
(221,	'1693466242807-848380400.webp',	'2_fea87ade-c0bc-49d3-9838-194d135072af.webp',	'2023-08-31 12:47:22.871'),
(222,	'1693466242813-516295264.webp',	'3_528d5416-40a3-4b56-81c3-9cc995c70dd3.webp',	'2023-08-31 12:47:22.871'),
(223,	'1693466242814-920342888.webp',	'4v2_9e34285d-704c-49de-8d2e-1b9749caaa7f.webp',	'2023-08-31 12:47:22.871'),
(224,	'1693466242815-694902524.webp',	'5_23415c0d-ab4e-40d4-b151-846c1a2f1c6b.webp',	'2023-08-31 12:47:22.872'),
(225,	'1693466242820-86940920.webp',	'6v3_8f6a29ce-a941-4b23-8cff-98b1f3870356.webp',	'2023-08-31 12:47:22.872'),
(226,	'1693466242821-207088539.webp',	'7_ea2cfc05-5d38-4e3e-8432-76a6e6b88bcc.webp',	'2023-08-31 12:47:22.872'),
(227,	'1693467091477-315811569.webp',	'1.webp',	'2023-08-31 13:01:31.657'),
(228,	'1693467091477-377929571.webp',	'2_23aa6b25-422e-49d3-ac1d-e674459e1a27.webp',	'2023-08-31 13:01:31.657'),
(229,	'1693467091478-516467178.webp',	'3_89373ec8-27ed-46cc-9dab-092bc61a7a17.webp',	'2023-08-31 13:01:31.657'),
(230,	'1693467091480-848625212.webp',	'4_ea2615e6-f974-4ec5-a0ee-2bee1dcabb87.webp',	'2023-08-31 13:01:31.657'),
(231,	'1693467091481-854735080.webp',	'5_bbc2cfb2-5592-42cc-80cd-5e1a791f7151.webp',	'2023-08-31 13:01:31.657'),
(232,	'1693467091487-419404574.webp',	'6_a435e447-94cd-436d-b261-a700d240a5b2.webp',	'2023-08-31 13:01:31.657'),
(233,	'1693467091488-216892140.webp',	'7_7828554c-6456-46a8-b6ed-c29740470f6b.webp',	'2023-08-31 13:01:31.657'),
(234,	'1693467091489-304631241.webp',	'WJiNytY.webp',	'2023-08-31 13:01:31.657'),
(235,	'1693542261436-295666599.webp',	'1.webp',	'2023-09-01 09:54:21.502'),
(236,	'1693542261439-946252698.webp',	'2_1715406a-8de2-4c2c-ab64-b133d2859053.webp',	'2023-09-01 09:54:21.514'),
(237,	'1693542261442-166599104.webp',	'4_e25215e8-9f00-4d48-86b8-40ce92af9024.webp',	'2023-09-01 09:54:21.514'),
(238,	'1693542261447-78809476.webp',	'5_7a9e94e2-512c-4c27-b8bb-91c453c634c8.webp',	'2023-09-01 09:54:21.514'),
(239,	'1693542261455-197597032.webp',	'6_1c1baedf-a359-47a6-935c-e16aa84d3b91.webp',	'2023-09-01 09:54:21.514'),
(240,	'1693542261456-616628973.webp',	'7_b51b8583-e807-4e7f-9329-1c0d27cea0ad.webp',	'2023-09-01 09:54:21.514'),
(241,	'1693542261457-461346251.webp',	'fj7wX0fQ.webp',	'2023-09-01 09:54:21.514'),
(242,	'1693542814167-692571205.webp',	'1.webp',	'2023-09-01 10:03:34.23'),
(243,	'1693542814168-466062270.webp',	'2_7314fd51-eb56-4a53-804a-64d27ee448d4.webp',	'2023-09-01 10:03:34.23'),
(244,	'1693542814168-13774964.webp',	'2v2_fa80a308-196c-497e-9713-ca8a33d832e4.webp',	'2023-09-01 10:03:34.23'),
(245,	'1693542814174-576966513.webp',	'3_173c96c6-db62-4c42-a26d-9609baaeb143.webp',	'2023-09-01 10:03:34.23'),
(246,	'1693542814176-606187110.webp',	'4_46e58570-7cfc-4806-8811-28c510d146db.webp',	'2023-09-01 10:03:34.23'),
(247,	'1693542814176-463831960.webp',	'5_6915df91-f30d-41bc-8ade-c6c27fa17897.webp',	'2023-09-01 10:03:34.23'),
(248,	'1693542814178-733788888.webp',	'6_c64fd8d9-4add-4e19-8f8e-1716a59dc22e.webp',	'2023-09-01 10:03:34.23'),
(249,	'1693542814185-683200286.webp',	'7Hf84v08.webp',	'2023-09-01 10:03:34.23'),
(250,	'1693543127651-648310267.webp',	'1.webp',	'2023-09-01 10:08:47.712'),
(251,	'1693543127652-627580365.webp',	'2_e60756c4-4c43-48bc-a850-a0ad9ae65804.webp',	'2023-09-01 10:08:47.712'),
(252,	'1693543127652-678203423.webp',	'2v2_82051b25-2d15-4080-b519-c90c00cf009d.webp',	'2023-09-01 10:08:47.712'),
(253,	'1693543127653-77916517.webp',	'3_ff94a67b-5e15-4f25-b242-259c6ab58f2f.webp',	'2023-09-01 10:08:47.712'),
(254,	'1693543127655-572816035.webp',	'4_9d05ad64-49ef-43a0-9d8f-3659608cc023.webp',	'2023-09-01 10:08:47.712'),
(255,	'1693543127656-880209729.webp',	'5_5b1cbfc0-2302-4a7e-a412-8393142b42db.webp',	'2023-09-01 10:08:47.712'),
(256,	'1693543127657-160788698.webp',	'6_55b42399-a269-43c2-9d25-7756959415c7.webp',	'2023-09-01 10:08:47.712'),
(257,	'1693543127659-94915010.webp',	'I2gjhU4.webp',	'2023-09-01 10:08:47.712');

DROP TABLE IF EXISTS "tbl_order";
DROP SEQUENCE IF EXISTS tbl_order_id_seq;
CREATE SEQUENCE tbl_order_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_order" (
    "id" integer DEFAULT nextval('tbl_order_id_seq') NOT NULL,
    "customer_id" integer NOT NULL,
    "order_date" timestamp NOT NULL,
    "total_amount" integer NOT NULL,
    CONSTRAINT "tbl_order_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_order_item";
DROP SEQUENCE IF EXISTS tbl_order_item_id_seq;
CREATE SEQUENCE tbl_order_item_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_order_item" (
    "id" integer DEFAULT nextval('tbl_order_item_id_seq') NOT NULL,
    "order_id" integer NOT NULL,
    "product_id" integer NOT NULL,
    "seller_id" integer NOT NULL,
    "quantity" integer NOT NULL,
    "sub_total" integer NOT NULL,
    "applied_discount" integer,
    CONSTRAINT "tbl_order_item_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_payment";
DROP SEQUENCE IF EXISTS tbl_payment_id_seq;
CREATE SEQUENCE tbl_payment_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_payment" (
    "id" integer DEFAULT nextval('tbl_payment_id_seq') NOT NULL,
    "order_id" integer NOT NULL,
    "payment_amount" integer NOT NULL,
    "payment_date" timestamp NOT NULL,
    "payment_status" character varying(255) NOT NULL,
    "payment_method" character varying NOT NULL,
    "transaction_id" character varying(255),
    "payment_details" character varying,
    CONSTRAINT "tbl_payment_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."tbl_payment"."payment_status" IS 'e.g., Pending, Completed';

COMMENT ON COLUMN "public"."tbl_payment"."payment_method" IS 'e.g., Credit Card, Debit Card, UPI,Cash On Delivery';

COMMENT ON COLUMN "public"."tbl_payment"."transaction_id" IS 'provided by the payment gateway';

COMMENT ON COLUMN "public"."tbl_payment"."payment_details" IS 'additional payment-related information';


DROP TABLE IF EXISTS "tbl_product";
DROP SEQUENCE IF EXISTS tbl_product_id_seq1;
CREATE SEQUENCE tbl_product_id_seq1 INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 33 CACHE 1;

CREATE TABLE "public"."tbl_product" (
    "id" integer DEFAULT nextval('tbl_product_id_seq1') NOT NULL,
    "name" character varying(999) NOT NULL,
    "category_id" integer NOT NULL,
    CONSTRAINT "tbl_product_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_product" ("id", "name", "category_id") VALUES
(1,	'Happilo 100% Natural Premium California Almonds',	1),
(3,	'Happilo Healthy & Tasty Premium Nuts and Berries Mix',	3),
(5,	'Happilo Premium Dried Californian Pitted Prunes',	5),
(6,	'Happilo Premium Dried Turkish Apricots',	6),
(7,	'Happilo Premium International Dried Mango',	7),
(8,	'Happilo Premium International Omani Dates',	8),
(9,	'Happilo Premium Roasted & Salted Iranian Pistachios',	9),
(10,	'Happilo Premium Seedless Afghani Black Raisins',	10),
(4,	'Happilo Fresh & Delicious Crunchy Cashews',	4),
(11,	'Assorted Dry Fruit Bar Pack',	11),
(12,	'Pistachios Dry Fruit Bar Pack',	12),
(13,	'Rose Almonds Dry Fruit Bar Pack',	13),
(14,	'Rose Almonds Mini Dry Fruit Bar Gift Box',	14),
(15,	'Happilo Premium Chocolate Cashew Spread',	15),
(16,	'Happilo Premium Chocolate Almond Spread',	16),
(17,	'Happilo Chocolate Hazelnut Spread',	17),
(18,	'Happilo Premium Chocolate Almond Spread',	18),
(19,	'Happilo Premium Pistachios Brittle Box',	19),
(20,	'Happilo Premium Almond Brittle Gift Pack',	20),
(21,	'Happilo Premium Almond Brittle Gift Pack',	21),
(22,	'Happilo Premium Cashew Brittle Celebrations Pack',	22),
(23,	'Happilo Premium Almond Brittle Celebrations',	23),
(24,	'Happilo Party Snack Premium Limited Edition Royal Challengers Bangalore',	24),
(25,	'Happilo Premium Super Snack Himalayan Salt & Pepper Chickpeas',	25),
(26,	'Happilo Premium Super Snack Magic Masala Chickpeas 110g, Crunchy and Delicious, Super Healthy',	26),
(27,	'Happilo Premium Super Snack Chili Garlic Chickpeas',	27),
(28,	'Happilo Marvel Black Panther Edition International Peri Peri Nut Party Snack',	28),
(29,	'Happilo Marvel Dr. Strange Edition Oven Roasted Cashews Spicy Chilly Garlic',	29),
(30,	'Happilo Marvel Dr. Strange Edition Oven Roasted Cashews Spicy Chilly Garlic',	30),
(31,	'Happilo Marvel Black Panther Edition International Peri Peri Nut Party Snack',	31),
(32,	'Happilo Marvel Black Panther Edition Oven Roasted Cashews Black Pepper',	32),
(33,	'Happilo Marvel Captain America Edition Natural Whole Cashews',	33);

DROP TABLE IF EXISTS "tbl_product_category";
DROP SEQUENCE IF EXISTS tbl_categories_id_seq;
CREATE SEQUENCE tbl_categories_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 33 CACHE 1;

CREATE TABLE "public"."tbl_product_category" (
    "id" integer DEFAULT nextval('tbl_categories_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    CONSTRAINT "tbl_categories_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_product_category" ("id", "name") VALUES
(1,	'Nuts'),
(2,	'Nuts'),
(3,	'Nuts'),
(4,	'Nuts'),
(5,	'Nuts'),
(6,	'Nuts'),
(7,	'Nuts'),
(8,	'Nuts'),
(9,	'Nuts'),
(10,	'Nuts'),
(11,	'Dry Fruit Bars'),
(12,	'Dry Fruit Bars'),
(13,	'Dry Fruit Bars'),
(14,	'Dry Fruit Bars'),
(15,	'Spreads'),
(16,	'Spreads'),
(17,	'Spreads'),
(18,	'Spreads'),
(19,	'Brittle & Barfi'),
(20,	'Brittle & Barfi'),
(21,	'Brittle & Barfi'),
(22,	'Brittle & Barfi'),
(23,	'Brittle & Barfi'),
(24,	'Party Snacks'),
(25,	'Party Snacks'),
(26,	'Party Snacks'),
(27,	'Party Snacks'),
(28,	'Party Snacks'),
(29,	'Party Snacks'),
(30,	'Marvel Snacks'),
(31,	'Marvel Snacks'),
(32,	'Marvel Snacks'),
(33,	'Marvel Snacks');

DROP TABLE IF EXISTS "tbl_product_description";
DROP SEQUENCE IF EXISTS tbl_product_description_id_seq;
CREATE SEQUENCE tbl_product_description_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 132 CACHE 1;

CREATE TABLE "public"."tbl_product_description" (
    "id" integer DEFAULT nextval('tbl_product_description_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "name" character varying(555),
    "type" character varying(999) NOT NULL,
    "details" text NOT NULL,
    CONSTRAINT "tbl_product_description_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."tbl_product_description"."name" IS 'description name (short heading)';

COMMENT ON COLUMN "public"."tbl_product_description"."type" IS 'description type';

COMMENT ON COLUMN "public"."tbl_product_description"."details" IS 'description details';

INSERT INTO "tbl_product_description" ("id", "product_id", "name", "type", "details") VALUES
(1,	1,	'Nutritional Boost',	'Description',	'Enjoy the health benefits of our premium almonds.'),
(2,	1,	'Tasty and Crunchy',	'Description',	'Savor the rich flavor and satisfying crunch of our almonds.'),
(3,	1,	'',	'Ingredients',	'100% natural California almonds.'),
(4,	1,	'',	'Additional Information',	'Store in a cool, dry place.'),
(9,	3,	'Nut Lover’s Dream',	'Description',	'Experience a variety of nuts in one delightful mix.'),
(10,	3,	'Perfect for Sharing',	'Description',	'Ideal for parties, gatherings, or enjoying with loved ones.'),
(11,	3,	'',	'Ingredients',	'Assorted nuts including almonds, cashews, and walnuts.'),
(12,	3,	'',	'Additional Information',	'Packed in a resealable bag for freshness.'),
(13,	4,	'Irresistible Flavor',	'Description',	'Experience the irresistible flavor of our crunchy cashews.'),
(14,	4,	'Rich in Nutrients',	'Description',	'Packed with essential nutrients for a healthy snack.'),
(15,	4,	'',	'Ingredients',	'Premium quality cashew nuts.'),
(16,	4,	'',	'Additional Information',	'Keep in an airtight container for freshness.'),
(17,	5,	'Diverse Nut Selection',	'Description',	'Indulge in a diverse selection of premium nuts in one pack.'),
(18,	5,	'Snacking Delight',	'Description',	'A delightful option for guilt-free snacking.'),
(19,	5,	'',	'Ingredients',	'An assortment of nuts including almonds, pistachios, and hazelnuts.'),
(20,	5,	'',	'Additional Information',	'Refrigeration recommended to maintain freshness.'),
(21,	6,	'Nature''s Energy Boost',	'Description',	'Get an energy boost from the goodness of nature with our trail mix.'),
(22,	6,	'On-the-Go Snacking',	'Description',	'Perfect for on-the-go snacking during outdoor activities.'),
(23,	6,	'',	'Ingredients',	'A mix of nuts, seeds, and dried fruits for a balanced blend.'),
(24,	6,	'',	'Additional Information',	'Resealable packaging for convenience.'),
(25,	7,	'Addictively Crunchy',	'Description',	'Experience addictive crunchiness with our pistachios.'),
(26,	7,	'Nutrient-Packed',	'Description',	'Pistachios packed with essential nutrients for your well-being.'),
(27,	7,	'',	'Ingredients',	'Roasted and salted pistachio nuts.'),
(28,	7,	'',	'Additional Information',	'Avoid exposure to direct sunlight to maintain quality.'),
(29,	8,	'Nature''s Brain Food',	'Description',	'Walnut halves, a natural source of brain-boosting nutrients.'),
(30,	8,	'Versatile Ingredient',	'Description',	'A versatile addition to both sweet and savory dishes.'),
(31,	8,	'',	'Ingredients',	'Premium quality walnut halves.'),
(32,	8,	'',	'Additional Information',	'Sealed packaging for prolonged freshness.'),
(33,	9,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(34,	9,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(35,	9,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(36,	9,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(37,	10,	'Perfect Harmony',	'Description',	'Discover the perfect harmony of sweet and savory with our pecans.'),
(38,	10,	'Versatile Snack',	'Description',	'Ideal for both snacking and adding a twist to dishes.'),
(39,	10,	'',	'Ingredients',	'Candied pecans with a touch of salt.'),
(40,	10,	'',	'Additional Information',	'Store in a dry place to maintain texture.'),
(41,	11,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(42,	11,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(43,	11,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(44,	11,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(45,	12,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(46,	12,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(47,	12,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(48,	12,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(49,	13,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(50,	13,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(51,	13,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(52,	13,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(53,	14,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(54,	14,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(55,	14,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(56,	14,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(57,	15,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(58,	15,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(59,	15,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(60,	15,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(61,	16,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(62,	16,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(63,	16,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(64,	16,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(65,	17,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(66,	17,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(67,	17,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(68,	17,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(69,	18,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(70,	18,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(71,	18,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(72,	18,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(73,	19,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(74,	19,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(75,	19,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(76,	19,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(77,	20,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(78,	20,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(79,	20,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(80,	20,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(81,	21,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(82,	21,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(83,	21,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(84,	21,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(85,	22,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(86,	22,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(87,	22,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(88,	22,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(89,	23,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(90,	23,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(91,	23,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(92,	23,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(93,	24,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(94,	24,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(95,	24,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(96,	24,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(97,	25,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(98,	25,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(99,	25,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(100,	25,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(101,	26,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(102,	26,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(103,	26,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(104,	26,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(105,	27,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(106,	27,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(107,	27,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(108,	27,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(109,	28,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(110,	28,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(111,	28,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(112,	28,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(113,	29,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(114,	29,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(115,	29,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(116,	29,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(117,	30,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(118,	30,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(119,	30,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(120,	30,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(121,	31,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(122,	31,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(123,	31,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(124,	31,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(125,	32,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(126,	32,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(127,	32,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(128,	32,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.'),
(129,	33,	'Timeless Favorite',	'Description',	'Indulge in the timeless taste of our salted peanuts.'),
(130,	33,	'Affordable Snack',	'Description',	'A budget-friendly choice for a satisfying snack.'),
(131,	33,	'',	'Ingredients',	'Roasted peanuts with a hint of salt.'),
(132,	33,	'',	'Additional Information',	'Shake well before consuming to evenly distribute salt.');

DROP TABLE IF EXISTS "tbl_product_discounts";
DROP SEQUENCE IF EXISTS tbl_discounts_id_seq;
CREATE SEQUENCE tbl_discounts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 32 CACHE 1;

CREATE TABLE "public"."tbl_product_discounts" (
    "id" integer DEFAULT nextval('tbl_discounts_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "seller_id" integer NOT NULL,
    "discount_percentage" integer,
    "start_date" date,
    "end_date" date,
    CONSTRAINT "tbl_discounts_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_product_discounts" ("id", "product_id", "seller_id", "discount_percentage", "start_date", "end_date") VALUES
(1,	1,	1,	10,	'2023-08-01',	'2023-08-01'),
(2,	3,	1,	10,	'2023-08-01',	'2023-08-01'),
(3,	4,	1,	15,	'2023-08-10',	'2023-08-15'),
(4,	5,	1,	12,	'2023-08-05',	'2023-08-12'),
(5,	6,	1,	8,	'2023-08-08',	'2023-08-15'),
(6,	7,	1,	10,	'2023-08-01',	'2023-08-07'),
(7,	8,	1,	12,	'2023-08-04',	'2023-08-11'),
(8,	9,	1,	10,	'2023-08-02',	'2023-08-09'),
(9,	10,	1,	10,	'2023-08-06',	'2023-08-13'),
(10,	11,	1,	10,	'2023-08-02',	'2023-08-09'),
(11,	12,	1,	10,	'2023-08-02',	'2023-08-09'),
(12,	13,	1,	10,	'2023-08-02',	'2023-08-09'),
(13,	14,	1,	10,	'2023-08-02',	'2023-08-09'),
(14,	15,	1,	10,	'2023-08-02',	'2023-08-09'),
(15,	16,	1,	10,	'2023-08-02',	'2023-08-09'),
(16,	17,	1,	10,	'2023-08-02',	'2023-08-09'),
(17,	18,	1,	10,	'2023-08-02',	'2023-08-09'),
(18,	19,	1,	10,	'2023-08-02',	'2023-08-09'),
(19,	20,	1,	10,	'2023-08-02',	'2023-08-09'),
(20,	21,	1,	10,	'2023-08-02',	'2023-08-09'),
(21,	22,	1,	10,	'2023-08-02',	'2023-08-09'),
(22,	23,	1,	10,	'2023-08-02',	'2023-08-09'),
(23,	24,	1,	10,	'2023-08-02',	'2023-08-09'),
(24,	25,	1,	10,	'2023-08-02',	'2023-08-09'),
(25,	26,	1,	10,	'2023-08-02',	'2023-08-09'),
(26,	27,	1,	10,	'2023-08-02',	'2023-08-09'),
(27,	28,	1,	10,	'2023-08-02',	'2023-08-09'),
(28,	29,	1,	10,	'2023-08-02',	'2023-08-09'),
(29,	30,	1,	10,	'2023-08-02',	'2023-08-09'),
(30,	31,	1,	10,	'2023-08-02',	'2023-08-09'),
(31,	32,	1,	10,	'2023-08-02',	'2023-08-09'),
(32,	33,	1,	10,	'2023-08-02',	'2023-08-09');

DROP TABLE IF EXISTS "tbl_product_images";
DROP SEQUENCE IF EXISTS tbl_product_images_id_seq;
CREATE SEQUENCE tbl_product_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 279 CACHE 1;

CREATE TABLE "public"."tbl_product_images" (
    "id" integer DEFAULT nextval('tbl_product_images_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "image_id" integer NOT NULL,
    CONSTRAINT "tbl_product_images_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_product_images" ("id", "product_id", "image_id") VALUES
(1,	1,	1),
(2,	1,	2),
(3,	1,	3),
(4,	1,	4),
(5,	1,	5),
(6,	1,	6),
(7,	1,	7),
(8,	1,	8),
(9,	1,	9),
(10,	1,	10),
(11,	1,	11),
(12,	1,	12),
(22,	3,	23),
(23,	3,	24),
(24,	3,	25),
(25,	3,	26),
(26,	3,	27),
(27,	3,	28),
(28,	3,	29),
(29,	3,	30),
(30,	3,	31),
(31,	4,	32),
(32,	4,	33),
(33,	4,	34),
(34,	4,	35),
(35,	4,	36),
(36,	4,	37),
(37,	4,	38),
(38,	4,	39),
(39,	4,	40),
(40,	4,	41),
(41,	4,	42),
(42,	4,	43),
(43,	4,	44),
(44,	4,	45),
(45,	5,	46),
(46,	5,	47),
(47,	5,	48),
(48,	5,	49),
(49,	5,	50),
(50,	5,	51),
(51,	5,	52),
(52,	5,	53),
(53,	5,	54),
(54,	5,	55),
(55,	5,	56),
(56,	6,	57),
(57,	6,	58),
(58,	6,	59),
(59,	6,	60),
(60,	6,	61),
(61,	6,	62),
(62,	6,	63),
(63,	6,	64),
(64,	6,	65),
(65,	6,	66),
(66,	6,	67),
(67,	7,	68),
(68,	7,	69),
(69,	7,	70),
(70,	7,	71),
(71,	7,	72),
(72,	7,	73),
(73,	7,	74),
(74,	7,	75),
(75,	7,	76),
(76,	8,	77),
(77,	8,	78),
(78,	8,	79),
(79,	8,	80),
(80,	8,	81),
(81,	8,	82),
(82,	8,	83),
(83,	8,	84),
(84,	8,	85),
(85,	9,	86),
(86,	9,	87),
(87,	9,	88),
(88,	9,	89),
(89,	9,	90),
(90,	9,	91),
(91,	9,	92),
(92,	9,	93),
(93,	9,	94),
(94,	10,	95),
(95,	10,	96),
(96,	10,	97),
(97,	10,	98),
(98,	10,	99),
(99,	10,	100),
(100,	10,	101),
(101,	10,	102),
(102,	10,	103),
(103,	10,	104),
(104,	11,	105),
(105,	11,	106),
(106,	11,	107),
(107,	11,	108),
(108,	11,	109),
(109,	11,	110),
(110,	11,	111),
(111,	12,	112),
(112,	12,	113),
(113,	12,	114),
(114,	12,	115),
(115,	12,	116),
(116,	12,	117),
(117,	12,	118),
(118,	12,	119),
(119,	13,	120),
(120,	13,	121),
(121,	13,	122),
(122,	13,	123),
(123,	13,	124),
(124,	13,	125),
(125,	13,	126),
(126,	13,	127),
(127,	14,	128),
(128,	14,	129),
(129,	14,	130),
(130,	14,	131),
(131,	14,	132),
(132,	14,	133),
(133,	14,	134),
(134,	14,	135),
(135,	15,	136),
(136,	15,	137),
(137,	15,	138),
(138,	15,	139),
(139,	15,	140),
(140,	15,	141),
(141,	15,	142),
(142,	15,	143),
(143,	16,	144),
(144,	16,	145),
(145,	16,	146),
(146,	16,	147),
(147,	16,	148),
(148,	16,	149),
(149,	16,	150),
(150,	16,	151),
(151,	17,	152),
(152,	17,	153),
(153,	17,	154),
(154,	17,	155),
(155,	17,	156),
(156,	17,	157),
(157,	17,	158),
(158,	17,	159),
(159,	18,	160),
(160,	18,	161),
(161,	18,	162),
(162,	18,	163),
(163,	18,	164),
(164,	18,	165),
(165,	18,	166),
(166,	18,	167),
(167,	19,	168),
(168,	19,	169),
(169,	19,	170),
(170,	19,	171),
(171,	19,	172),
(172,	19,	173),
(173,	19,	174),
(174,	19,	175),
(175,	20,	176),
(176,	20,	177),
(177,	20,	178),
(178,	20,	179),
(179,	20,	180),
(180,	20,	181),
(181,	20,	182),
(182,	20,	183),
(183,	21,	176),
(184,	21,	177),
(185,	21,	178),
(186,	21,	179),
(187,	21,	180),
(188,	21,	181),
(189,	21,	182),
(190,	21,	183),
(191,	22,	184),
(192,	22,	185),
(193,	22,	186),
(194,	22,	187),
(195,	22,	188),
(196,	22,	189),
(197,	22,	190),
(198,	22,	191),
(199,	23,	192),
(200,	23,	193),
(201,	23,	194),
(202,	23,	195),
(203,	23,	196),
(204,	23,	197),
(205,	23,	198),
(206,	23,	199),
(207,	24,	200),
(208,	24,	201),
(209,	24,	202),
(210,	24,	203),
(211,	24,	204),
(212,	24,	205),
(213,	25,	206),
(214,	25,	207),
(215,	25,	208),
(216,	25,	209),
(217,	25,	210),
(218,	25,	211),
(219,	25,	212),
(220,	26,	213),
(221,	26,	214),
(222,	26,	215),
(223,	26,	216),
(224,	26,	217),
(225,	26,	218),
(226,	26,	219),
(227,	27,	220),
(228,	27,	221),
(229,	27,	222),
(230,	27,	223),
(231,	27,	224),
(232,	27,	225),
(233,	27,	226),
(234,	28,	227),
(235,	28,	228),
(236,	28,	229),
(237,	28,	230),
(238,	28,	231),
(239,	28,	232),
(240,	28,	233),
(241,	28,	234),
(242,	29,	235),
(243,	29,	236),
(244,	29,	237),
(245,	29,	238),
(246,	29,	239),
(247,	29,	240),
(248,	29,	241),
(249,	30,	235),
(250,	30,	236),
(251,	30,	237),
(252,	30,	238),
(253,	30,	239),
(254,	30,	240),
(255,	30,	241),
(256,	31,	227),
(257,	31,	228),
(258,	31,	229),
(259,	31,	230),
(260,	31,	231),
(261,	31,	232),
(262,	31,	233),
(263,	31,	234),
(264,	32,	242),
(265,	32,	243),
(266,	32,	244),
(267,	32,	245),
(268,	32,	246),
(269,	32,	247),
(270,	32,	248),
(271,	32,	249),
(272,	33,	250),
(273,	33,	251),
(274,	33,	252),
(275,	33,	253),
(276,	33,	254),
(277,	33,	255),
(278,	33,	256),
(279,	33,	257);

DROP TABLE IF EXISTS "tbl_product_variant";
DROP SEQUENCE IF EXISTS tbl_quantity_price_id_seq;
CREATE SEQUENCE tbl_quantity_price_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 99 CACHE 1;

CREATE TABLE "public"."tbl_product_variant" (
    "id" integer DEFAULT nextval('tbl_quantity_price_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "variant_name" character varying(255) NOT NULL,
    "price" integer NOT NULL,
    "pack" integer NOT NULL,
    CONSTRAINT "tbl_quantity_price_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."tbl_product_variant"."pack" IS 'send 1 of nothing';

INSERT INTO "tbl_product_variant" ("id", "product_id", "variant_name", "price", "pack") VALUES
(1,	1,	'200g',	275,	1),
(2,	1,	'400g',	500,	2),
(3,	1,	'1kg',	1200,	5),
(7,	3,	'250g',	400,	1),
(8,	3,	'500g',	750,	2),
(9,	3,	'1kg',	1400,	5),
(10,	4,	'200g',	220,	1),
(11,	4,	'400g',	400,	2),
(12,	4,	'1kg',	900,	5),
(13,	5,	'300g',	350,	1),
(14,	5,	'500g',	600,	2),
(15,	5,	'1kg',	1100,	5),
(16,	6,	'300g',	320,	1),
(17,	6,	'600g',	600,	2),
(18,	6,	'1.2kg',	1150,	4),
(19,	7,	'180g',	250,	1),
(20,	7,	'360g',	450,	2),
(21,	7,	'750g',	850,	4),
(22,	8,	'200g',	300,	1),
(23,	8,	'400g',	550,	2),
(24,	8,	'800g',	1000,	4),
(25,	9,	'150g',	150,	1),
(26,	9,	'300g',	280,	2),
(27,	9,	'600g',	500,	4),
(28,	10,	'180g',	320,	1),
(29,	10,	'360g',	600,	2),
(30,	10,	'750g',	1100,	4),
(31,	11,	'150g',	150,	1),
(32,	11,	'300g',	280,	2),
(33,	11,	'350g',	340,	2),
(34,	12,	'150g',	150,	1),
(35,	12,	'300g',	280,	2),
(36,	12,	'350g',	340,	2),
(37,	13,	'150g',	150,	1),
(38,	13,	'300g',	280,	2),
(39,	13,	'350g',	340,	2),
(40,	14,	'15g',	150,	12),
(41,	14,	'30g',	280,	6),
(42,	14,	'350g',	340,	2),
(43,	15,	'200g',	295,	1),
(44,	15,	'300g',	335,	1),
(45,	15,	'350g',	380,	1),
(46,	16,	'200g',	280,	1),
(47,	16,	'300g',	320,	1),
(48,	16,	'350g',	355,	1),
(49,	17,	'200g',	280,	1),
(50,	17,	'300g',	320,	1),
(51,	17,	'350g',	355,	1),
(52,	18,	'200g',	280,	1),
(53,	18,	'300g',	320,	1),
(54,	18,	'350g',	355,	1),
(55,	19,	'204g',	540,	12),
(56,	19,	'300g',	720,	14),
(57,	19,	'350g',	355,	1),
(58,	20,	'204g',	540,	12),
(59,	20,	'300g',	720,	14),
(60,	20,	'350g',	355,	1),
(61,	21,	'204g',	540,	12),
(62,	21,	'300g',	720,	14),
(63,	21,	'350g',	355,	1),
(64,	22,	'204g',	475,	12),
(65,	22,	'300g',	675,	14),
(66,	22,	'350g',	875,	1),
(67,	23,	'204g',	475,	12),
(68,	23,	'300g',	675,	14),
(69,	23,	'350g',	875,	1),
(70,	24,	'204g',	110,	50),
(71,	24,	'300g',	220,	50),
(72,	24,	'350g',	420,	60),
(73,	25,	'110g',	99,	2),
(74,	25,	'200g',	199,	4),
(75,	25,	'300g',	299,	6),
(76,	26,	'110g',	99,	2),
(77,	26,	'200g',	199,	4),
(78,	26,	'300g',	299,	6),
(79,	27,	'110g',	99,	2),
(80,	27,	'200g',	199,	4),
(81,	27,	'300g',	299,	6),
(82,	28,	'150g',	325,	3),
(83,	28,	'200g',	380,	4),
(84,	28,	'300g',	449,	6),
(85,	29,	'150g',	325,	3),
(86,	29,	'200g',	380,	4),
(87,	29,	'300g',	449,	6),
(88,	30,	'150g',	325,	3),
(89,	30,	'200g',	380,	4),
(90,	30,	'300g',	449,	6),
(91,	31,	'150g',	325,	3),
(92,	31,	'200g',	380,	4),
(93,	31,	'300g',	449,	6),
(94,	32,	'150g',	325,	3),
(95,	32,	'200g',	380,	4),
(96,	32,	'300g',	449,	6),
(97,	33,	'150g',	325,	3),
(98,	33,	'200g',	380,	4),
(99,	33,	'300g',	449,	6);

DROP TABLE IF EXISTS "tbl_rating";
DROP SEQUENCE IF EXISTS tbl_rating_id_seq;
CREATE SEQUENCE tbl_rating_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_rating" (
    "id" integer DEFAULT nextval('tbl_rating_id_seq') NOT NULL,
    "product_id" integer NOT NULL,
    "customer_id" integer NOT NULL,
    "seller_id" integer NOT NULL,
    "rating_value" integer NOT NULL,
    "review_text" integer,
    CONSTRAINT "tbl_rating_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_reason_to_buy";
DROP SEQUENCE IF EXISTS tbl_reason_to_buy_id_seq;
CREATE SEQUENCE tbl_reason_to_buy_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_reason_to_buy" (
    "id" integer DEFAULT nextval('tbl_reason_to_buy_id_seq') NOT NULL,
    "order_id" integer NOT NULL,
    "reason_text" integer NOT NULL,
    CONSTRAINT "tbl_reason_to_buy_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_sellers";
DROP SEQUENCE IF EXISTS tbl_sellers_id_seq;
CREATE SEQUENCE tbl_sellers_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_sellers" (
    "id" integer DEFAULT nextval('tbl_sellers_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    "email" character varying(255) NOT NULL,
    "phone" character varying(255) NOT NULL,
    CONSTRAINT "tbl_sellers_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_sellers" ("id", "name", "email", "phone") VALUES
(1,	'Ramdhari Singh Dinkar',	'ramdharidinkar@mailinator.com',	'154511254');

DROP TABLE IF EXISTS "tbl_stock";
DROP SEQUENCE IF EXISTS tbl_stock_id_seq;
CREATE SEQUENCE tbl_stock_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_stock" (
    "id" integer DEFAULT nextval('tbl_stock_id_seq') NOT NULL,
    "varient_id" integer NOT NULL,
    "seller_id" integer NOT NULL,
    "available_quantity" integer NOT NULL,
    CONSTRAINT "tbl_stock_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

COMMENT ON COLUMN "public"."tbl_stock"."varient_id" IS 'one product can have many varients so can''t add product_id';


DROP TABLE IF EXISTS "tbl_wishlist";
DROP SEQUENCE IF EXISTS tbl_wishlist_id_seq;
CREATE SEQUENCE tbl_wishlist_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_wishlist" (
    "id" integer DEFAULT nextval('tbl_wishlist_id_seq') NOT NULL,
    "customer_id" integer NOT NULL,
    CONSTRAINT "tbl_wishlist_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_wishlist_item";
DROP SEQUENCE IF EXISTS wishlist_item_id_seq;
CREATE SEQUENCE wishlist_item_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 START 1 CACHE 1;

CREATE TABLE "public"."tbl_wishlist_item" (
    "id" integer DEFAULT nextval('wishlist_item_id_seq') NOT NULL,
    "wishlist_id" integer NOT NULL,
    "product_id" integer NOT NULL,
    "seller_id" integer NOT NULL,
    CONSTRAINT "wishlist_item_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


ALTER TABLE ONLY "public"."tbl_address" ADD CONSTRAINT "tbl_address_area_id_fkey" FOREIGN KEY (area_id) REFERENCES tbl_area(id) ON DELETE RESTRICT NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_address" ADD CONSTRAINT "tbl_address_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES tbl_customer(id) ON DELETE RESTRICT NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_area_product_availability" ADD CONSTRAINT "tbl_area_product_availability_area_id_fkey" FOREIGN KEY (area_id) REFERENCES tbl_area(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_area_product_availability" ADD CONSTRAINT "tbl_area_product_availability_product_id_fkey" FOREIGN KEY (product_id) REFERENCES tbl_product(id) ON DELETE RESTRICT NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_area_product_availability" ADD CONSTRAINT "tbl_area_product_availability_seller_id_fkey" FOREIGN KEY (seller_id) REFERENCES tbl_sellers(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_cart" ADD CONSTRAINT "tbl_cart_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES tbl_customer(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_cart_item" ADD CONSTRAINT "tbl_cart_item_cart_id_fkey" FOREIGN KEY (cart_id) REFERENCES tbl_cart(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_cart_item" ADD CONSTRAINT "tbl_cart_item_product_id_fkey" FOREIGN KEY (product_id) REFERENCES tbl_product(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_cart_item" ADD CONSTRAINT "tbl_cart_item_seller_id_fkey" FOREIGN KEY (seller_id) REFERENCES tbl_sellers(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_customer" ADD CONSTRAINT "tbl_customer_image_id_fkey" FOREIGN KEY (image_id) REFERENCES tbl_image(id) ON DELETE RESTRICT NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_order" ADD CONSTRAINT "tbl_order_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES tbl_customer(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_order_item" ADD CONSTRAINT "tbl_order_item_applied_discount_fkey" FOREIGN KEY (applied_discount) REFERENCES tbl_product_discounts(id) ON DELETE RESTRICT NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_order_item" ADD CONSTRAINT "tbl_order_item_order_id_fkey" FOREIGN KEY (order_id) REFERENCES tbl_order(id) ON DELETE RESTRICT NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_order_item" ADD CONSTRAINT "tbl_order_item_product_id_fkey" FOREIGN KEY (product_id) REFERENCES tbl_product(id) ON DELETE RESTRICT NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_order_item" ADD CONSTRAINT "tbl_order_item_seller_id_fkey" FOREIGN KEY (seller_id) REFERENCES tbl_sellers(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_payment" ADD CONSTRAINT "tbl_payment_order_id_fkey" FOREIGN KEY (order_id) REFERENCES tbl_order(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_product" ADD CONSTRAINT "tbl_product_catagory_id_fkey" FOREIGN KEY (category_id) REFERENCES tbl_product_category(id) ON DELETE RESTRICT NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_product_description" ADD CONSTRAINT "tbl_product_description_product_id_fkey" FOREIGN KEY (product_id) REFERENCES tbl_product(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_product_discounts" ADD CONSTRAINT "tbl_discounts_seller_id_fkey" FOREIGN KEY (seller_id) REFERENCES tbl_sellers(id) ON DELETE RESTRICT NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_product_images" ADD CONSTRAINT "tbl_product_images_image_id_fkey" FOREIGN KEY (image_id) REFERENCES tbl_image(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_product_images" ADD CONSTRAINT "tbl_product_images_product_id_fkey" FOREIGN KEY (product_id) REFERENCES tbl_product(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_product_variant" ADD CONSTRAINT "tbl_quantity_price_product_id_fkey" FOREIGN KEY (product_id) REFERENCES tbl_product(id) ON DELETE RESTRICT NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_rating" ADD CONSTRAINT "tbl_rating_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES tbl_customer(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_rating" ADD CONSTRAINT "tbl_rating_product_id_fkey" FOREIGN KEY (product_id) REFERENCES tbl_product(id) ON DELETE RESTRICT NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_rating" ADD CONSTRAINT "tbl_rating_seller_id_fkey" FOREIGN KEY (seller_id) REFERENCES tbl_sellers(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_reason_to_buy" ADD CONSTRAINT "tbl_reason_to_buy_order_id_fkey" FOREIGN KEY (order_id) REFERENCES tbl_order(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_stock" ADD CONSTRAINT "tbl_stock_seller_id_fkey" FOREIGN KEY (seller_id) REFERENCES tbl_sellers(id) ON DELETE RESTRICT NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_stock" ADD CONSTRAINT "tbl_stock_varient_id_fkey" FOREIGN KEY (varient_id) REFERENCES tbl_product_variant(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_wishlist" ADD CONSTRAINT "tbl_wishlist_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES tbl_customer(id) NOT DEFERRABLE;

ALTER TABLE ONLY "public"."tbl_wishlist_item" ADD CONSTRAINT "wishlist_item_product_id_fkey" FOREIGN KEY (product_id) REFERENCES tbl_product(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_wishlist_item" ADD CONSTRAINT "wishlist_item_seller_id_fkey" FOREIGN KEY (seller_id) REFERENCES tbl_sellers(id) NOT DEFERRABLE;
ALTER TABLE ONLY "public"."tbl_wishlist_item" ADD CONSTRAINT "wishlist_item_wishlist_id_fkey" FOREIGN KEY (wishlist_id) REFERENCES tbl_wishlist(id) NOT DEFERRABLE;

-- 2023-09-01 14:22:01.057516+05:30