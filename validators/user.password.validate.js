import bcrypt from 'bcrypt';
import { isEmptyObject } from '../shared/index.js';
import { decryptPasswordToString, isValidPassword, passwordContainsPattern } from '../shared/helper/helper.js';
import { findUserExistPassword } from '../models/user.model.js';


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

export const login = async (req, res, next) => {
  
  const { email,password } = req.value.body;
  console.log({RR:req.value.body})

  let err = {};
  const existUserHasedPassword = await findUserExistPassword(email);

  if(passwordContainsPattern(password)){
    const decryptPassword = decryptPasswordToString(password);
    const isMatch = await isValidPassword(decryptPassword, existUserHasedPassword.data);
    
    if(!isMatch){
      err.password = 'Password did not match';
    }
  } 
  else {
    const ifPostman = await isValidPassword(password, existUserHasedPassword.data);
    if(!ifPostman){
      err.password = 'Password did not match';
    }
  }

  if (isEmptyObject(err)) {
    next();
  } else {
    let return_err = { status: 2, errors: err };
    return res.status(400).json(return_err);
  }
};