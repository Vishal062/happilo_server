import { findUserByEmail } from '../models/user.model.js';
import { isEmptyObject } from '../shared/index.js';

export const signup = async (req, res, next) => {
  const { email } = req.value.body;

  const user = {
    email: encodeURIComponent(email).toLowerCase(),
  };

  let err = {};
  // const emailExists = await managementModel.pharmacy_email_exists_adm(email);
  //   if (!!email && !isEmptyArray(emailExists)) {
  //     err.pharmacy_email = 'Email already exists.';
  //   }
  const emailExists = await findUserByEmail(user.email);
  console.log({emailExists:emailExists,emailExists1:emailExists.success});
  if (emailExists.success) {
    err.email = 'Email already exists';
  }

  if (isEmptyObject(err)) {
    next();
  } else {
    let return_err = { status: 2, errors: err };
    return res.status(400).json(return_err);
  }
};
