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
(35,	'1691320573466-fbc00d1d047d8241a4de4f856b41b76485635f18.png',	'logohappilo.png',	'2023-08-06 16:46:13.53'),
(36,	'1691496618592-80c57bd3169934ef73a13e303011a1cbb3802c16.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-08 17:40:18.76'),
(37,	'1691496748365-6457654c20e0e86bdbf8626de10683615f91e33c.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-08 17:42:28.632'),
(38,	'1691496748374-b0424de5fa14a435b0a877d0793ba9b60338edc0.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-08 17:42:28.638'),
(39,	'1691496748386-07027f3bf588ba7eaa9c9661752473318da76cf1.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-08 17:42:28.644'),
(40,	'1691496748390-6821da2b221a32d8fa129f4e4777509437003bd9.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-08 17:42:28.646'),
(41,	'1691496748391-6b51fcadf2158082e68bfbd51f685289434a78b0.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-08 17:42:28.649'),
(42,	'1691496748392-e8ad584f79fcd3f27cbd3da88ad71a87d93da7bd.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-08 17:42:28.651'),
(43,	'1691496748393-10adb82be011939400ac6138647a4830dc9a7d31.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-08 17:42:28.654'),
(44,	'1691496748394-b88bf7301705138f76632d4e9cbf492300f103a4.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-08 17:42:28.657'),
(45,	'1691496748395-f8bdc9b306488115fdbed8d8c329a9e6f475f1f5.webp',	'almondspackof4.webp',	'2023-08-08 17:42:28.659'),
(46,	'1691496748396-4d8110f04dbea38ab84ad631f8c6d1e0bd03e487.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-08 17:42:28.662'),
(47,	'1691496748397-2f4a804fb1aae2f5d3ffeada81fcc9e1bba9ba0d.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-08 17:42:28.664'),
(48,	'1691496748398-b4ddf036bdbcee954d3842badd70affa9d4a3b07.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-08 17:42:28.666'),
(49,	'1691496802242-9017212b7cd5d7a235ad0c3c6ef36206aa6f2eb7.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-08 17:43:22.33'),
(50,	'1691496802249-aa84a3b43d15cced9ee7feb9c96ac339e61abf4b.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-08 17:43:22.333'),
(51,	'1691496802254-0782edcb26be832da60c8796b63c698429b0a14f.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-08 17:43:22.334'),
(52,	'1691496802255-d60edbe3f2d1312b5046d6e7a6689e005084293c.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-08 17:43:22.335'),
(53,	'1691496802256-2cf58200436bd47967ca58178a1a989a742eabe5.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-08 17:43:22.336'),
(54,	'1691496802259-124dfdb3457ed2f0796a7c8fb73ebe18f85ece79.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-08 17:43:22.337'),
(55,	'1691496802260-2dc3748e1a2ae6d79762bfc78bf370f716e97677.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-08 17:43:22.338'),
(56,	'1691496802261-a790e398e8e0372b497360463698f51cb68350c4.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-08 17:43:22.341'),
(57,	'1691496802264-d102a6f2a69791fd745728ecd516552fc670e3b0.webp',	'almondspackof4.webp',	'2023-08-08 17:43:22.343'),
(58,	'1691496802265-53b4d33df1547b03168246b87bdbf19daa404f70.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-08 17:43:22.344'),
(59,	'1691496802266-3bfd1e0c214dca53931f60d7b9ce2546aebeb8c6.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-08 17:43:22.346'),
(60,	'1691496802267-435b28130bd74d652f090cdef99fdb323158211f.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-08 17:43:22.348'),
(61,	'1691496930370-95aef1ce6a443e1a8b42623bf0e999a9ef5b25ee.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-08 17:45:30.518'),
(62,	'1691496930377-fbea7d6b0f5a3de7ce8e2bb64ec2f34bca3c6d97.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-08 17:45:30.522'),
(63,	'1691496930383-73c5c2c65b79ceb6dc2813fd1ebc5822a49c70bf.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-08 17:45:30.526'),
(64,	'1691496930384-3b2f2a2d392ca407d4f2dbbea64dbbcec8567635.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-08 17:45:30.529'),
(65,	'1691496930385-89f17826d3d717abbfcc3a7ffee44e6e01630e74.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-08 17:45:30.531'),
(66,	'1691496930387-c6bd8906af5fedd9d4c5bc365dc658576d2903de.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-08 17:45:30.534'),
(67,	'1691496930389-5d913ed39540bf2ff943f3ac60f57a0f43bcb312.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-08 17:45:30.536'),
(68,	'1691496930395-4a926b85427b9f878973a1b708f51d4212644e63.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-08 17:45:30.538'),
(69,	'1691496930397-bd1e5381bfc2169bc36d964fea096baa0c1622fe.webp',	'almondspackof4.webp',	'2023-08-08 17:45:30.54'),
(70,	'1691496930398-e2e6a0beb867049b595f4eae0502873e820407fe.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-08 17:45:30.542'),
(71,	'1691496930400-11b8ed2b2491c6ec0bcdfb1ec66b190c5bb49fc6.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-08 17:45:30.545'),
(72,	'1691496930401-cd3457d3ccb3e2bb5e8f658b9a2fd7cbc831f8f6.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-08 17:45:30.547'),
(73,	'1691496981698-ae5baa0344ed0780b7e6007d48e4e6f1af90710a.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-08 17:46:21.797'),
(74,	'1691496981705-800eb7ee3853af09f0edc95d80455b9aee48e722.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-08 17:46:21.8'),
(75,	'1691496981715-05c06a070f01b53c59266d2add48e24f2ca0b264.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-08 17:46:21.802'),
(76,	'1691496981716-efe51e39334e55010cec856b3185ab050c722c9b.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-08 17:46:21.803'),
(77,	'1691496981718-45b88046ecfc7e1569c88ca60e5589e570459930.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-08 17:46:21.805'),
(78,	'1691496981722-00fc182f7955d70a4231d9094ac8c2e49f67bdb9.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-08 17:46:21.808'),
(79,	'1691496981727-237de1ac0557978397d14bc703ea0de4f94416a3.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-08 17:46:21.811'),
(80,	'1691496981730-0be4b0dc52ff7a506f4fe38d5efa4b87cbfe6c43.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-08 17:46:21.813'),
(81,	'1691496981732-23dc824e47dad9245b9cf9c4837da65df1fe88b1.webp',	'almondspackof4.webp',	'2023-08-08 17:46:21.816'),
(82,	'1691496981734-48aa864186b7454831d81639fe0bcc075ac78f8f.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-08 17:46:21.818'),
(83,	'1691496981736-af3545dbcc302764da1489a4794b37546a4d40f7.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-08 17:46:21.82'),
(84,	'1691496981738-13b90c39c3fa9014dc4419262d2daed83997ffdd.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-08 17:46:21.822'),
(85,	'1691497434368-312cc561f3860cb38b8af4ddd7cb66b7a804e271.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-08 17:53:54.443'),
(86,	'1691497434370-c94cb1b2d105c611c42c61a43f9edd79008b771c.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-08 17:53:54.445'),
(87,	'1691497434376-bd7b2d02e5d7908a250537b747613811233e0740.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-08 17:53:54.446'),
(88,	'1691497434377-3f5fe79b8ef1d2d09f7d614af6c59d56f5903cfa.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-08 17:53:54.447'),
(89,	'1691497434378-dd55c9cc3c892bd3424685ab784c1a7899ec5ef1.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-08 17:53:54.449'),
(90,	'1691497434379-9b40562ce2bc323f609635edb103dde89206e745.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-08 17:53:54.449'),
(91,	'1691497434380-1de6540958403272aace613bdd04d7b8239ab078.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-08 17:53:54.45'),
(92,	'1691497434381-e602b381c4a81ad4b1624e551373fb0f28e45ddf.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-08 17:53:54.451'),
(93,	'1691497434381-dae7a98a28dae96833252b3c5db310de68ffc91f.webp',	'almondspackof4.webp',	'2023-08-08 17:53:54.451'),
(94,	'1691497434382-bdd50f8666cd9abd7cee8f8fefd2726415e7f49c.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-08 17:53:54.452'),
(95,	'1691497434383-23f0a629425e3b40e3df5e94084f989243812c92.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-08 17:53:54.453'),
(96,	'1691497434384-ce27bc8ebc55ad2140e0d50229d3361ecb97d98b.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-08 17:53:54.453'),
(97,	'1691497474516-5f9d667a6b19a31eb1938b31204305364ad29184.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-08 17:54:34.616'),
(98,	'1691497474520-6d2509809015e1140326e03a7b3d4b12afd59ff7.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-08 17:54:34.618'),
(99,	'1691497474526-ed0adb9f7f0f30a5196a07649e75a6c12d430217.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-08 17:54:34.619'),
(100,	'1691497474527-0adab6d35a176507ccbe945caf026a1c22e120b5.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-08 17:54:34.62'),
(101,	'1691497474527-ec26cff00b67a7435929c6fdb1f3925d99774c94.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-08 17:54:34.62'),
(102,	'1691497474529-93e67ab671bd54d3c7d9272f081bc93087ff8ddb.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-08 17:54:34.621'),
(103,	'1691497474530-226fc61f97603778c3016e2419281f8a0eff7de5.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-08 17:54:34.622'),
(104,	'1691497474531-e5f4365c6ea617cb94877ca5c755c197e9805f58.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-08 17:54:34.623'),
(105,	'1691497474532-69fe8da2fea9808fea17b4650e9478351fb25b0b.webp',	'almondspackof4.webp',	'2023-08-08 17:54:34.623'),
(106,	'1691497474533-34b033d0121ad965780fdc63fae03b5696bcc29b.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-08 17:54:34.624'),
(107,	'1691497474534-95642120637c777f7980f4cb1600b5a1abf7dbaa.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-08 17:54:34.625'),
(108,	'1691497474535-e6b6c5d8f3abab0ea46afa26e1dac419b4fe55f0.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-08 17:54:34.625'),
(109,	'1691497596685-0137f34ea3097af1c760dff404d0a0760172ada4.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-08 17:56:36.768'),
(110,	'1691497596686-2c79cc60713f1dd4dfb748d2626b8e90424e67bd.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-08 17:56:36.77'),
(111,	'1691497596687-3d3fb8e39b40f1f559b7d71e916b78586ed1ea30.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-08 17:56:36.771'),
(112,	'1691497596689-00a7f9a85abb499cd59a2f51cb7247eeca8c51df.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-08 17:56:36.772'),
(113,	'1691497596695-84483f1c044bf8ea6ebc59c96d8eb45f8e6dc259.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-08 17:56:36.772'),
(114,	'1691497596696-fc907d3d8a24888a0095a8d0c62389df80939417.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-08 17:56:36.773'),
(115,	'1691497596698-d77563cf60ff47ab8cb6787229e321ac6d84b125.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-08 17:56:36.774'),
(116,	'1691497596698-4f4e6d3180c041c624da7c9abdb4da3125cc1e09.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-08 17:56:36.776'),
(117,	'1691497596699-69a9d182f57f1a7bf02de046a46c82652d2cf9f4.webp',	'almondspackof4.webp',	'2023-08-08 17:56:36.777'),
(118,	'1691497596700-f59bceb71bd6037f54d4b106336218b7aebc8510.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-08 17:56:36.778'),
(119,	'1691497596701-58b625b7a5566c91d079f6ce933066ae81106527.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-08 17:56:36.779'),
(120,	'1691497596701-4464e4cc8a9735d47e42a31b3a0006927af9a9b1.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-08 17:56:36.78'),
(121,	'1691497652495-bdd8a6c8ae4091ba30ebae3597ee8e040b849cdd.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-08 17:57:32.593'),
(122,	'1691497652500-f58ea4ce895381c7c10e7e93043e58e48de21416.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-08 17:57:32.618'),
(123,	'1691497652507-d11c72cbbe09cc58d062c1ade9fdb965010a9b98.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-08 17:57:32.621'),
(124,	'1691497652509-a04ac351ba48448dfeb2d50bb2ff7cefdd523544.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-08 17:57:32.623'),
(125,	'1691497652513-20df372515401dde5293bb0a0a78c086b033b8ea.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-08 17:57:32.624'),
(126,	'1691497652515-fc8b5920bf573ff0b1399b52209ea66b1635ae89.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-08 17:57:32.626'),
(127,	'1691497652516-745d433f5dd33a38ce40b33b92d92118d62744fd.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-08 17:57:32.629'),
(128,	'1691497652517-2ad02c2886180c43f216eeb14167fbf172f13e69.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-08 17:57:32.631'),
(129,	'1691497652518-3e8a8c50acbe5fed780ae7cfb0146915b39d3833.webp',	'almondspackof4.webp',	'2023-08-08 17:57:32.634'),
(130,	'1691497652519-ddeaaed54b683378c7968353d2a4f2f6fcfdc3dd.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-08 17:57:32.636'),
(131,	'1691497652520-cb455e1dbe6a7b939eed5b25cf67a5ba5cdce00e.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-08 17:57:32.638'),
(132,	'1691497652521-a3374d0ebaa9fe5569f39a9ada0e29f8e9b136f3.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-08 17:57:32.64'),
(133,	'1691497718894-9074d292514fb97569fb283cdcd22f8d3456df84.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-08 17:58:38.976'),
(134,	'1691497718901-14e3c380782c4e0081c48e32df469fefdb24ce3c.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-08 17:58:38.98'),
(135,	'1691497718908-9b4842886cf513ed2a149863ee72ff5e3780b51c.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-08 17:58:38.982'),
(136,	'1691497718909-d53f33ef9d7cc4ac7b9661f4cd8b6cc018d4cba2.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-08 17:58:38.983'),
(137,	'1691497718911-1090f4e578c81429ff065f2ef7780b9a4d9d1b75.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-08 17:58:38.984'),
(138,	'1691497718913-1cafe509221e3e8e2bd754e63c46514e6271c5f6.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-08 17:58:38.986'),
(139,	'1691497718918-52bc5b300e22531d6709d0078d7ee1571f78a95b.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-08 17:58:38.987'),
(140,	'1691497718920-9e8d2fb821b4bd508e5342957543a20aba3663af.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-08 17:58:38.988'),
(141,	'1691497718921-85b64bb069161259ece1955dd05370f422855434.webp',	'almondspackof4.webp',	'2023-08-08 17:58:38.989'),
(142,	'1691497718922-8c05719d5816cee7c096b20317e53aa45acb55af.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-08 17:58:38.99'),
(143,	'1691497718924-ef9635703049b0c66884509c7c2f41890a84953b.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-08 17:58:38.991'),
(144,	'1691497718925-182085c3e42b1571ffb58604763a3e954781da50.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-08 17:58:38.992'),
(145,	'1691524833953-4c36a685ae7f6b682273f746f10a21501f817f22.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-09 01:30:34.043'),
(146,	'1691524833958-88a1814f203bdbd4f98e4c417c2931d326dd4ec5.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-09 01:30:34.043'),
(147,	'1691524833968-49aa0b86e2bbb615eef1150795fe569dff6ac1b4.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-09 01:30:34.043'),
(148,	'1691524833969-576c4c65ff8d1e79eec58f223f0cffe39e5ddd60.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-09 01:30:34.043'),
(149,	'1691524833970-e3ae37113f17c2c9944f90c6cb582c3b62e9fc85.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-09 01:30:34.043'),
(150,	'1691524833971-d7ec22b5f09e643f4eb2ac251ec28e7cb93a5b6a.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-09 01:30:34.043'),
(151,	'1691524833972-9f1585d88952d7d07e0da83199c871dfc22d395a.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-09 01:30:34.043'),
(152,	'1691524833973-9708d3b5454f24e1da5c8be270c84e8c118187af.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-09 01:30:34.043'),
(153,	'1691524833974-2c5aa9ae756b5326298ea6eb5513e610275ba676.webp',	'almondspackof4.webp',	'2023-08-09 01:30:34.043'),
(154,	'1691524833975-0cb0021f3eea42661da639846b6e6634e811add3.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-09 01:30:34.043'),
(155,	'1691524833976-a03155dec611ccefd115440224480f09dfd7f389.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-09 01:30:34.043'),
(156,	'1691524833977-dbeb38b5d1609e3f7448ce08159b686e73dc85b5.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-09 01:30:34.043'),
(157,	'1691551010137-96a6a081dd87ccc3608170a49b547834cb6fd046.webp',	'1v2_8fa71dc0-6ea4-4663-8967-c6049ad5da62.webp',	'2023-08-09 08:46:50.361'),
(158,	'1691551010144-5f5f889b0b69135018c24a179a7b87f25d4fb153.webp',	'1v2_bf9e06f6-cd22-4209-a932-310a869534c0.webp',	'2023-08-09 08:46:50.361'),
(159,	'1691551010153-9c85547263f7f77c8313eb352ab6c7f6810cdbdc.webp',	'3_ff429d5d-d39f-4917-8288-6c2ed49a4b24.webp',	'2023-08-09 08:46:50.361'),
(160,	'1691551010155-f59875b6431d0c49959ed55e8ce3d7f9459964c6.webp',	'4v2_8e1bdd96-edf1-4662-9059-9ff3bb5575da.webp',	'2023-08-09 08:46:50.361'),
(161,	'1691551010156-352c89c02f1947bb56c9a0e5e0a643df21a6dd65.webp',	'5_145bf845-995e-4039-b52a-3cd15e6ec359.webp',	'2023-08-09 08:46:50.361'),
(162,	'1691551010158-5633fd2b0071c8695c83b6f32ceb1868b36b02d7.webp',	'6_46cf0eb5-4ca8-42b6-854d-951ae338df56.webp',	'2023-08-09 08:46:50.361'),
(163,	'1691551010159-f70071e94430fc02caf59f3e37566736c3f9f71d.webp',	'7_a82ecf2c-2e9f-4983-840e-2821633c1007.webp',	'2023-08-09 08:46:50.361'),
(164,	'1691551010161-f2aa571200fef78479fe1bb4767f9461c73ac698.webp',	'610wodrIz_L._SL1000_39113a24-b7e9-4a06-bd17-88cd4bc8e520.webp',	'2023-08-09 08:46:50.361'),
(165,	'1691551010162-ba99908b5a22449adcb7977c0d212a9b9b19b072.webp',	'almondspackof4.webp',	'2023-08-09 08:46:50.362'),
(166,	'1691551010164-91820539622663b719c63d9f0471137c54ca1c3b.webp',	'back_fba9f5e6-686e-4e5b-aad9-31fffe66be68.webp',	'2023-08-09 08:46:50.362'),
(167,	'1691551010166-97074bff8148f2fd014463ea49971fb612b68b9a.webp',	'packof2_3bd63f6e-ef0b-49d0-932f-37e8441b0d21.webp',	'2023-08-09 08:46:50.362'),
(168,	'1691551010168-ead12ad8a6b363863aa29524cbc26a4c0abf6f06.webp',	'packof2_cd522605-0e54-483a-b6bf-99c5cc6618d9.webp',	'2023-08-09 08:46:50.362'),
(169,	'1691737330013-6ad842ed808da78560462d495433aebf5eb80167.webp',	'3_3a52ee1d-439d-4e04-9378-026c5e79ed90.webp',	'2023-08-11 12:32:10.124'),
(170,	'1691737330014-56e45d9ba5bc0ffc4002b3907c84ae6709a58d78.webp',	'4v2_70e933b4-dbeb-46de-8559-cec23cedf793.webp',	'2023-08-11 12:32:10.124'),
(171,	'1691737330014-e31af6b169df792ad8d90fd7ea47f82d840d57a3.webp',	'5_3b1b5603-06e1-4785-9447-b7214fe40659.webp',	'2023-08-11 12:32:10.124'),
(172,	'1691737330014-1452c06c1e51076b96298ffc942d698e35136b44.webp',	'6_0e1d4e0a-d077-4db6-88a1-acf7855c3a82.webp',	'2023-08-11 12:32:10.124'),
(173,	'1691737330014-6760b2a2e907634da551537ae22c7952bd72e8d0.webp',	'7_c79d2493-6c0d-4cb4-8795-9fc5cf484c38.webp',	'2023-08-11 12:32:10.124'),
(174,	'1691737330014-6e48f56e732106026d164308fd2b804bb67ba3de.webp',	'41fkpfNaIQL.webp',	'2023-08-11 12:32:10.124'),
(175,	'1691737330015-ac4e1663eeebf980916081a80b529c4285992f15.webp',	'back_76457f39-ddcb-43d3-8b05-46f385886f54.webp',	'2023-08-11 12:32:10.124'),
(176,	'1691737330015-c88f3e81bf4242a5c322cfabe88f9a9d97c3b8d2.webp',	'cashewspackof5 (1).webp',	'2023-08-11 12:32:10.124'),
(177,	'1691737330015-33b3fd94516aa49f8dca3cd083274b1fdcd3c227.webp',	'cashewspackof5.webp',	'2023-08-11 12:32:10.124'),
(178,	'1691737330015-91bab6245f5d3fbd62de1b06fbec80973e3098e6.webp',	'cashewspackof5-PhotoRoom.png-PhotoRoom.webp',	'2023-08-11 12:32:10.124'),
(179,	'1691737330016-b1638077f94bc20e7bb711c7420069b0d3445a96.webp',	'Front.webp',	'2023-08-11 12:32:10.124'),
(180,	'1691737330016-1616f663906291f46d8a161ebcc0da9f57d8ccf5.webp',	'Front_6c2e2b11-7e60-465b-8262-1998aaf8e852.webp',	'2023-08-11 12:32:10.124'),
(181,	'1691737330016-e4bc830c08d4313f20328f99dbf17c476af08357.webp',	'packof2_0bc5fcbe-5e98-4e27-9df0-2c553b572ea7.webp',	'2023-08-11 12:32:10.124'),
(182,	'1691737330016-0c42eda08ca582eb66b187b94e6d333a9cddb911.webp',	'packof2_2a0ded68-7c8e-493a-9ec3-130a67e53213.webp',	'2023-08-11 12:32:10.124'),
(183,	'1691737333860-3d897d619606590f6daadd9c1fb2bfd87b6bef37.webp',	'3_3a52ee1d-439d-4e04-9378-026c5e79ed90.webp',	'2023-08-11 12:32:13.867'),
(184,	'1691737333860-07ad1e556f17f335260557197027db62be650b90.webp',	'4v2_70e933b4-dbeb-46de-8559-cec23cedf793.webp',	'2023-08-11 12:32:13.867'),
(185,	'1691737333860-9d5e324f19e90a6f7f21e8cc60f0cfdb20626098.webp',	'5_3b1b5603-06e1-4785-9447-b7214fe40659.webp',	'2023-08-11 12:32:13.867'),
(186,	'1691737333860-fb175ba78b73a46773ec7b63ae1372dd0165bba5.webp',	'6_0e1d4e0a-d077-4db6-88a1-acf7855c3a82.webp',	'2023-08-11 12:32:13.867'),
(187,	'1691737333860-b03a32729bb4dd8f5280d473f2b9b58b99f17442.webp',	'41fkpfNaIQL.webp',	'2023-08-11 12:32:13.867'),
(188,	'1691737333860-f1c24091ed8c8f722530977c81f173dfd1204c63.webp',	'7_c79d2493-6c0d-4cb4-8795-9fc5cf484c38.webp',	'2023-08-11 12:32:13.867'),
(189,	'1691737333860-40fb93fbac270eac85f2b6d8318d069e9d43596b.webp',	'back_76457f39-ddcb-43d3-8b05-46f385886f54.webp',	'2023-08-11 12:32:13.867'),
(190,	'1691737333860-81ffcd24370f765090887e2b449dfe2b1f6e0f3d.webp',	'cashewspackof5-PhotoRoom.png-PhotoRoom.webp',	'2023-08-11 12:32:13.867'),
(191,	'1691737333860-4bfc704e76f294369d56a9f24c3d147b8d5f68f6.webp',	'cashewspackof5 (1).webp',	'2023-08-11 12:32:13.867'),
(192,	'1691737333860-01661e106a0f2d5ed634e9ff7a44925f5079f34a.webp',	'cashewspackof5.webp',	'2023-08-11 12:32:13.867'),
(193,	'1691737333860-1f9dd7c72f307e10494a888f3c75aed2f43dc4ae.webp',	'Front.webp',	'2023-08-11 12:32:13.867'),
(194,	'1691737333860-4884f14b31dd374890db89616ca672d4808f5f8e.webp',	'Front_6c2e2b11-7e60-465b-8262-1998aaf8e852.webp',	'2023-08-11 12:32:13.867'),
(195,	'1691737333860-72319087fceac230c14d0665653bf95c03404a9e.webp',	'packof2_0bc5fcbe-5e98-4e27-9df0-2c553b572ea7.webp',	'2023-08-11 12:32:13.867'),
(196,	'1691737333860-820ea6905285fe575b67650a17fbfe4017fff1f1.webp',	'packof2_2a0ded68-7c8e-493a-9ec3-130a67e53213.webp',	'2023-08-11 12:32:13.867');

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
(15,	'Happilo 100% Natural Premium California Almonds',	15);

DROP TABLE IF EXISTS "tbl_product_category";
DROP SEQUENCE IF EXISTS tbl_categories_id_seq;
CREATE SEQUENCE tbl_categories_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1;

CREATE TABLE "public"."tbl_product_category" (
    "id" integer DEFAULT nextval('tbl_categories_id_seq') NOT NULL,
    "name" character varying(255) NOT NULL,
    CONSTRAINT "tbl_categories_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "tbl_product_category" ("id", "name") VALUES
(15,	'Nuts');

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
(33,	15,	'Nutritional Boost',	'Description',	'Enjoy the health benefits of our premium almonds.'),
(34,	15,	'Tasty and Crunchy',	'Description',	'Savor the rich flavor and satisfying crunch of our almonds.'),
(35,	15,	'',	'Ingredients',	'100% natural California almonds.'),
(36,	15,	'',	'Additional Information',	'Store in a cool, dry place.');

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
(6,	15,	1,	10,	'2023-08-01',	'2023-08-01');

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
(121,	15,	157),
(122,	15,	158),
(123,	15,	159),
(124,	15,	160),
(125,	15,	161),
(126,	15,	162),
(127,	15,	163),
(128,	15,	164),
(129,	15,	165),
(130,	15,	166),
(131,	15,	167),
(132,	15,	168);

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
(34,	15,	'200g',	275,	1),
(35,	15,	'400g',	500,	2),
(36,	15,	'1kg',	1200,	5);

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
(1,	'deepak',	'deepakbm@mailinator.com',	'8853636240');

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

-- 2023-08-16 23:44:21.261853+05:30