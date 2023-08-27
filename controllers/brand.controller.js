import { brandModel } from '../models/index.js';
import errorHandlerMiddleware from '../shared/helper/common.js';
import { MESSAGE, STATUS } from '../shared/messages/constant.js';

 export const  addBrandLogo =  async (req, res, next) => {
    try {
      console.log({first:req.files})
      const { originalname, filename } = req.files[0];
      await brandModel.addBrandLogo({ originalname, filename });

      // Respond with 201 Created for successful brand logo addition
      res.status(STATUS.CREATED).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.ADDED_SUCCESS,
      });
    } catch (err) {
      errorHandlerMiddleware(err, req, res, next);
    }
  }

  export const addBanner = async (req, res, next) => {
    try {
      await Promise.all(
        req.files.map(async ({  originalname, filename }) => {
          return brandModel.addBanner({  originalname, filename });
        })
      );
      res.status(STATUS.CREATED).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.ADDED_SUCCESS,
      });
    } catch (err) {
      errorHandlerMiddleware(err, req, res, next);
    }
  }

  export const getBrandLogo = async (req, res, next) => {
    try {
      const { rows, rowCount } = await brandModel.getBrandLogo();
      res.status(STATUS.OK).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.FETCH_SUCCESS,
        data: rows[0],
        count: rowCount,
      });
    } catch (err) {
      errorHandlerMiddleware(err, req, res, next);
    }
  }

  export const getBanner = async (req, res, next) => {
    try {
      const { rows, rowCount } = await brandModel.getBanner();
      res.status(STATUS.OK).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.FETCH_SUCCESS,
        data: rows,
        count: rowCount,
      });
    } catch (err) {
      errorHandlerMiddleware(err, req, res, next);
    }
  }
