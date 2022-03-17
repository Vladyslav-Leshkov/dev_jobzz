<template>
    <nav class="pagination">
        <ul class="pagination-body">
            <li class="pagination-item">
                <a :class="{disabled: modelValue <= 1}"
                   class="pagination-arrow arrow-left"
                   href="#"
                   @click.prevent="change(modelValue - 1)"
                ></a>
            </li>
            <li v-for="page in pagination" :key="page.value" class="pagination-item">
                <a v-if="page.value !== modelValue" class="pagination-link" href="#"
                   @click.prevent="change(page.value)"
                >{{ page.text }}</a>
                <span v-if="page.value === modelValue" class="pagination-current">{{ page.text }}</span>
            </li>
            <li class="pagination-item">
                <a :class="{disabled: modelValue >= lastPage}"
                   class="pagination-arrow arrow-right"
                   href="#"
                   @click.prevent="change(modelValue + 1)"
                ></a>
            </li>
        </ul>
    </nav>

</template>

<script>
import {computed} from "vue";

export default {
    name: "Pagination",
    props: {
        modelValue: {
            types: [Number, null],
            default: 1
        },
        perPage: {
            required: false,
            types: [Number, null],
            default: 20,
        },
        lastPage: {
            required: false,
            types: [Number, null],
            default: 1,
        }
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {
        const change = (page) => {
            if (page > props.lastPage || page < 1) return;
            emit('update:modelValue', page)
        }

        const pagination = computed(() => {
            let pagination = [];
            let currentPage = props.modelValue;
            let totalPages = props.lastPage;

            if (currentPage < 5) {
                for (let page = 1; page < currentPage; page++) {
                    pagination.push({value: page, text: page});
                }
            } else {
                pagination.push({value: 1, text: 1});
                pagination.push({value: currentPage - 3, text: '...'});
                for (let page = currentPage - 2; page <= currentPage - 1; page++) {
                    pagination.push({value: page, text: page});
                }
            }
            pagination.push({value: currentPage, text: currentPage});

            if (totalPages > 7 && totalPages - currentPage > 5) {
                for (let page = currentPage + 1; page <= currentPage + 2; page++) {
                    pagination.push({value: page, text: page});
                }
                pagination.push({value: currentPage + 3, text: '...'});
                pagination.push({value: totalPages, text: totalPages});
            } else {
                for (let page = currentPage + 1; page <= totalPages; page++) {
                    pagination.push({value: page, text: page});
                }
            }
            return pagination;
        })

        return {
            change,
            pagination,
        }
    }
}
</script>

<style scoped>

</style>