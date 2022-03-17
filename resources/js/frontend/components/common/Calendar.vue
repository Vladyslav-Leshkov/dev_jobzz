<template>
    <div class="calendar">
        <input type="text" class="form-control d-none"  ref="element" @change="onChange" >
    </div>
</template>

<script>
import flatpickr from "flatpickr";
import { Russian } from "flatpickr/dist/l10n/ru.js"
import {onMounted, ref} from "vue";

export default {
    name: "Calendar",
    props: {
        modelValue: {
            validator(value) {
                return (
                    value === null ||
                    value instanceof Date ||
                    typeof value === 'string' ||
                    value instanceof String ||
                    typeof value === 'number'
                );
            }
        },
        dateFormat: {
            type: String,
            default: 'Z'
        },
        minDate: {
            validator(value) {
                return (
                    value === null ||
                    value instanceof Date ||
                    typeof value === 'string' ||
                    value instanceof String ||
                    typeof value === 'number'
                );
            },
            default: null
        },
        maxDate: {
            validator(value) {
                return (
                    value === null ||
                    value instanceof Date ||
                    typeof value === 'string' ||
                    value instanceof String ||
                    typeof value === 'number'
                );
            },
            default: null
        }
    },
    emits:['update:modelValue'],
    setup(props, {emit}){
        const element = ref(null);
        const fp = ref(null);
        onMounted(()=>{
            fp.value = flatpickr(element.value, {
                inline: true,
                locale: Russian,
                dateFormat: props.dateFormat,
                monthSelectorType: 'static',
                minDate: props.minDate,
                maxDate: props.maxDate,
            });
        })

        const onChange = (event) => {
            emit('update:modelValue', event.target.value);
        }

        return {
            element,
            onChange,
        }
    }
}
</script>

<style scoped>

</style>
