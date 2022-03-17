<template>
    <div>
        <div class="form-check" v-for="option in options" :key="name+'-'+option.id">
            <input class="form-check-input" :name="name + '[]'"
                   type="checkbox"
                   :value="option.id"
                   v-model="innerValue"
                   :id="name+'-'+option.id">
            <label class="form-check-label" :for="name+'-'+option.id">{{option.title}}</label>
        </div>
    </div>
</template>

<script>
import {computed} from "vue";

export default {
    name: "FormCheckGroup",
    props: {
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
        name: String
    },
    setup(props, {emit}){

        const innerValue = computed({
            get(){
                return props.modelValue;
            },
            set(value){
                emit('update:modelValue', value);
            }
        });
        return {
            innerValue,
        }

    }
}
</script>

<style scoped>

</style>
