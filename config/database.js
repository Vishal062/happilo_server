import pg from 'pg';
const { Pool } = pg;
import dotenv from 'dotenv';

dotenv.config();

export const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

pool.on('connect', () => {
  console.log('Connection request made with the database Successfully!');
});

const query = (text, params) => pool.query(text, params);
export default query;
