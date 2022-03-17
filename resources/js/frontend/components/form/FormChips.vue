<template>
    <div class="form-chips">
        <div class="mb-15 mw-420">
            <typeahead class="d-block"
                       :options="options"
                       @select="selectItem"
                       :placeholder="placeholder"
                       :input-class="inputClass"
            ></typeahead>
        </div>
        <div class="mb-15">
            <slot />

            <chip v-for="selected in selectedItems"
                  class="bg-primary me-8 mb-8"
                  dismisable
                  :item="selected"
                  :key="'selected-'+name+'-'+selected.id"
                  @close="removeItem"
            >{{selected.title}} <input type="hidden" :name="name + '[]'" :value="selected.id" /></chip>
        </div>
    </div>
</template>

<script>
import Typeahead from "./Typeahead";
import Chip from "../common/Chip";
import {useField} from "vee-validate";
import {computed, toRefs, watch} from "vue";
export default {
    name: "FormChips",
    components: {Chip, Typeahead},
    props: {
        name: String,
        modelValue: {
            type: Array,
            default(){
                return []
            }
        },
        options: {
            type: Array,
            default(){
                return []
            }
        },
        rules: {
            type: [String, Object],
            default: ''
        },
        placeholder: {
            type: String,
            default: ''
        },
        inputClass: {
            type: String,
            default: 'form-control form-control-search'
        }
    },
    setup(props, {emit}){
        const {options} = toRefs(props);

        const {value: innerValue, errorMessage} = useField(props.name,  props.rules, {
            initialValue: props.modelValue,
        });
        watch(innerValue, (val)=> emit('update:modelValue', val));
        watch(()=>props.modelValue, (newVal, oldVal)=>{
            if(!_.isEqual(newVal, oldVal)){
                innerValue.value = newVal;
            }
        });

        const selectedItems = computed(()=> options.value.filter( c=> innerValue.value.indexOf(c.id) !== -1))

        const removeItem = (item) => {
            innerValue.value = innerValue.value.filter( id => id !== item.id);
        }
        const selectItem = (item) => {
            if(innerValue.value.indexOf(item.id) === -1){
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
