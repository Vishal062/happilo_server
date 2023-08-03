import express from 'express';
import cors from 'cors';
import { brandRoute, productRoute, userRoute } from './routes/index.js';

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/api/uploads', express.static('uploads'));
app.use(express.json({ type: 'application/vnd.api+json' }));

app.use('/api/product/', productRoute);
app.use('/api/user/', userRoute);
app.use('/api/brand/', brandRoute);

export default app;
