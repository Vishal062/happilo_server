import pg from 'pg';
import dotenv from 'dotenv';

const { Pool } = pg;

const envFileName = process.env.NODE_ENV === 'production' ? '.env.prod' : '.env.local';
dotenv.config({ path: envFileName });

export const pool = new Pool({
  connectionString: process.env.DATABASE_URL,
});

pool.on('connect', () => {
  console.log('Connected to the database');
});

export const call = async (funcName, ...args) => {
  const client = await pool.connect();

  try {
    const placeholders = args.map((_, index) => `$${index + 1}`).join(', ');
    const queryText = `SELECT ${funcName}(${placeholders})`;
    const result = await client.query(queryText, args);
    return result.rows;
  } catch (error) {
    throw error;
  } finally {
    client.release();
  }
};

export default pool;
