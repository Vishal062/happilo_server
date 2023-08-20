import Router from 'express-promise-router';
import uploadFiles from '../utils/fileUploader.js';
import productController from '../controllers/product.controller.js';

const router = Router();

router.post('/', uploadFiles, productController.createProduct);

router.get('/', productController.listAllProducts);

router.get('/:id', productController.findProductById);

router.put('/:id', productController.updateProductById);

router.delete('/:id', productController.deleteProductById);

export default router;
