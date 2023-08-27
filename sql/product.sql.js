// SQL query to insert a new category into the tbl_product_category table
export const categoryInsertQuery = `
  INSERT INTO tbl_product_category (name)
  VALUES ($1)
  RETURNING id as category_id`;

// SQL query to insert a new product into the tbl_product table
export const productInsertQuery = `
  INSERT INTO tbl_product (category_id, name)
  VALUES ($1, $2)
  RETURNING id as product_id`;

// SQL query to insert product variants into the tbl_product_variant table
export const variantInsertQuery = `
  INSERT INTO tbl_product_variant (product_id, variant_name, price, pack)
  VALUES ($1, $2, $3, $4)`;

// SQL query to insert product images into the tbl_product_images table
export const productImageInsertQuery = `
  INSERT INTO tbl_product_images (product_id, image_id)
  VALUES ($1, $2)`;

// SQL query to insert product descriptions into the tbl_product_description table
export const descriptionInsertQuery = `
  INSERT INTO tbl_product_description (product_id, name, type, details)
  VALUES ($1, $2, $3, $4)`;

// SQL query to insert discounts into the tbl_product_discounts table
export const discountInsertQuery = `
  INSERT INTO tbl_product_discounts (product_id, seller_id, discount_percentage, start_date, end_date)
  VALUES ($1, $2, $3, $4, $5)`;

export const SQL_INSERT_IMAGE = `
INSERT INTO tbl_image (original_name, name, date_added)
VALUES ($1, $2, $3)
RETURNING id`;

export const SQL_SEARCH_PRODUCT = `SELECT id AS product_id, name AS product_name FROM tbl_product `;

export  const getProductsQuery1 =`
WITH Variants AS (
  SELECT
    pv.product_id,
    json_agg(
      json_build_object(
        'quantity', pv.variant_name,
        'price', pv.price,
        'pack', pv.pack
      )
    ) AS variants
  FROM tbl_product_variant pv
  GROUP BY pv.product_id
),
Files AS (
  SELECT
    pi.product_id,
    json_agg(
      json_build_object(
        'name', i.name,
        'original_name', i.original_name,
        'date_added', i.date_added
      )
    ) AS files
  FROM tbl_product_images pi
  JOIN tbl_image i ON i.id = pi.image_id
  GROUP BY pi.product_id
),
Discounts AS (
  SELECT
    pd.product_id,
    json_agg(
      json_build_object(
        'percentage', pd.discount_percentage,
        'start_date', pd.start_date,
        'end_date', pd.end_date
      )
    ) AS discounts
  FROM tbl_product_discounts pd
  GROUP BY pd.product_id
),
ProductDescriptions AS (
  SELECT
    pd_desc.product_id,
    json_agg(
      json_build_object(
        'name', pd_desc.name,
        'type', pd_desc.type,
        'details', pd_desc.details
      )
    ) AS descriptions
  FROM tbl_product_description pd_desc
  GROUP BY pd_desc.product_id
)
SELECT
  p.name AS product_name,
  pc.name AS category,
  v.variants,
  f.files,
  d.discounts,
  pd.descriptions
FROM tbl_product AS p
LEFT JOIN tbl_product_category pc ON pc.id = p.category_id
LEFT JOIN Variants v ON v.product_id = p.id
LEFT JOIN Files f ON f.product_id = p.id
LEFT JOIN Discounts d ON d.product_id = p.id
LEFT JOIN ProductDescriptions pd ON pd.product_id = p.id
WHERE p.id = 13;

`
export  const getProductsQuery2 = `
SELECT
p.name AS product_name,
pc.name AS category,
variants.variants,
files.files,
discounts.discounts,
descriptions.descriptions
FROM tbl_product AS p
LEFT JOIN tbl_product_category pc ON pc.id = p.category_id
LEFT JOIN (
SELECT
  pv.product_id,
  json_agg(
    json_build_object(
      'quantity', pv.variant_name,
      'price', pv.price,
      'pack', pv.pack
    )
  ) AS variants
FROM tbl_product_variant pv
GROUP BY pv.product_id
) AS variants ON variants.product_id = p.id
LEFT JOIN (
SELECT
  pi.product_id,
  json_agg(
    json_build_object(
      'name', i.name,
      'original_name', i.original_name,
      'date_added', i.date_added
    )
  ) AS files
FROM tbl_product_images pi
JOIN tbl_image i ON i.id = pi.image_id
GROUP BY pi.product_id
) AS files ON files.product_id = p.id
LEFT JOIN (
SELECT
  pd.product_id,
  json_agg(
    json_build_object(
      'percentage', pd.discount_percentage,
      'start_date', pd.start_date,
      'end_date', pd.end_date
    )
  ) AS discounts
FROM tbl_product_discounts pd
GROUP BY pd.product_id
) AS discounts ON discounts.product_id = p.id
LEFT JOIN (
SELECT
  pd_desc.product_id,
  json_agg(
    json_build_object(
      'name', pd_desc.name,
      'type', pd_desc.type,
      'details', pd_desc.details
    )
  ) AS descriptions
FROM tbl_product_description pd_desc
GROUP BY pd_desc.product_id
) AS descriptions ON descriptions.product_id = p.id
WHERE p.id = 13;
`
export  const getProductsQuery3 = `
SELECT
p.id as product_id,
p.name AS product_name,
pc.name AS category,
variants.variants,
files.files,
discounts.discounts,
descriptions.descriptions
FROM tbl_product AS p
LEFT JOIN tbl_product_category pc ON pc.id = p.category_id
LEFT JOIN (
SELECT
  pv.product_id,
  json_agg(
    json_build_object(
      'quantity', pv.variant_name,
      'price', pv.price,
      'pack', pv.pack
    )
  ) AS variants
FROM tbl_product_variant pv
GROUP BY pv.product_id
) AS variants ON variants.product_id = p.id
LEFT JOIN (
SELECT
  pi.product_id,
  json_agg(
    json_build_object(
      'name', i.name,
      'original_name', i.original_name,
      'date_added', i.date_added
    )
  ) AS files
FROM tbl_product_images pi
JOIN tbl_image i ON i.id = pi.image_id
GROUP BY pi.product_id
) AS files ON files.product_id = p.id
LEFT JOIN (
SELECT
  pd.product_id,
  json_agg(
    json_build_object(
      'percentage', pd.discount_percentage,
      'start_date', pd.start_date,
      'end_date', pd.end_date
    )
  ) AS discounts
FROM tbl_product_discounts pd
GROUP BY pd.product_id
) AS discounts ON discounts.product_id = p.id
LEFT JOIN (
SELECT
  pd_desc.product_id,
  json_agg(
    json_build_object(
      'name', pd_desc.name,
      'type', pd_desc.type,
      'details', pd_desc.details
    )
  ) AS descriptions
FROM tbl_product_description pd_desc
GROUP BY pd_desc.product_id
) AS descriptions ON descriptions.product_id = p.id
`
export  const getProductsByProductId = `
SELECT
  p.id AS product_id,
  p.name AS product_name,
  pc.name AS category,
  variants.variants,
  files.files,
  discounts.discounts,
  jsonb_build_object(
    'ingredients', (
      SELECT json_agg(
        json_build_object(
          'name', pd_desc.name,
          'details', pd_desc.details
        )
      )
      FROM tbl_product_description pd_desc
      WHERE pd_desc.product_id = p.id AND pd_desc.type = 'Ingredients'
    ),
    'description', (
      SELECT json_agg(
        json_build_object(
          'name', pd_desc.name,
          'details', pd_desc.details
        )
      )
      FROM tbl_product_description pd_desc
      WHERE pd_desc.product_id = p.id AND pd_desc.type = 'Description'
    ),
    'additionalInformation', (
      SELECT json_agg(
        json_build_object(
          'name', pd_desc.name,
          'details', pd_desc.details
        )
      )
      FROM tbl_product_description pd_desc
      WHERE pd_desc.product_id = p.id AND pd_desc.type = 'Additional Information'
    )
  ) AS descriptions
FROM tbl_product AS p
LEFT JOIN tbl_product_category pc ON pc.id = p.category_id
LEFT JOIN (
  SELECT
    pv.product_id,
    json_agg(
      json_build_object(
        'quantity', pv.variant_name,
        'price', pv.price,
        'pack', pv.pack
      )
    ) AS variants
  FROM tbl_product_variant pv
  GROUP BY pv.product_id
) AS variants ON variants.product_id = p.id
LEFT JOIN (
  SELECT
    pi.product_id,
    json_agg(
      json_build_object(
        'name', i.name,
        'original_name', i.original_name,
        'date_added', i.date_added
      )
    ) AS files
  FROM tbl_product_images pi
  JOIN tbl_image i ON i.id = pi.image_id
  GROUP BY pi.product_id
) AS files ON files.product_id = p.id
LEFT JOIN (
  SELECT
    pd.product_id,
    json_agg(
      json_build_object(
        'percentage', pd.discount_percentage,
        'start_date', pd.start_date,
        'end_date', pd.end_date
      )
    ) AS discounts
  FROM tbl_product_discounts pd
  GROUP BY pd.product_id
) AS discounts ON discounts.product_id = p.id
WHERE p.id = $1;
`