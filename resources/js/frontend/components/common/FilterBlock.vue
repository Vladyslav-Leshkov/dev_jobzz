<template>
    <div class="filter-block" :class="{collapsed: !expanded}">
        <a href="#" @click.prevent="expanded = !expanded" class="filter-block-title"><span>{{title}}</span> <svg-icon icon="ar-up-gr"></svg-icon></a>
        <bs-collapse class="filter-block-body" :expanded="!expanded">
            <slot />
        </bs-collapse>
    </div>
</template>

<script>
import BsCollapse from "../bootstrap/BsCollapse";
import {ref} from "vue";
import SvgIcon from "../svg/SvgIcon";
export default {
    name: "FilterBlock",
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
