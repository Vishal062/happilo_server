import express from 'express';
import cors from 'cors';
import morgan from 'morgan'; // Import the morgan middleware
import { brandRoute, productRoute, userRoute } from './routes/index.js';
import errorHandlerMiddleware from './shared/helper/common.js';

const app = express();

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/api/uploads', express.static('uploads'));
app.use(express.json({ type: 'application/vnd.api+json' }));

// morgan middleware to log incoming requests
app.use(morgan('dev'));
app.use(errorHandlerMiddleware);

app.use('/api/product/', productRoute);
app.use('/api/user/', userRoute);
app.use('/api/brand/', brandRoute);

export default app;
