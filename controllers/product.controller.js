import { productModel } from '../models/index.js';
import errorHandlerMiddleware from '../shared/helper/common.js';
import { isEmptyArray } from '../shared/index.js';
import { MESSAGE, STATUS } from '../shared/messages/constant.js';

export default {
  uploadProductImage: async (req, res) => {
    const {files} = req
    try {
      const imageIds = await productModel.uploadProductImage({files});
      res
        .status(200)
        .send({ status: 1, imageIds:imageIds, message: 'Image Uploaded Successfully' });
    } catch (err) {
      console.log(err)
      res
        .status(400)
        .send({ status: 0, message: 'Unable To Create Product', err });
    }
  },
  createProduct: async (req, res) => {
    const {name,category,varients,productInfo,discounts,imageIds}= req.body
    try {
      await productModel.createProduct({name,category,varients,productInfo,discounts,imageIds});
      res
        .status(200)
        .send({ status: 1, message: 'Product Created Successfully' });
    } catch (err) {
      console.log(err)
      res
        .status(400)
        .send({ status: 0, message: 'Unable To Create Product', err });
    }
  },

  listAllProducts:async (req, res,next) => {
    try {
      const products = await productModel.listAllProducts();
      res.status(STATUS.OK).send({
        status: STATUS.SUCCESS,
        message: MESSAGE.FETCH_SUCCESS,
        data: products,
        count: products.length,
      });
    } catch (err) {
      errorHandlerMiddleware(err, req, res, next);
    }
  },

  findProductById: async (req, res) => {
        try {
          const product_id = parseInt(req.params.id);
          const products = await productModel.findProductById(product_id);
          res.status(STATUS.OK).send({
            status: STATUS.SUCCESS,
            message: MESSAGE.FETCH_SUCCESS,
            data: products,
            count: products.length,
          });
        } catch (err) {
          errorHandlerMiddleware(err, req, res, next);
        }
      },

  updateProductById: async (req, res) => {
    try {
      const product_id = productModel.parseInt(req.params.id);
      const { product_name, quantity, price } = req.body;
      const productDetails = {
        product_name,
        quantity,
        price,
        product_id,
      };
      const { data } = await productModel.updateProductById(productDetails);
      const { rows, rowCount } = data;
      if (rows && rowCount) {
        return res.status(200).send({
          status: 1,
          message: 'Product Updated Successfully!',
        });
      } else {
        return res.status(400).send({
          status: 3,
          message: 'Product Id does not exist!',
        });
      }
    } catch (err) {
      res
        .status(400)
        .send({ status: 0, message: 'Unable To Update Product', err });
    }
  },

  deleteProductById: async (req, res) => {
    try {
      const product_id = parseInt(req.params.id);
      const { data } = await productModel.deleteProductById(product_id);
      if (!isEmptyArray(data.rows)) {
        return res.status(200).send({
          status: 1,
          message: 'Product deleted successfully!',
          product_id,
        });
      } else {
        return res.status(400).send({
          status: 3,
          message: 'Product does not exists!',
        });
      }
    } catch (err) {
      res
        .status(400)
        .send({ status: 0, message: 'Unable To Delete Product', err });
    }
  },
};
