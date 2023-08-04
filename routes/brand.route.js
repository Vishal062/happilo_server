import Router from 'express-promise-router';
import uploadFiles from '../utils/fileUploader.js';
import { brandController } from '../controllers/index.js';

const router = Router();

/**
 * Route: GET /
 * Description: Get the brand logo.
 * Handler: brandController.getBrandLogo
 */
router.get('/', brandController.getBrandLogo);

/**
 * Route: GET /banner
 * Description: Get banners.
 * Handler: brandController.getBanner
 */
router.get('/banner', brandController.getBanner);

/**
 * Route: POST /
 * Description: Add a brand logo.
 * Middleware: uploadFiles (for file uploading)
 * Handler: brandController.addBrandLogo
 */
router.post('/', uploadFiles, brandController.addBrandLogo);

/**
 * Route: POST /banner
 * Description: Add banners.
 * Middleware: uploadFiles (for file uploading)
 * Handler: brandController.addBanner
 */
router.post('/banner', uploadFiles, brandController.addBanner);

export default router;
