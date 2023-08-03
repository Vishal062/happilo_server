import query from '../config/database.js';

export const addBrandLogo = async (brandLogoDetails, status = 1) => {
  return new Promise(async (resolve, reject) => {
    try {
      const data = await query(
        'INSERT INTO tbl_brand_logo (original_name,name,status,date_added ) VALUES ($1, $2,$3,$4)',
        [
          brandLogoDetails.originalFilename,
          brandLogoDetails.newFileName,
          status,
          new Date(),
        ]
      );
      resolve(data);
    } catch (err) {
      console.log({ err });
      reject({ status: 0, err });
    }
  });
};
export const addBanner = async (bannerDetails, status = 1) => {
  return new Promise(async (resolve, reject) => {
    try {
      const data = await query(
        'INSERT INTO tbl_banner (original_name,name,status,date_added ) VALUES ($1, $2,$3,$4)',
        [
          bannerDetails.originalFilename,
          bannerDetails.newFileName,
          status,
          new Date(),
        ]
      );
      resolve(data);
    } catch (err) {
      console.log({ err });
      reject({ status: 0, err });
    }
  });
};
export const getBrandLogo = async (status = 1) => {
  return new Promise(async (resolve, reject) => {
    try {
      const { rows, rowCount } = await query(
        'SELECT original_name,name FROM tbl_brand_logo WHERE status = $1',
        [status]
      );
      resolve(rows[0]);
    } catch (err) {
      console.log({ err });
      reject({ status: 0, err });
    }
  });
};
export const getBanner = async (status = 1) => {
  return new Promise(async (resolve, reject) => {
    try {
      const { rows, rowCount } = await query(
        'SELECT original_name,name FROM tbl_banner WHERE status = $1',
        [status]
      );
      resolve({ rows, rowCount });
    } catch (err) {
      console.log({ err });
      reject({ status: 0, err });
    }
  });
};
