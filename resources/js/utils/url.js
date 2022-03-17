export const parseQuery = function (url = null) {
    let query;
    if (url) {
        let parts = url.split('?');
        query = parts.length > 1 ? parts[1] : '';
    } else {
        query = document.location.search.replace('?', '');
    }

    let queryParts = query.split('&') || [];
    let params = {};
    queryParts.forEach(function (item) {
        let itemParts = item.split('=');
        if (itemParts[0].length) {
            params[itemParts[0]] = decodeURIComponent(itemParts[1]);
        }
    });
    return params;
}

export const getQueryParam = function (name, defaultValue = null) {
    const params = parseQuery();
    return params[name] || defaultValue;
}

export const serialize = function (obj, prefix) {
    let str = [],
        p;
    for (p in obj) {
        if (obj.hasOwnProperty(p)) {
            let k = prefix ? prefix + "[" + p + "]" : p,
                v = obj[p];
            if ((v !== null && typeof v === "object")) {
                let ser = serialize(v, k);
                if (ser.length) {
                    str.push(ser);
                }
            } else {
                str.push(encodeURIComponent(k) + "=" + encodeURIComponent(v));
            }

        }
    }
    return str.join("&");
}

export const currentUrl = function () {
    return document.location.pathname + document.location.search;
}

export const makeUrl = function (path, params = {}) {
    let searchQuery = serialize(params);
    if (searchQuery.length > 0) {
        path += '?' + searchQuery;
    }
    return path;
}

export const updateQuery = function (path, params = {}, checkChange = false) {
    const url = makeUrl(path, params);
    if (checkChange && url === currentUrl()) {
        return false;
    }
    window.history.pushState(null, null, url);
    return url;
}

export const filterParams = (params = {}, etalon = {}) => {
    const filtered = {};
    for (let key in params) {
        if (params[key]) {
            if (etalon.hasOwnProperty(key) && etalon[key] === params[key]) continue;

            filtered[key] = params[key];
        }
    }
    return filtered;
}

export const updateUrl = function (path, params = {}, checkChange = false) {
    const url = makeUrl(path, params);
    if (checkChange && url === currentUrl()) {
        return false;
    }
    window.history.pushState(null, null, url);
    return url;
}


export const setUrlQuery = function (params = {}, checkChange = true) {
    const newParams = filterParams(params);
    updateUrl(document.location.pathname, newParams, checkChange);
}

export const updateUrlQuery = function (params = {}, checkChange = true) {
    const newParams = filterParams(Object.assign(parseQuery(), params));
    updateUrl(document.location.pathname, newParams, checkChange);
}
