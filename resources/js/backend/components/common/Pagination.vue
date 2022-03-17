<template>
    <nav>
        <ul class="pagination">
            <li v-for="link in links" class="page-item" :class="{disabled: !link.url, active: link.active}">
                <a v-if="link.url" class="page-link" @click.prevent="setPage(link.url)" :href="link.url"
                   v-html="link.label"></a>
                <span v-if="!link.url" class="page-link" v-html="link.label"></span>
            </li>
        </ul>
    </nav>
</template>

<script>
import * as UrlUtils from "../../../utils/url";

export default {
    name: "Pagination",
    props: {
        links: Array,
    },
    setup(props, {emit}) {
        const setPage = (url) => {
            const params = UrlUtils.parseQuery(url);
            console.log(url, params);
            const page = parseInt(params['page']) || 1;
            emit('change', page);
        }

        return {
            setPage
        }
    }
}
</script>

<style scoped>

</style>