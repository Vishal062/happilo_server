import {
  addBanner,
  addBrandLogo,
  getBanner,
  getBrandLogo,
} from '../models/brand.model.js';
import errorHandlerMiddleware from '../shared/helper/common.js';
import { MESSAGE, STATUS } from '../shared/messages/constant.js';

export default {
  addBrandLogo: async (req, res, next) => {
    try {
      const { originalFilename, newFileName } = req.files[0];
      await addBrandLogo({ originalFilename, newFileName });

      // Respond with 201 Created for successful brand logo addition
      res.status(STATUS.CREATED).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.ADDED_SUCCESS,
      });
    } catch (err) {
      errorHandlerMiddleware(err, req, res, next);
    }
  },

  addBanner: async (req, res, next) => {
    try {
      await Promise.all(
        req.files.map(async ({ originalFilename, newFileName }) => {
          return addBanner({ originalFilename, newFileName });
        })
      );
      res.status(STATUS.CREATED).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.ADDED_SUCCESS,
      });
    } catch (err) {
      errorHandlerMiddleware(err, req, res, next);
    }
  },

  getBrandLogo: async (req, res, next) => {
    try {
      const { rows, rowCount } = await getBrandLogo();
      res.status(STATUS.OK).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.FETCH_SUCCESS,
        data: rows[0],
        count: rowCount,
      });
    } catch (err) {
      errorHandlerMiddleware(err, req, res, next);
    }
  },

  getBanner: async (req, res, next) => {
    try {
      const { rows, rowCount } = await getBanner();
      res.status(STATUS.OK).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.FETCH_SUCCESS,
        data: rows,
        count: rowCount,
      });
    } catch (err) {
      errorHandlerMiddleware(err, req, res, next);
    }
  },
};
