import { fileURLToPath } from 'url';
import formidable from 'formidable';
import fs from 'fs/promises';
import path from 'path';
import pkg from 'uuid';
import { createHash } from 'crypto';
const { v4: uuidv4 } = pkg;

function parseCustomFields(parsedFields) {
  const parsed = {};

  for (const key in parsedFields) {
    if (parsedFields.hasOwnProperty(key)) {
      let value = parsedFields[key][0];

      // Remove surrounding double quotes
      value = value.replace(/^"|"$/g, '');

      // Parse JSON-like strings if necessary
      if (value.startsWith('[') || value.startsWith('{')) {
        value = JSON.parse(value);
      }

      parsed[key] = value;
    }
  }

  return parsed;
}

const fileUploader = (req, res, uploadDir, callback) => {
  const form = formidable();

  // Set the upload directory where the files will be stored
  form.uploadDir = uploadDir;

  // Parse the incoming request and handle multiple files
  form.parse(req, async (err, fields, files) => {

    if (err) {
      return callback(err, null);
    }

    const filePromises = [];

    // Use a regular for...of loop to iterate through the uploaded files
    for (const fieldName in files) {
      const fileArray = files[fieldName];

      for (let i = 0; i < fileArray.length; i++) {
        const file = fileArray[i];
        const { filepath, originalFilename } = file;
        if (!originalFilename) {
          // Skip the file if the originalFilename is not available
          console.error(
            'Uploaded file does not have an original filename:',
            file
          );
          continue;
        }

        try {
          const fileExt = path.extname(originalFilename); // Get the file extension from the original name

          if (!fileExt) {
            // If the original filename doesn't have an extension, extract from the mimetype
            fileExt = path.extname(file.headers['content-type']);
          }

          // Generate a unique file name
          const fileHash = createHash('sha1').update(filepath).digest('hex');
          const uniqueFileName = `${Date.now()}-${fileHash}${fileExt}`;
          const newLocation = path.join(uploadDir, uniqueFileName);
          await fs.rename(filepath, newLocation);

          filePromises.push({
            originalFilename: originalFilename,
            newFileName: uniqueFileName,
          });
        } catch (err) {
          console.error('Error moving file:', err);
        }
      }
    }

    // All file uploads have been processed

    // Call the callback with the results
    return callback(null, filePromises, fields);
  });
};

const uploadFiles = (req, res, next) => {
  // Get the current file's URL and convert it to the directory path
  const currentFileUrl = new URL(import.meta.url);
  const currentFilePath = fileURLToPath(currentFileUrl); // Convert the file URL to a local file path
  const uploadDir = path.join(path.dirname(currentFilePath), '../uploads');

  fileUploader(req, res, uploadDir, (err, filePaths, fields) => {
    if (err) {
      console.error('Error handling file upload:', err);
      res.writeHead(500, { 'Content-Type': 'text/plain' });
      res.end('An error occurred during file upload');
      return;
    }
    // Set the uploaded files in the req object
    req.files = filePaths;
    req.body = parseCustomFields(fields)

    // Call the next middleware (productController.createProduct) in the chain
    next();
  });
};

export default uploadFiles;
