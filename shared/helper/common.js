import fs from 'fs';
import path from 'path';
import { StatusCodes } from 'http-status-codes';
import { fileURLToPath } from 'url';
import 'express-async-errors'; // Import the package to handle async errors automatically

export const isArray = (element) => Array.isArray(element);

export const isEmptyArray = (element) =>
  !(isArray(element) && element.length > 0);

export const isEmptyObject = (obj) => Object.entries(obj).length === 0;

const logError = (error) => {
  console.error(error); // Log the error to console

  const currentFileUrl = new URL(import.meta.url);
  const currentFilePath = fileURLToPath(currentFileUrl);
  const logFolderPath = path.join(path.dirname(currentFilePath), '../../log');

  const logFile = path.join(logFolderPath, 'error.log');
  const errorMessage = error instanceof Error ? error.stack : error;
  const logMessage = `[${new Date().toISOString()}] ${errorMessage}\n`;

  // Append error message to the log file
  fs.appendFile(logFile, logMessage, (err) => {
    if (err) {
      console.error('Failed to write error log:', err);
    }
  });
};

const errorHandlerMiddleware = (err, req, res, next) => {
  let customError = {
    statusCode: err.statusCode || StatusCodes.INTERNAL_SERVER_ERROR,
    message: err.message || 'Something went wrong. Please try again later.',
  };

  if (err.name === 'ValidationError') {
    customError.message = Object.values(err.errors)
      .map((item) => item.message)
      .join(',');
    customError.statusCode = StatusCodes.BAD_REQUEST;
  }

  if (err.name === 'TypeError') {
    customError.message = err.message;
    customError.statusCode = StatusCodes.BAD_REQUEST;
  }

  if (err.code && err.code === 11000) {
    customError.message = `Duplicate value entered for ${
      Object.keys(err.keyValue)[0]
    } field, please choose another value`;
    customError.statusCode = StatusCodes.BAD_REQUEST;
  }

  if (err.name === 'CastError') {
    customError.message = `No item found with id: ${err.value}`;
    customError.statusCode = StatusCodes.NOT_FOUND;
  }

  // Log the error using the custom logError function
  logError(err); // Log the error using your custom logError function

  return res
    .status(customError.statusCode)
    .json({ status: customError.statusCode, message: customError.message });
};

export default errorHandlerMiddleware;
