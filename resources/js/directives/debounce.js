/*
      This is the typical debouncer function that receives
      the "callback" and the time it will wait to emit the event
    */
function debouncer(fn, delay) {
    var timeoutID = null
    return function () {
        clearTimeout(timeoutID)
        var args = arguments
        var that = this
        timeoutID = setTimeout(function () {
            fn.apply(that, args)
        }, delay)
    }
}

/*
  this function receives the element where the directive
  will be set in and also the value set in it
  if the value has changed then it will rebind the event
  it has a default timeout of 500 milliseconds
*/
export default function debounce(el, binding) {
    if (binding.value !== binding.oldValue) {
        el.oninput = debouncer(function () {
            el.dispatchEvent(new Event('change'))
        }, parseInt(binding.value) || 500)
    }
}