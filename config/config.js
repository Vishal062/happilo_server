const config = {
  NODE_ENV: process.env.NODE_ENV,
  cryptR: {
    secret: process.env.CRYPTO_SECRET_KEY,
  },
  jwt: {
    secretKey: process.env.SECRET_KEY,
    tokenExpiry: process.env.TOKEN_EXPIRY_TIME
  }
};

export default config;