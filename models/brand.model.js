// brand.model.js
import { pool } from '../config/database.js';
import { STATUS, TRANSACTION_STATUS } from '../shared/messages/constant.js';

export const addBrandLogo = async (brandLogoDetails, status = 1) => {
  const client = await pool.connect();

  try {
    await client.query(TRANSACTION_STATUS.BEGIN);

    // Set existing brand logos to failure status before inserting a new one
    await client.query(
      'UPDATE tbl_brand_logo SET status = $1 WHERE status = $2',
      [STATUS.FAILURE, status]
    );

    const queryText = `
      INSERT INTO tbl_brand_logo (original_name, name, status, date_added)
      VALUES ($1, $2, $3, $4)
      RETURNING *`;

    const values = [
      brandLogoDetails.originalFilename,
      brandLogoDetails.newFileName,
      status,
      new Date(),
    ];

    const {
      rows: [data],
    } = await client.query(queryText, values);

    await client.query(TRANSACTION_STATUS.COMMIT);

    return data;
  } catch (err) {
    await client.query(TRANSACTION_STATUS.ROLLBACK);
    throw { status: STATUS.FAILURE, err };
  } finally {
    client.release();
  }
};

export const addBanner = async (bannerDetails, status = 1) => {
  try {
    const queryText = `
      INSERT INTO tbl_banner (original_name, name, status, date_added)
      VALUES ($1, $2, $3, $4)
      RETURNING *`;

    const values = [
      bannerDetails.originalFilename,
      bannerDetails.newFileName,
      status,
      new Date(),
    ];

    const {
      rows: [data],
    } = await pool.query(queryText, values);

    return data;
  } catch (err) {
    throw { status: STATUS.FAILURE, err };
  }
};

export const getBrandLogo = async (status = 1) => {
  try {
    const queryText = `
      SELECT original_name, name
      FROM tbl_brand_logo
      WHERE status = $1
      LIMIT 1`;

    const { rows, rowCount } = await pool.query(queryText, [status]);
    return { rows, rowCount };
  } catch (err) {
    throw { status: STATUS.FAILURE, err };
  }
};

export const getBanner = async (status = 1) => {
  try {
    const queryText = `
      SELECT original_name, name
      FROM tbl_banner
      WHERE status = $1`;

    const { rows, rowCount } = await pool.query(queryText, [status]);

    return { rows, rowCount };
  } catch (err) {
    throw { status: STATUS.FAILURE, err };
  }
};
