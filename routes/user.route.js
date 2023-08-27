import Router from 'express-promise-router';
import { validateBody, validateDbBody, schemas, validatePassword } from '../validators/index.js';
import userController from '../controllers/user.controller.js';
const router = Router();

router.post(
  '/signup',
  validateBody(schemas.signup),
  validateDbBody.signup,
  validatePassword.signup,
  userController.createUser
);

router.post(
  '/login',
  validateBody(schemas.login),
  validateDbBody.login,
  validatePassword.login, 
  userController.login
);

router.post('/encryption', userController.encryption);

router.get('/list', userController.listAllUser);
router.param('id', userController.findUserById);

router.put('/:id', userController.updateUserById);

router.delete('/:id', userController.deleteUserById);
export default router;
