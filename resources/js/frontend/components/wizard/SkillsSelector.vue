<template>
    <div :id="name+'_section'" class="mb-60 skill-selector">
        <div v-if="title" class="title-profile">{{ title }}</div>
        <div v-if="subtitle" class="subtitle-profile">({{ subtitle }})</div>
        <div class="mw-840 mb-15">
            <vue-multiselect
                v-model="innerValue"
                :close-on-select="false"
                :multiple="true"
                :options="options"
                :placeholder="placeholder"
                :taggable="true"
                tag-placeholder=" "
                @tag="selectItem"
            />

            <div v-if="errorMessage" class="form-text text-danger">{{ errorTitle }}</div>
        </div>
        <div>
            <div class="subtitle-popular">{{ subtitlePopular }}</div>
            <div class="buttons-profile__item">
                <div v-for="option in recommendations" :key="'popular-'+name+'-'+option.id"
                     class="custom-check me-10 mb-10" :class="{'d-none': innerValue.indexOf(option.title) !== -1}">
                    <input :id=" name + '-'+option.id" v-model="innerValue" :value="option.title"
                           type="checkbox">
                    <label :for="name + '-'+option.id"
                           class="btn btn-primary-light rounded-pill">{{ option.title }}</label>
                </div>
            </div>
            <input v-for="val in innerValue" :name="name + '[]'" :value="val" type="hidden">
        </div>

    </div>
</template>

<script>
import Chip from "../common/Chip";
import {useWizardOptions} from "./useWizardOptions";
import {useField} from "vee-validate";
import {computed, inject, watch} from "vue";
import {useFormDataProperty} from "../../store/composables/useFormData";
import VueMultiselect from 'vue-multiselect';

export default {
    name: "SkillsSelector",
    components: {Chip, VueMultiselect},
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
        maxTags: {
            type: Number,
            default: 0,
        }
    },
    emits: ['update:modelValue'],
    setup(props, {emit}) {

        const {skills, specializations} = useWizardOptions(['skills', 'specializations']);
        //const innerValue = useVModel(props, 'modelValue');
        const {value: innerValue, errorMessage} = useField(props.name, props.rules, {
            initialValue: props.modelValue,
        });

        watch(innerValue, (val) => emit('update:modelValue', val));

        const namespace = inject("STORE_NAMESPACE");


        const removeItem = (item) => {
            innerValue.value = innerValue.value.filter(id => id !== item.id);
        }

        const selectedSpec = useFormDataProperty('specializations', namespace);


        const recommendations = computed(() => {

            return specializations.reduce(function (prev, curr) {
                return [...prev, ...curr.items];
            }, []).filter(it => selectedSpec.value.indexOf(it.id) !== -1).reduce(function (prev, curr) {
                return [...prev, ...curr.skills];
            }, []);
        });

        const options = skills.map(s => s.title);


        const selectItem = (item) => {
            item = item.trim();

            const skill = skills.find(s => s.title.toLowerCase() === item.toLowerCase());
            if (skill) {
                item = skill.title;
            }
            if (innerValue.value.indexOf(item) === -1) {
                console.log(item);
                innerValue.value = [...innerValue.value, item];
            }
        }


        return {
            options,
            recommendations,
            innerValue,
            errorMessage,
            removeItem,
            selectItem,
        }
    }
}
</script>

<style scoped>
.buttons-profile__item {
    min-height: 42px;
}
</style>
