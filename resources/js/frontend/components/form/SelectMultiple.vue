<template>
    <div class="form-select-dropdown" v-click-outside="close">

        <button @click.prevent="toggle()" class="form-select form-select-toggle">
            <svg-icon icon="check-success" class="me-1" v-if="selected" /> {{selectTitle}}
        </button>
        <div class="form-select-menu" :class="{'d-none':!opened}">
            <div class="form-select-menu-inner">
                <div class="form-select-menu-item" v-for="option in options" :key="'option-'+name+'-'+option.id">
                    <input type="checkbox" v-model="innerValue" :name="name" :value="option.id" :id="'option-'+name+'-'+option.id" >
                    <label :for="'option-'+name+'-'+option.id">{{option.title}}</label>
                </div>
            </div>

        </div>
    </div>
</template>

<script>
import {watch, ref, computed} from "vue";
import {useDropdown} from "./useDropdown";
import SvgIcon from "../svg/SvgIcon";

export default {
    name: "SelectMultiple",
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
    },
    emits: ['update:modelValue'],
    setup(props, {emit}){
        const {opened, toggle, close} = useDropdown();

        const innerValue = ref(props.modelValue);

        const selectedItems = computed(()=> props.options.filter( o => innerValue.value.indexOf(o.id) !== -1));

        const selected = computed(()=> selectedItems.value.length > 0);

        const selectTitle = computed(()=>{
            return selectedItems.value.length
                ? selectedItems.value.map( si => si.title).join(', ')
                :props.title;
        });

        watch(innerValue, (val)=>emit('update:modelValue', val));

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
