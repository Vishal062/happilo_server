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
  lastName: Joi.string()
    .required()
    .min(1)
    .regex(
      /^[A-Za-z]*$/,
      'Only Alphabets are allowed, Please avoid adding white space, number or special characters'
    )
    .max(30),
  phoneNo: Joi.string()
      .required()
      .pattern(/^[0-9]+$/, 'numbers')
    .length(10)
    .messages({
      'string.empty': 'Phone number is required',
      'string.pattern.base': 'Phone number must only contain numbers',
      'string.length': 'Phone number must be exactly 10 digits'
    }),
  email: Joi.string().required().email().max(80),
  password: Joi.string().required().min(5).max(150),
  confirmPassword: Joi.string().required().min(5).max(150),

  phoneNumber: Joi.string()
    .optional()
    .min(10)
    .regex(/^[0-9]*$/, 'alphanumeric and space not allowed')
    .max(10),
};
