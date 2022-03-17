<template>
    <div class="filter-collapse" :class="{collapsed: !expanded}">
        <a href="#" @click.prevent="expanded = !expanded" class="filter-collapse-title"> <svg-icon icon="ar-up-gr" class="me-5"></svg-icon> <span>{{title}}</span></a>
        <bs-collapse class="filter-collapse-body" :expanded="expanded">
            <slot />
        </bs-collapse>
    </div>
</template>

<script>
import {ref} from "vue";
import BsCollapse from "../bootstrap/BsCollapse";
import SvgIcon from "../svg/SvgIcon";

export default {
    name: "FilterCollapse",
    components: {SvgIcon, BsCollapse},
    props: {
        title: String,
        collapsed: {
            type: Boolean,
            default: true,
        },
    },
    setup(props){
        const expanded = ref(!props.collapsed);
        return{
            expanded,
        }
    }
}
</script>

<style scoped>

</style>
