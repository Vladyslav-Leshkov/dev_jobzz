<template>
    <svg
        :height="height || size"
        :viewBox="svgViewBoxValues"
        :width="width || size"
        class="svg-icon"
        xmlns="http://www.w3.org/2000/svg"
        v-html="svgContent"
    >
    </svg>
</template>

<script>
import {computed} from "vue";

export default {
    name: "SvgIcon",
    props: {
        icon: String,
        size: {
            type: [String, Number],
            default: 14
        },
        width: {
            default: null
        },
        height: {
            default: null
        }
    },
    setup(props) {

        const iconPath = computed(() => {
            return props.icon.replace(new RegExp('.'.replace(/([.*+?^=!:${}()|\[\]\/\\])/g, '\\$1'), 'g'), '/') + '.svg';
        });

        const svgString = computed(() => {
            return require(`../../../../svg/${iconPath.value}`).default
        });

        const svgContent = computed(() => {
            return svgString.value ? svgString.value.replace(/^<svg[^>]*>|<\/svg>$/g, '') : null;
        });

        const svgViewBoxValues = computed(() => {
            return svgString.value ? (/viewBox="([^"]+)"/.exec(svgString.value) || '')[1] : null;
        });

        return {
            svgContent,
            svgViewBoxValues,
        }
    }
}
</script>

<style scoped>

</style>
