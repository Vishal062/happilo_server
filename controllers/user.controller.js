import pkg from 'jsonwebtoken';
const { sign } = pkg;
import CryptoJS from 'crypto-js';
import bcrypt from 'bcrypt'
// import { hashSync, genSaltSync, compareSync,hash } from 'bcrypt';
import { isEmptyArray } from '../shared/index.js';
import {
  createUser,
  deleteUserById,
  findUserByEmail,
  findUserById,
  listAllUser,
  updateUserById,
} from '../models/user.model.js';
import { decryptPasswordToString, getRandomString } from '../shared/helper/helper.js';

export default {
  login: async (req, res) => {
    try {
      const { username: email, password } = req.body;
      console.log({CNT:req.body})
      const { data } = await findUserByEmail(email);
      const results = data.rows;
      if (!results) {
        return res.status(400).json({
          success: 0,
          message: 'Invalid email or password',
        });
      }

      if (results.length > 0) {
        const result = compareSync(password, results[0].password);
        if (result) {
          results.password = undefined;
          const jsontoken = sign(
            {
              name: results[0].first_name + ' ' + results[0].last_name,
              id: results[0].id,
            },
            process.env.SECRET_KEY,
            {
              expiresIn: '1h',
            }
          );
          return res.json({
            success: 1,
            message: 'login successfully',
            token: jsontoken,
          });
        } else {
          return res.status(400).json({
            success: 0,
            message: 'Invalid credentials',
          });
        }
      } else {
        return res.status(400).json({
          success: 0,
          message: 'Invalid email or password',
        });
      }
    } catch (err) {
      return res.json({
        status: false,
        message: err.message,
      });
    }
  },
  encryption: async (req, res) => {
    try {
      const { email, password } = req.body;

      const decryptedEmail = decryptData(email, 'secret_key');
      const decryptedPassword = decryptData(password, 'secret_key');

      const decryptedToEncryptEmail = encryptData(decryptedEmail, 'secret_key');
      const decryptedToEncryptPassword = encryptData(
        decryptedPassword,
        'secret_key'
      );
      res.send({
        encryptedEmail: email,
        encryptedPassword: password,
        decryptedEmail,
        decryptedPassword,
        decryptedToEncryptEmail,
        decryptedToEncryptPassword,
      });
    } catch (err) {
      return res.json({
        status: false,
        message: err.message,
      });
    }
  },

  createUser: async (req, res) => {
    try {
      const {
        firstName,
        lastName,
        phoneNo,
        email,
        password,
      } = req.body;

      //Encrypt Password decrypt here
      const decryptPassword = decryptPasswordToString(password)

      //Decrypt password hashed her
      const passwordHash = await bcrypt.hash(decryptPassword ? decryptPassword : password, 10);

      await createUser({
        firstName,
        lastName,
        phoneNo,
        email,
        password: passwordHash,
      });
      res.status(201).send({ data: { status: 1, message: 'User Created Successfully' } });
    } catch (err) {
      console.error(err);
      res.status(500).send({
        status: 0,
        message: 'Unable To Create User',
        error: err.message,
      });
    }
  },
  listAllUser: async (req, res) => {
    console.log('reaching here');
    try {
      const { data } = await listAllUser();
      const count = data.rowCount;
      const user = data.rows;
      res.status(200).send({ status: 1, user, count });
    } catch (err) {
      console.log({ err });
      res.status(400).send({ status: 0, message: 'Unable To Get Users', err });
    }
  },

  findUserById: async (req, res) => {
    try {
      const user_id = parseInt(req.params.id);
      const { data } = await findUserById(user_id);
      const count = data.rowCount;
      const user = data.rows;
      res.status(200).send({ status: 1, user, count });
    } catch (err) {
      console.log({ err });
      res.status(400).send({ status: 0, message: 'Unable To Get User', err });
    }
  },

  updateUserById: async (req, res) => {
    try {
      const user_id = parseInt(req.params.id);
      const { first_name, last_name } = req.body;
      const userDetails = { first_name, last_name, user_id };
      const { data } = await updateUserById(userDetails);
      const { rows, rowCount } = data;
      if (rows && rowCount) {
        return res
          .status(200)
          .send({ status: 1, message: 'User Updated Successfully!', user_id });
      } else {
        return res
          .status(400)
          .send({ status: 3, message: 'User does not exists!' });
      }
    } catch (err) {
      console.log(err);
      res
        .status(400)
        .send({ status: 0, message: 'Unable To Update User', err });
    }
  },

  deleteUserById: async (req, res) => {
    try {
      const user_id = parseInt(req.params.id);
      const { data } = await deleteUserById(user_id);
      if (!isEmptyArray(data.rows)) {
        return res
          .status(200)
          .send({ status: 1, message: 'User deleted successfully!', user_id });
      } else {
        return res
          .status(400)
          .send({ status: 1, message: 'User does not exists' });
      }
    } catch (err) {
      res
        .status(400)
        .send({ status: 0, message: 'Unable To Delete User', err });
    }
  },
};
