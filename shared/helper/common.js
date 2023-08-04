import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

export const isArray = (element) => Array.isArray(element);

export const isEmptyArray = (element) =>
  !(isArray(element) && element.length > 0);

export const isEmptyObject = (obj) => Object.entries(obj).length === 0;

export const logError = (error) => {
  const currentFileUrl = new URL(import.meta.url);
  const currentFilePath = fileURLToPath(currentFileUrl); // Convert the file URL to a local file path
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
