import { pool } from '../config/database.js';
import { TRANSACTION_STATUS } from '../shared/messages/constant.js';
import { brandSQL, productSQL } from '../sql/index.js';
import { getProductsQuery3 } from '../sql/product.sql.js';

export const createProduct = async (productDetails) => {
  try {
    const { name, category, discounts, varients, imageIds, productInfo } = productDetails;

    const client = await pool.connect();

    try {
      await client.query(TRANSACTION_STATUS.COMMIT);

      let categoryId;

      // Insert category into Categories table if it's a new category
      if (category) {
        const { rows } = await client.query(productSQL.categoryInsertQuery, [category]);
        categoryId = rows[0].category_id;
      }

      // Insert product into Products table
      const { rows: productRows } = await client.query(productSQL.productInsertQuery, [categoryId, name]);
      const productId = productRows[0].product_id;

      // Parallelize the insertion of product variants, images, descriptions, and discounts
      await Promise.all([
        Promise.all(varients.map(variant => client.query(productSQL.variantInsertQuery, [productId, variant.quantity, variant.price, variant.pack]))),
        Promise.all(imageIds.map(async (id) => {
         return client.query(productSQL.productImageInsertQuery, [productId, id]);
        })),
        Promise.all(productInfo.map(description => client.query(productSQL.descriptionInsertQuery, [productId, description.name, description.type, description.details]))),
        Promise.all(discounts.map(discount => {
          const { sellerID = 1, percentage, startDate, endDate } = discount;
          return client.query(productSQL.discountInsertQuery, [productId, sellerID, percentage, startDate, endDate]);
        }))
      ]);

      await client.query(TRANSACTION_STATUS.COMMIT);
      return productId
    } catch (error) {
      await client.query(TRANSACTION_STATUS.ROLLBACK);
      throw error;
    } finally {
      client.release();
    }
  } catch (error) {
    throw error;
  }
};

export const uploadProductImage = async ({files}) => {
  try {

    const client = await pool.connect();

    try {
      await client.query(TRANSACTION_STATUS.BEGIN);

      const imageInsertPromises = files.map(async ({ originalname:originalFilename, filename:newFileName }) => {
        const { rows: imageRows } = await client.query(brandSQL.SQL_INSERT_IMAGE, [originalFilename, newFileName, new Date()]);
        return imageRows[0].id;
      });

      const imageIds = await Promise.all(imageInsertPromises);

      await client.query(TRANSACTION_STATUS.COMMIT);

      return imageIds;
    } catch (error) {
      await client.query(TRANSACTION_STATUS.ROLLBACK);
      throw error;
    } finally {
      client.release();
    }
  } catch (error) {
    throw error;
  }
};


export const listAllProducts = async () => {
  const client = await pool.connect();

  try {
  

    const { rows } = await client.query(getProductsQuery3);
    return rows;
  } catch (error) {
    throw error;
  } finally {
    client.release();
  }
};

export const findProductById = async (id) => {
    return new Promise(async (resolve, reject) => {
      try {
        const product = await query('SELECT * FROM tbl_product WHERE id = $1', [
          id,
        ]);
        resolve({ status: 1, data: product });
      } catch (err) {
        reject({ status: 0, err });
      }
    });
  },
  updateProductById = async (productDetails) => {
    return new Promise(async (resolve, reject) => {
      try {
        const { rows, rowCount } = await query(
          'UPDATE tbl_product SET product_name = $1, quantity = $2, price = $3 WHERE product_id = $4',
          [
            productDetails.product_name,
            productDetails.quantity,
            productDetails.price,
            productDetails.product_id,
          ]
        );
        resolve({ status: 1, data: { rows, rowCount } });
      } catch (err) {
        reject({ status: 0, err });
      }
    });
  };
export const deleteProductById = async (product_id) => {
  return new Promise(async (resolve, reject) => {
    try {
      const product = await query(
        'DELETE FROM tbl_product WHERE product_id = $1',
        [product_id]
      );
      resolve({ status: 1, data: product });
    } catch (err) {
      reject({ status: 0, err });
    }
  });
};
