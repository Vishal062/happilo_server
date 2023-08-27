import JWT from 'jsonwebtoken';
// const {JWT} = pkg;
import config from '../../config/config.js';

const jwtSecretKey = config.jwt.secretKey;
const tokenExpiry = config.jwt.tokenExpiry;


export const generateTokenOne = (data) => {
  console.log(data);
  let token = JWT.sign(
    data, jwtSecretKey, {expiresIn: tokenExpiry,}
  );

  return token;
};

export const generateTokenTwo = (user_data, days = 1) => {
  return JWT.sign(
    {
      iss: 'Happilo',
      sub: user_data.user_id,
      name: user_data.name,
      ag: user_data.user_agent,
      user_type: user_data.user_type,
      iat: Math.round(new Date().getTime() / 1000),
      exp: Math.round(new Date().getTime() / 1000) + days * 24 * 60 * 60,
    },
    jwtSecretKey
  );
};