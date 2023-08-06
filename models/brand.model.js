import { pool } from '../config/database.js';
import { TRANSACTION_STATUS, STATUS } from '../shared/messages/constant.js';
import {
  SQL_INSERT_IMAGE,
  SQL_UPDATE_BRAND_LOGO,
  SQL_INSERT_BRAND_LOGO,
  SQL_SELECT_BRAND_LOGO,
  SQL_SELECT_BANNER,
  SQL_INSERT_BANNER,
} from '../sql/brand.sql.js';

// Add a brand logo along with associated operations
export const addBrandLogo = async (brandLogoDetails, status = 1) => {
  const client = await pool.connect();

  try {
    await client.query(TRANSACTION_STATUS.BEGIN);

    // Insert the image into tbl_image
    const {
      rows: [imageId],
    } = await client.query(SQL_INSERT_IMAGE, [
      brandLogoDetails.originalFilename,
      brandLogoDetails.newFileName,
      new Date(),
    ]);

    // Update existing brand logos to failure status
    await client.query(SQL_UPDATE_BRAND_LOGO, [
      STATUS.FAILURE,
      status,
      imageId.id,
    ]);

    // Insert new brand logo with image reference
    const {
      rows: [data],
    } = await client.query(SQL_INSERT_BRAND_LOGO, [
      imageId.id,
      status,
      new Date(),
    ]);

    await client.query(TRANSACTION_STATUS.COMMIT);

    return data;
  } catch (err) {
    await client.query(TRANSACTION_STATUS.ROLLBACK);
    throw err;
  } finally {
    client.release();
  }
};

// Add a banner along with associated image
export const addBanner = async (bannerDetails, status = 1) => {
  const client = await pool.connect();

  try {
    await client.query(TRANSACTION_STATUS.BEGIN);

    // Insert the image into tbl_image
    const {
      rows: [imageId],
    } = await client.query(SQL_INSERT_IMAGE, [
      bannerDetails.originalFilename,
      bannerDetails.newFileName,
      new Date(),
    ]);

    // Insert banner with associated image
    const {
      rows: [data],
    } = await client.query(SQL_INSERT_BANNER, [imageId.id, status, new Date()]);

    await client.query(TRANSACTION_STATUS.COMMIT);
    return data;
  } catch (err) {
    await client.query(TRANSACTION_STATUS.ROLLBACK);
    throw err;
  } finally {
    client.release();
  }
};

// Get the latest brand logo
export const getBrandLogo = async (status = 1) => {
  try {
    const { rows, rowCount } = await pool.query(SQL_SELECT_BRAND_LOGO, [
      status,
    ]);
    return { rows, rowCount };
  } catch (err) {
    throw err;
  }
};

// Get banners with a specific status
export const getBanner = async (status = 1) => {
  try {
    const { rows, rowCount } = await pool.query(SQL_SELECT_BANNER, [status]);
    return { rows, rowCount };
  } catch (err) {
    throw err;
  }
};
