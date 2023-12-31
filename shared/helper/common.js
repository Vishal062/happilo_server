export const isArray = (element) => Array.isArray(element);

export const isEmptyArray = (element) =>
  !(isArray(element) && element.length > 0);

export const isEmptyObject = (obj) => Object.entries(obj).length === 0;
