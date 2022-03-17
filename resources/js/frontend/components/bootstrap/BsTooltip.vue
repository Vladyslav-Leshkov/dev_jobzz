<template>
    <span ref="telem">
        <slot><svg-icon icon="help" size="32" /></slot>
    </span>
</template>

<script>
import {ref, onMounted} from "vue";
import {Tooltip} from 'bootstrap';
import SvgIcon from "../svg/SvgIcon";
export default {
    name: "BsTooltip",
    components: {SvgIcon},
    props: {
        title: {
            types:  [String, Element, Function]
        },
        container: {
            type: String,
            default: 'body',
        },
        placement: {
            type: String,
            default: 'top',
        },
        trigger: {
            type: String,
            default: 'hover focus',
        }
    },
    setup(props){
        const telem = ref(null);
        let tooltip;

        onMounted(()=>{
            tooltip = new Tooltip(telem.value, {
                container: props.container,
                placement: props.placement,
                trigger: props.trigger,
                title: props.title,
            })
        });

        return {
            telem
        }
    }
}
</script>

<style scoped>

</style>
