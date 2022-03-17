<template>
    <div class="range" ref="range">
        <slot />
    </div>
</template>

<script>
import noUiSlider from 'nouislider';
import {onMounted, ref, watch} from "vue";
import {useVModel} from "../../../composables/useVModel";

export default {
    name: "FormRange",
    props: {
        modelValue: {
            types: [Number, Array],
            default: 0,
        },
        name: {
            type: String,
        },
        min: {
            type: Number,
            default: 0,
        },
        max: {
            type: Number,
            default: 100,
        },
        step: {
            type: Number,
            default: 1,
        },
        tooltips: {
            types: [Boolean, Object, Array],
            default: false,
        },
    },
    setup(props){

        const range = ref(null);
        const innerValue = useVModel(props, 'modelValue');

        let sliderApi = null;

        onMounted(()=>{
            sliderApi = noUiSlider.create(range.value, {
                start: props.modelValue,
                tooltips: props.tooltips,
                step: props.step,
                range: {
                    'min': props.min,
                    'max': props.max
                },
            });

            sliderApi.on('change', (values, handle, unencoded)=> {
                let val = unencoded.map( v => parseInt(v));

                if(val){
                    if(val.length > 1){
                        innerValue.value = val;
                    }else{
                        if(innerValue.value !== val[0]){
                            innerValue.value = val[0];
                        }
                    }
                }

            });
        });

        watch(()=>props.modelValue, (val)=>{
            sliderApi.set(props.modelValue);
        });

        return {
            range,
        }
    }
}
</script>

<style scoped>

</style>
