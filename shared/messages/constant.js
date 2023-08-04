// constant.js
export const STATUS = {
  SUCCESS: 1, // Custom Success status code
  FAILURE: 0, // Custom Failure status code
  OK: 200, // OK status code
  CREATED: 201, // Created status code
  NO_CONTENT: 204, // No Content status code
  BAD_REQUEST: 400, // Bad Request status code
  UNAUTHORIZED: 401, // Unauthorized status code
  FORBIDDEN: 403, // Forbidden status code
  NOT_FOUND: 404, // Not Found status code
  METHOD_NOT_ALLOWED: 405, // Method Not Allowed status code
  INTERNAL_SERVER_ERROR: 500, // Internal Server Error status code
  SERVICE_UNAVAILABLE: 503, // Service Unavailable status code
};

export const STATUS_MESSAGE = {
  [STATUS.OK]: 'OK', // Success message
  [STATUS.CREATED]: 'Created', // Created message
  [STATUS.NO_CONTENT]: 'No Content', // No Content message
  [STATUS.BAD_REQUEST]: 'Bad Request', // Bad Request message
  [STATUS.UNAUTHORIZED]: 'Unauthorized', // Unauthorized message
  [STATUS.FORBIDDEN]: 'Forbidden', // Forbidden message
  [STATUS.NOT_FOUND]: 'Not Found', // Not Found message
  [STATUS.METHOD_NOT_ALLOWED]: 'Method Not Allowed', // Method Not Allowed message
  [STATUS.INTERNAL_SERVER_ERROR]: 'Internal Server Error', // Internal Server Error message
  [STATUS.SERVICE_UNAVAILABLE]: 'Service Unavailable', // Service Unavailable message
};

export const MESSAGE = {
  ADDED_SUCCESS: 'Added Successfully.',
  ADDED_FAILURE: 'Failed to add. Please check the provided data.',
  FETCH_SUCCESS: 'Fetched Successfully.',
  FETCH_FAILURE: 'Failed to fetch data. Please try again later.',
};

export const TRANSACTION_STATUS = {
  BEGIN: 'BEGIN',
  COMMIT: 'COMMIT',
  ROLLBACK: 'ROLLBACK',
};
