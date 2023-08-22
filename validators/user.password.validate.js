import { isEmptyObject } from '../shared/index.js';
import { passwordContainsPattern } from '../shared/helper/helper.js';


export const signup = async (req, res, next) => {
  
  const { password, confirmPassword } = req.value.body;

  let err = {};

  if(passwordContainsPattern(password)){
    let passwordSplit = password.split('#==');
    let confirmPasswordSplit = confirmPassword.split('#==');
    if(passwordSplit[1] !== confirmPasswordSplit[1]){
      err.password = 'Password & confirm Password did not match';
    }
  } 
  else if (password !== confirmPassword) {
    err.password = 'Password & confirm Password did not match';
  }

  if (isEmptyObject(err)) {
    next();
  } else {
    let return_err = { status: 2, errors: err };
    return res.status(400).json(return_err);
  }
};