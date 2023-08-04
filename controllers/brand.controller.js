// brand.controller.js
import {
  addBanner,
  addBrandLogo,
  getBanner,
  getBrandLogo,
} from '../models/brand.model.js';
import { MESSAGE, STATUS } from '../shared/messages/constant.js';

export default {
  addBrandLogo: async (req, res) => {
    try {
      const { originalFilename, newFileName } = req.files[0]; // Since only one logo can be uploaded at once
      await addBrandLogo({ originalFilename, newFileName });

      // Respond with 201 Created for successful brand logo addition
      res.status(STATUS.CREATED).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.ADDED_SUCCESS,
      });
    } catch (err) {
      // Respond with 400 Bad Request for any errors during brand logo addition
      console.error('Failed to add brand logo:', err);
      res.status(STATUS.BAD_REQUEST).send({
        status: STATUS.FAILURE,
        message: MESSAGE.ADDED_FAILURE,
      });
    }
  },

  addBanner: async (req, res) => {
    try {
      // Use destructuring to get the relevant properties from each file object
      await Promise.all(
        req.files.map(async ({ originalFilename, newFileName }) => {
          return addBanner({ originalFilename, newFileName });
        })
      );

      // Respond with 201 Created for successful banner additions
      res.status(STATUS.CREATED).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.ADDED_SUCCESS,
      });
    } catch (err) {
      // Respond with 400 Bad Request for any errors during banner additions
      console.error('Failed to add banners:', err);
      res.status(STATUS.BAD_REQUEST).send({
        status: STATUS.FAILURE,
        message: MESSAGE.ADDED_FAILURE,
      });
    }
  },

  getBrandLogo: async (req, res) => {
    try {
      const { rows, rowCount } = await getBrandLogo();
      res.status(STATUS.OK).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.FETCH_SUCCESS,
        data: rows[0],
        count: rowCount,
      });
    } catch (err) {
      // Respond with 500 Internal Server Error for any unexpected errors
      console.error('Failed to fetch brand logo:', err);
      res.status(STATUS.INTERNAL_SERVER_ERROR).send({
        status: STATUS.FAILURE,
        message: MESSAGE.FETCH_FAILURE,
      });
    }
  },

  getBanner: async (req, res) => {
    try {
      const { rows, rowCount } = await getBanner();
      res.status(STATUS.OK).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.FETCH_SUCCESS,
        data: rows,
        count: rowCount,
      });
    } catch (err) {
      // Respond with 500 Internal Server Error for any unexpected errors
      console.error('Failed to fetch banners:', err);
      res.status(STATUS.INTERNAL_SERVER_ERROR).send({
        status: STATUS.FAILURE,
        message: MESSAGE.FETCH_FAILURE,
      });
    }
  },
};
