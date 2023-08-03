import {
  addBanner,
  addBrandLogo,
  getBanner,
  getBrandLogo,
} from '../models/brand.model.js';

export default {
  addBrandLogo: async (req, res) => {
    try {
      const { originalFilename, newFileName } = req.files[0];
      const data = await addBrandLogo({ originalFilename, newFileName });

      res.status(200).send({ status: 1, message: 'Added Successfully.' });
    } catch (err) {
      console.log({ err });
      res.status(400).send({ status: 0, message: 'Something Went Wrong.' });
    }
  },
  addBanner: async (req, res) => {
    try {
      const insertions = await Promise.all(
        req.files.map(async (file) => {
          const { originalFilename, newFileName } = file;
          return addBanner({ originalFilename, newFileName });
        })
      );

      res.status(200).send({ status: 1, message: 'Added Successfully.' });
    } catch (err) {
      res.status(400).send({ status: 0, message: 'Something Went Wrong.' });
    }
  },
  getBrandLogo: async (req, res) => {
    try {
      const data = await getBrandLogo();
      console.log({ data });
      res.status(200).send({ status: 1, data });
    } catch (err) {
      res.status(400).send({ status: 0, message: 'Something Went Wrong' });
    }
  },
  getBanner: async (req, res) => {
    try {
      const data = await getBanner();

      res.status(200).send({ status: 1, data });
    } catch (err) {
      res.status(400).send({ status: 0, message: 'Something Went Wrong' });
    }
  },
};
