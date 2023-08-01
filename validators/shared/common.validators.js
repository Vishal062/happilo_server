import Joi from 'joi';
export const VALIDATE = {
  firstName: Joi.string()
    .required()
    .min(1)
    .regex(
      /^[A-Za-z]*$/,
      'Only Alphabets are allowed, Please avoid adding white space, number or special characters'
    )
    .max(30),
  middleName: Joi.string()
    .required()
    .min(1)
    .regex(
      /^[A-Za-z]*$/,
      'Only Alphabets are allowed, Please avoid adding white space, number or special characters'
    )
    .max(30),
  lastName: Joi.string()
    .required()
    .min(1)
    .regex(
      /^[A-Za-z]*$/,
      'Only Alphabets are allowed, Please avoid adding white space, number or special characters'
    )
    .max(30),
  email: Joi.string().required().email().max(80),
  password: Joi.string().required().min(5).max(10),
  confirmPassword: Joi.string().required().min(5).max(10),

  phoneNumber: Joi.string()
    .optional()
    .min(10)
    .regex(/^[0-9]*$/, 'alphanumeric and space not allowed')
    .max(10),
};
