import pg from 'pg';
const { Pool } = pg;
import dotenv from 'dotenv';

const envFileName = process.env.NODE_ENV === 'production' ? '.env.prod' : '.env.local';
dotenv.config({ path: envFileName });

export const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

pool.on('connect', () => {});

const query = (text, params) => pool.query(text, params);
export default query;
