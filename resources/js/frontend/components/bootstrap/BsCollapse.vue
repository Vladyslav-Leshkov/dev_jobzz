<template>
    <div class="collapse" ref="collapse">
        <slot />
    </div>
</template>

<script>
import {ref, watch, onMounted, onUnmounted} from "vue";
import {Collapse} from 'bootstrap';

export default {
    name: "BsCollapse",
    props: {
        expanded: Boolean
    },
    setup(props){
        const collapse = ref(null);
        const collapsed = ref(!props.expanded);
        const instance = ref(null);

        onMounted(()=>{
            instance.value = new Collapse(collapse.value, {
                toggle: props.expanded
            });
        });
        onUnmounted(()=>{
            if(instance.value){
                instance.value.dispose();
            }
        });

        const show = () => {
            collapsed.value = false;
            instance.value.show();
        }

        const hide = () => {
            collapsed.value = true;
            instance.value.hide();
        }

        const toggle = () => {
            if(collapsed.value){
                show();
            }else {
                hide();
            }
        }

        watch(()=>props.expanded, (newState)=>{
           if(newState){
               show();
           }else {
               hide();
           }
        });

        return {
            collapse,
            show,
            hide,
            toggle,
        }
    }
}
</script>

<style scoped>

</style>
