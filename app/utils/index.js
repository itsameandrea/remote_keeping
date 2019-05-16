const isObject = function (o) {
  return o === Object(o) && !Array.isArray(o) && typeof o !== 'function'
}

const toSnakeCase = (obj) => {
  if (!isObject(obj)) return obj;

  for(let oldName in obj){

    // Camel to underscore
    const newName = oldName.replace(/([A-Z])/g, function($1){return "_"+$1.toLowerCase();});

    // Only process if names are different
    if (newName != oldName) {
      // Check for the old property name to avoid a ReferenceError in strict mode.
      if (obj.hasOwnProperty(oldName)) {
        obj[newName] = obj[oldName];
        delete obj[oldName];
      }
    }

    // Recursion
    if (isObject(obj[newName])) {
      obj[newName] = camelCaseKeysToUnderscore(obj[newName]);
    }

  }
  return obj;
}

export {
  toSnakeCase
}
