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


DROP TABLE IF EXISTS "tbl_area_product_availability";
DROP SEQUENCE IF EXISTS tbl_area_product_availability_id_seq;
CREATE SEQUENCE tbl_area_product_availability_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
CREATE SEQUENCE tbl_banner_id_seq1 INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
CREATE SEQUENCE tbl_brand_logo_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
CREATE SEQUENCE tbl_cart_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_cart" (
    "id" integer DEFAULT nextval('tbl_cart_id_seq') NOT NULL,
    "customer_id" integer NOT NULL,
    CONSTRAINT "tbl_cart_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_cart_item";
DROP SEQUENCE IF EXISTS tbl_cart_item_id_seq;
CREATE SEQUENCE tbl_cart_item_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
(104,	'1692950293654-153921458.webp',	'packof5_1007138d-8730-463c-b41c-99b789a9633f.webp',	'2023-08-25 13:28:13.761');

DROP TABLE IF EXISTS "tbl_order";
DROP SEQUENCE IF EXISTS tbl_order_id_seq;
CREATE SEQUENCE tbl_order_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_order" (
    "id" integer DEFAULT nextval('tbl_order_id_seq') NOT NULL,
    "customer_id" integer NOT NULL,
    "order_date" timestamp NOT NULL,
    "total_amount" integer NOT NULL,
    CONSTRAINT "tbl_order_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_order_item";
DROP SEQUENCE IF EXISTS tbl_order_item_id_seq;
CREATE SEQUENCE tbl_order_item_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
CREATE SEQUENCE tbl_payment_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
CREATE SEQUENCE tbl_product_id_seq1 INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
(4,	'Happilo Fresh & Delicious Crunchy Cashews',	4);

DROP TABLE IF EXISTS "tbl_product_category";
DROP SEQUENCE IF EXISTS tbl_categories_id_seq;
CREATE SEQUENCE tbl_categories_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
(10,	'Nuts');

DROP TABLE IF EXISTS "tbl_product_description";
DROP SEQUENCE IF EXISTS tbl_product_description_id_seq;
CREATE SEQUENCE tbl_product_description_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
(40,	10,	'',	'Additional Information',	'Store in a dry place to maintain texture.');

DROP TABLE IF EXISTS "tbl_product_discounts";
DROP SEQUENCE IF EXISTS tbl_discounts_id_seq;
CREATE SEQUENCE tbl_discounts_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
(9,	10,	1,	10,	'2023-08-06',	'2023-08-13');

DROP TABLE IF EXISTS "tbl_product_images";
DROP SEQUENCE IF EXISTS tbl_product_images_id_seq;
CREATE SEQUENCE tbl_product_images_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
(103,	10,	104);

DROP TABLE IF EXISTS "tbl_product_variant";
DROP SEQUENCE IF EXISTS tbl_quantity_price_id_seq;
CREATE SEQUENCE tbl_quantity_price_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
(30,	10,	'750g',	1100,	4);

DROP TABLE IF EXISTS "tbl_rating";
DROP SEQUENCE IF EXISTS tbl_rating_id_seq;
CREATE SEQUENCE tbl_rating_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
CREATE SEQUENCE tbl_reason_to_buy_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_reason_to_buy" (
    "id" integer DEFAULT nextval('tbl_reason_to_buy_id_seq') NOT NULL,
    "order_id" integer NOT NULL,
    "reason_text" integer NOT NULL,
    CONSTRAINT "tbl_reason_to_buy_pkey" PRIMARY KEY ("id")
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

INSERT INTO "tbl_sellers" ("id", "name", "email", "phone") VALUES
(1,	'Ramdhari Singh Dinkar',	'ramdharidinkar@mailinator.com',	'154511254');

DROP TABLE IF EXISTS "tbl_stock";
DROP SEQUENCE IF EXISTS tbl_stock_id_seq;
CREATE SEQUENCE tbl_stock_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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
CREATE SEQUENCE tbl_wishlist_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_wishlist" (
    "id" integer DEFAULT nextval('tbl_wishlist_id_seq') NOT NULL,
    "customer_id" integer NOT NULL,
    CONSTRAINT "tbl_wishlist_pkey" PRIMARY KEY ("id")
) WITH (oids = false);


DROP TABLE IF EXISTS "tbl_wishlist_item";
DROP SEQUENCE IF EXISTS wishlist_item_id_seq;
CREATE SEQUENCE wishlist_item_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

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

-- 2023-08-27 19:46:19.296105+05:30