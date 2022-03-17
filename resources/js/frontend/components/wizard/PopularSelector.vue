<template>
    <div :id="name+'_section'" class="mb-60">
        <div v-if="title" class="title-profile">{{ title }}</div>
        <div v-if="subtitle" class="subtitle-profile">{{ subtitle }}</div>
        <div class="mw-840 mb-15">
            <vue-multiselect
                :close-on-select="false"
                :model-value="selectedItems"
                :multiple="true"
                :options="allOptions"
                :placeholder="placeholder"
                :taggable="true"
                class="d-block mw-480"
                label="title"
                tag-placeholder=" "
                track-by="id"
                @update:model-value="updateSelected"
            />

            <div v-if="errorMessage" class="form-text text-danger">{{ errorTitle }}</div>
        </div>
        <div>
            <div class="subtitle-popular">{{ subtitlePopular }}</div>
            <div class="buttons-profile__item">
                <div v-for="option in popularOptions" :key="'popular-'+name+'-'+option.id"
                     class="custom-check me-10 mb-10" :class="{'d-none': innerValue.indexOf(option.id) !== -1}">
                    <input :id=" name + '-'+option.id" v-model="innerValue" :name="name + '[]'" :value="option.id"
                           type="checkbox">
                    <label :for="name + '-'+option.id"
                           class="btn btn-primary-light rounded-pill">{{ option.title }}</label>
                </div>
            </div>
        </div>

    </div>
</template>

<script>
import {computed, inject, ref, watch} from "vue";
import Chip from "../common/Chip";
import Typeahead from "../form/Typeahead";
import {useWizardOptions} from "./useWizardOptions";
import {useField} from "vee-validate";
import VueMultiselect from "vue-multiselect";

export default {
    name: "PopularSelector",
    components: {Typeahead, Chip, VueMultiselect},
    props: {
        name: {
            type: String,
            required: true
        },
        title: {
            type: String,
            default: ''
        },
        subtitle: {
            type: String,
            default: ''
        },
        subtitlePopular: {
            type: String,
            default: 'Популярные'
        },
        placeholder: {
            type: String,
            default: ''
        },
        modelValue: {
            type: Array,
            default() {
                return []
            }
        },
        rules: {
            type: [String, Object],
            default: ''
        },
        errorTitle: {
            type: String,
            default: 'Выберите не менее одного'
        },
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {

        const {[props.name]: allOptions} = useWizardOptions(props.name);

        const options = allOptions.filter(o => !o.popular);
        const popularOptions = allOptions.filter(o => o.popular);

        //const innerValue = useVModel(props, 'modelValue');
        const {value: innerValue, errorMessage} = useField(props.name, props.rules, {
            initialValue: props.modelValue,
        });
        watch(innerValue, (val) => emit('update:modelValue', val));

        const selectedItems = computed(() => allOptions.filter(c => innerValue.value.indexOf(c.id) !== -1))

        const removeItem = (item) => {
            innerValue.value = innerValue.value.filter(id => id !== item.id);
        }

        const updateSelected = (items) => {
            innerValue.value = items.map(it => it.id);
        }


        return {
            options,
            allOptions,
            popularOptions,
            selectedItems,
            innerValue,
            errorMessage,
            removeItem,
            updateSelected,
        }
    }
}
</script>

<style scoped lang="scss">
.buttons-profile__item {
    min-height: 42px;
}
</style>
