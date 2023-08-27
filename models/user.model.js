import query from '../config/database.js';

export const findUserByEmail = async (email) => {
  return new Promise(async (resolve, reject) => {
    try {
      const { rows, rowCount } = await query('SELECT * FROM tbl_customer WHERE email = $1', [
        email,
      ]);
      resolve({ status: 1, data: rows, success: rowCount > 0 });
    } catch (err) {
      reject({ status: 0, err });
    }
  });
};

export const findUserExistPassword = async (email) => {
  return new Promise(async (resolve, reject) => {
    try {
      const { rows, rowCount } = await query('SELECT * FROM tbl_customer WHERE email = $1', [
        email,
      ]);
      if (rowCount > 0) {
        const user = rows[0];
        const hashedPassword = user.password;
        resolve({ status: 1, data: hashedPassword, success: true });
      }
    } catch (err) {
      reject({ status: 0, err });
    }
  });
};

export const findUserNameByEmail = async (email) => {
  return new Promise(async (resolve, reject) => {
    try {
      const { rows, rowCount } = await query('SELECT * FROM tbl_customer WHERE email = $1', [
        email,
      ]);
      resolve({ status: 1, data: rows[0], success: rowCount > 0 });
    } catch (err) {
      reject({ status: 0, err });
    }
  });
};

export const createUser = async (userDetails) => {
  return new Promise(async (resolve, reject) => {
    try {
      const { email, firstName, lastName, phoneNo, password } = userDetails;
      await query(
        'INSERT INTO tbl_customer (first_name,last_name,phone,email,password) VALUES ($1, $2, $3, $4,$5)',
        [firstName, lastName, phoneNo, email, password]
      );
      resolve({ status: 1, data: { firstName, lastName } });
    } catch (err) {
      reject({ status: 0, err });
    }
  });
};
export const listAllUser = async () => {
  return new Promise(async (resolve, reject) => {
    try {
      const user = await query(
        'SELECT * FROM tbl_customer ORDER BY first_name ASC'
      );
      resolve({ status: 1, data: user });
    } catch (err) {
      console.log({ err });
      reject({ status: 0, err });
    }
  });
};
export const findUserById = async (user_id) => {
  return new Promise(async (resolve, reject) => {
    try {
      const user = await query(
        'SELECT * FROM tbl_customer WHERE user_id = $1',
        [user_id]
      );
      resolve({ status: 1, data: user });
    } catch (err) {
      reject({ status: 0, err });
    }
  });
};
export const updateUserById = async (userDetails) => {
  return new Promise(async (resolve, reject) => {
    try {
      const { rows, rowCount } = await query(
        'UPDATE tbl_customer SET first_name = $1, last_name = $2 WHERE user_id = $3',
        [userDetails.first_name, userDetails.last_name, userDetails.user_id]
      );
      resolve({ status: 1, data: { rows, rowCount } });
    } catch (err) {
      reject({ status: 0, err });
    }
  });
};
export const deleteUserById = async (user_id) => {
  return new Promise(async (resolve, reject) => {
    try {
      const { rows, rowCount } = await query(
        'DELETE FROM tbl_customer WHERE user_id = $1',
        [user_id]
      );
      resolve({ status: 1, data: { rows, rowCount } });
    } catch (err) {
      reject({ status: 0, err });
    }
  });
};
