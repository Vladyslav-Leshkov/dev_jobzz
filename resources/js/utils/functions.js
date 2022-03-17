/**
 * Create a random uuid
 */
export const uuid = () => {
    const s4 = () => Math.floor((1 + Math.random()) * 0x10000).toString(16).substring(1);
    return s4() + s4() + '-' + s4() + '-' + s4() + '-' + s4() + '-' + s4() + s4() + s4();
};

/**
 * Delays a function for the given number of milliseconds, and then calls
 * it with the arguments supplied.
 *
 * @param  {Function} fn   function
 * @param  {Number}   wait delay
 * @param  {Number}   args arguments
 * @return {Function}
 */
export const delay = (fn, wait, ...args) => setTimeout(() => fn.apply(null, args), wait);

/**
 * Returns a debounced function that will make sure the given
 * function is not triggered too much.
 *
 * @param  {Function} fn Function to debounce.
 * @param  {Number}   debounceDuration OPTIONAL. The amount of time in milliseconds for which we will debounce the
 *         function. (defaults to 100ms)
 * @return {Function}
 */
export const debounce = (fn, debounceDuration = 100) => (...args) => {
    if (!fn.debouncing) {
        fn.lastReturnVal = fn.apply(window, args);
        fn.debouncing = true;
    }
    clearTimeout(fn.debounceTimeout);
    fn.debounceTimeout = setTimeout(() => {
        fn.debouncing = false;
    }, debounceDuration);
    return fn.lastReturnVal;
};

export const isString = obj => obj === '' + obj;

export const isArray = obj => Object.prototype.toString.call(obj) === '[object Array]';

export const isNumberLike = (obj) =>
    (obj !== null && obj !== undefined && ((isString(obj) && isFinite(parseFloat(obj))) || (isFinite(obj))));

export const getFirsNumberLike = (...args) => {
    if (!args.length) {
        return null;
    }

    for (let i = 0, len = args.length; i < len; i++) {
        if (isNumberLike(args[i])) {
            return args[i];
        }
    }

    return null;
};

export const isObject = (obj) => Object.prototype.toString.call(obj) === '[object Object]';

export const simpleExtend = (defaultOpt, options) => {
    const opt = {};

    for (let key in defaultOpt) {
        opt[key] = defaultOpt[key];
    }
    for (let key in options) {
        opt[key] = options[key];
    }

    return opt;
};

export const between = (pos, min, max) => {
    if (pos < min) {
        return min;
    }
    if (pos > max) {
        return max;
    }
    return pos;
};

export const assignOnly = (...args) => {
    if (!args.length) {
        return null;
    }
    const obj1 = args[0];

    for (let i = 1, len = args.length; i < len; i++) {
        const obj2 = args[i];
        Object.keys(obj2).forEach(function (key) {
            if (key in obj1) { // or obj1.hasOwnProperty(key)
                obj1[key] = obj2[key];
            }
        });
    }
    return obj1;
}

export const scrollToElementSelector = function (selector, offset = 0) {
    let element = document.querySelector(selector);
    let duration = 500;
    let startingY = window.pageYOffset;
    let elementY = element.offsetTop;
    let diff = elementY - startingY + offset;
    let start;

    // Bootstrap our animation - it will get called right before next frame shall be rendered.
    window.requestAnimationFrame(function step(timestamp) {
        if (!start) start = timestamp;
        // Elapsed milliseconds since start of scrolling.
        let time = timestamp - start;
        // Get percent of completion in range [0, 1].
        let percent = Math.min(time / duration, 1);

        window.scrollTo(0, startingY + diff * percent);

        // Proceed with animation as long as we wanted it to.
        if (time < duration) {
            window.requestAnimationFrame(step);
        }
    })
}

export const scrollToElement = function (event) {
    event.preventDefault();
    scrollToElementSelector(event.currentTarget.getAttribute('href'));
}

export const scrollTo = (selector, offset = 0) => {
    console.log(selector);
    const el = document.querySelector(selector);
    if (el) {
        if (offset !== 0) {
            const y = el.getBoundingClientRect().top + window.pageYOffset + offset;
            window.scrollTo({top: y, behavior: 'smooth'});
        } else {
            el.scrollIntoView({
                behavior: 'smooth',
            })
        }
    }
}