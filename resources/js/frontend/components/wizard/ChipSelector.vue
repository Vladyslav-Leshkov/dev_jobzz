<template>
    <div class="mb-60">
        <div v-if="title" class="title-profile">{{ title }}</div>
        <div v-if="subtitle" class="subtitle-profile">{{ subtitle }}</div>
        <div class="mw-840 mb-15">
            <typeahead :options="options"
                       :placeholder="placeholder"
                       class="d-block mw-420"
                       @select="selectItem"
            ></typeahead>
        </div>
        <div>
            <div class="mb-15">
                <slot/>
                <chip v-for="selected in selectedItems"
                      :key="'selected-'+name+'-'+selected.id"
                      :item="selected"
                      class="bg-primary me-8 mb-8"
                      dismisable
                      @close="removeItem"
                >{{ selected.title }} <input :name="name + '[]'" :value="selected.id" type="hidden"/></chip>
            </div>
        </div>
        <div v-if="errorMessage && validation" class="form-text text-danger">{{ __('Please select at least one') }}
        </div>
    </div>
</template>

<script>
import Typeahead from "../form/Typeahead";
import Chip from "../common/Chip";
import {useWizardOptions} from "./useWizardOptions";
import {useField} from "vee-validate";
import {computed, watch} from "vue";

export default {
    name: "ChipSelector",
    components: {Typeahead, Chip},
    props: {
        name: {
            type: String,
            required: true
        },
        title: {
            type: String,
            default: ''
        },
        subtitle: {
            type: String,
            default: ''
        },
        placeholder: {
            type: String,
            default: ''
        },
        modelValue: {
            type: Array,
            default() {
                return []
            }
        },
        options: {
            types: [Array, null],
            default: null
        },
        rules: {
            type: [String, Object],
            default: ''
        },
        validation: {
            type: Boolean,
            default: true
        },
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {
        let options;


        if (props.options === null) {
            const {[props.name]: opt} = useWizardOptions(props.name);
            options = opt;
        } else {
            options = props.options;
        }

        //const innerValue = useVModel(props, 'modelValue');
        const {value: innerValue, errorMessage} = useField(props.name, props.rules, {
            initialValue: props.modelValue,
        });
        watch(innerValue, (val) => emit('update:modelValue', val));
        watch(() => props.modelValue, (val) => innerValue.value = val);
        const selectedItems = computed(() => options.filter(c => innerValue.value.indexOf(c.id) !== -1))

        const removeItem = (item) => {
            innerValue.value = innerValue.value.filter(id => id !== item.id);
        }
        const selectItem = (item) => {
            if (innerValue.value.indexOf(item.id) === -1) {
                innerValue.value = [...innerValue.value, item.id];
            }
        }
        return {
            options,
            selectedItems,
            innerValue,
            errorMessage,
            removeItem,
            selectItem,
        }
    }
}
</script>

<style scoped>

</style>
