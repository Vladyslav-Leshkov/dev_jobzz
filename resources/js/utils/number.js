export const toCurrency = function (value, currency) {
    if (value) {
        value = parseFloat(value);
        return value.toLocaleString('ru-RU', {
                style: 'currency',
                currency: currency,
                maximumFractionDigits: 0
            })
            .replace('RUB', '₽')
            .replace('KZT', '₸');
    }
    return '';
}

export const toAmount = function (value, decimal = 0, withZero = false) {
    if (!withZero ? value : (value || value === 0)) {
        value = parseFloat(value);
        return value.toLocaleString('ru-RU', {
            style: 'decimal',
            maximumFractionDigits: decimal
        });
    }
    return '';

}

export const convertCurrency = (value, course) => {
    return Math.ceil(value * course);
}
