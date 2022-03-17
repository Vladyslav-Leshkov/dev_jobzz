<template>
    <div v-click-outside="close" class="form-select-dropdown">

        <button class="form-select form-select-toggle" @click.prevent="toggle()">
            <svg-icon v-if="selected" class="me-1" icon="check-success"/>
            {{ selectTitle }}
        </button>
        <div :class="{'d-none':!opened}" class="form-select-menu">
            <div class="form-select-menu-inner">
                <div v-for="option in options" :key="'option-'+name+'-'+option.id" class="form-select-menu-item">
                    <input :id="'option-'+name+'-'+option.id" v-model="innerValue" :name="name" :value="option.id"
                           type="radio">
                    <label :for="'option-'+name+'-'+option.id">{{ option.title }}</label>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import SvgIcon from "../svg/SvgIcon";
import {useDropdown} from "./useDropdown";
import {computed, ref, watch} from "vue";

export default {
    name: "FormSelect",
    components: {SvgIcon},
    props: {
        name: {
            type: String,
            required: true,
        },
        title: {
            type: String,
            default: ''
        },
        modelValue: {
            types: [String, Number, null],
            default: null
        },
        options: {
            types: [Array, null],
            default() {
                return []
            }
        },
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {
        const {opened, toggle, close} = useDropdown();

        const innerValue = ref(props.modelValue);

        const selectedItems = computed(() => props.options.filter(o => innerValue.value === o.id));

        const selected = computed(() => selectedItems.value.length > 0);

        const selectTitle = computed(() => {
            return selectedItems.value.length
                ? selectedItems.value.map(si => si.title).join(', ')
                : props.title;
        });

        watch(innerValue, () => {
            close();
            if (innerValue.value !== props.modelValue) {
                emit('update:modelValue', innerValue.value);
            }
        });

        watch(() => props.modelValue, (val) => {
            if (val !== innerValue.value) {
                innerValue.value = val;
            }
        });

        return {
            opened,
            toggle,
            close,
            innerValue,
            selected,
            selectTitle,
        }
    }
}
</script>

<style scoped>

</style>
