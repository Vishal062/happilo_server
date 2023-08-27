import CryptoJS from 'crypto-js';
import bcrypt from 'bcrypt';
import config from '../../config/config.js';

// ? Get a random string and make salt for encryption
export const getRandomString = (length) => {
  let randomChars =
    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  const charsLength = randomChars.length;

  const randomBytes = CryptoJS.lib.WordArray.random(charsLength);
  let result = new Array(32);

  for (let i = 0; i < length; i++) {
    const byteValue = randomBytes.words[i % 16] & 0xff;
    result[i] = randomChars[byteValue % charsLength];
  }

  return result.join('');
};

// ? Decrypt the encrypt password.
const secretKey = config.cryptR.secret;
export const decryptPasswordToString = (data, key = '') => CryptoJS.AES.decrypt(data, secretKey).toString(CryptoJS.enc.Utf8);

// To check Password Pattern
export const passwordContainsPattern = (password) => {
  const pattern = "#==";
  return password.includes(pattern);
};

export const isValidPassword = async function (newPassword, existingPassword) {
  try {
    return await bcrypt.compare(newPassword, existingPassword);
  } catch (error) {
    throw new Error(error);
  }
};