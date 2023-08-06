export const SQL_INSERT_IMAGE = `
  INSERT INTO tbl_image (original_name, name, date_added)
  VALUES ($1, $2, $3)
  RETURNING id`;

export const SQL_UPDATE_BRAND_LOGO = `
  UPDATE tbl_brand_logo
  SET status = $1
  WHERE status = $2 AND image_id != $3`;

export const SQL_INSERT_BRAND_LOGO = `
  INSERT INTO tbl_brand_logo (image_id, status, date_added)
  VALUES ($1, $2, $3)
  RETURNING *`;

export const SQL_INSERT_BANNER = `
  INSERT INTO tbl_banner (image_id, status, date_added)
  VALUES ($1, $2, $3)
  RETURNING *`;

export const SQL_SELECT_BRAND_LOGO = `
  SELECT original_name, name
  FROM tbl_brand_logo
  LEFT JOIN tbl_image ON tbl_brand_logo.image_id = tbl_image.id
  WHERE status = $1
  LIMIT 1`;

export const SQL_SELECT_BANNER = `
  SELECT original_name, name
  FROM tbl_banner
  LEFT JOIN tbl_image ON tbl_banner.image_id = tbl_image.id
  WHERE status = $1`;
