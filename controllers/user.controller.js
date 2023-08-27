import pkg from 'jsonwebtoken';
const { sign } = pkg;
import CryptoJS from 'crypto-js';
import bcrypt from 'bcrypt';
// import { hashSync, genSaltSync, compareSync,hash } from 'bcrypt';
import { isEmptyArray } from '../shared/index.js';
import {
  createUser,
  deleteUserById,
  findUserById,
  findUserNameByEmail,
  listAllUser,
  updateUserById,
} from '../models/user.model.js';
import { decryptPasswordToString, getRandomString } from '../shared/helper/helper.js';
import { generateTokenOne } from '../shared/helper/generateToken.js';

export default {
  login: async (req, res) => {
    // console.log({Req:req})
    try {
      const { email, password } = req.body;

      const { data } = await findUserNameByEmail(email);
      console.log({ data: data })
      const userData = {
        userId: data.id,
        username: data.first_name + '_' + data.last_name,
        useremail: data.email,
        phone: data.phone,
      }
      console.log({ userData: userData });

      if (!data) {
        return res.status(400).json({
          success: 0,
          message: 'Invalid mail and password Please try again',
        });
      }

      if (data) {
        let token = ''
        token = generateTokenOne(userData);
        return res.status(200).json({ token: token, message: 'Loggeed In successfully', status: 1 })
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
