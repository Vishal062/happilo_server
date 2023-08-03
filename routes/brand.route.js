import Router from 'express-promise-router';

import { brandController } from '../controllers/index.js';
import uploadFiles from '../utils/fileUploader.js';

const router = Router();

router.get('/', brandController.getBrandLogo);

router.get('/banner', brandController.getBanner);

router.post('/', uploadFiles, brandController.addBrandLogo);

router.post('/banner', uploadFiles, brandController.addBanner);

export default router;
