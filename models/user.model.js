import query from '../config/database.js';

export const findUserByEmail = async (email) => {
  return new Promise(async (resolve, reject) => {
    try {
      const user = await query('SELECT * FROM tbl_customer WHERE email = $1', [
        email,
      ]);
      resolve({ status: 1, data: user });
    } catch (err) {
      reject({ status: 0, err });
    }
  });
};
export const createUser = async (userDetails) => {
  return new Promise(async (resolve, reject) => {
    try {
      const { email, firstName, lastName, middleName, password } = userDetails;
      await query(
        'INSERT INTO tbl_customer (first_name,middle_name,last_name,email) VALUES ($1, $2, $3, $4)',
        [firstName, middleName, lastName, email]
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
