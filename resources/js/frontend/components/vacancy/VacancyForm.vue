<template>
    <div>
        <div v-show="!preview">


            <div class="container-fluid container-lg pt-50 pt-lg-100">

                <form :action="action" method="post" @submit="onSubmit">
                    <slot/>
                    <div id="title_section" class="mb-60">
                        <div class="title-profile">{{ __('Vacancy title') }}</div>
                        <text-form-group v-model.trim="formData.title"
                                         class="mw-940"
                                         floating

                                         :label="__('Enter vacancy title')"
                                         name="title"
                                         placeholder=" "
                                         rules="required"/>
                    </div>

                    <specialization-single-selector v-model="formData.specializations"/>


                    <experience-selector v-model="formData.experience"
                                         :max="6"
                                         :plural="[__('vacancy.from-one-year'), __('vacancy.from-many-years'), __('vacancy.from-many-years')]"
                                         :max-title="__('5 years or more')"
                                         :min-title="__('Without experience')"
                                         :prefix="__('vacancy.from')"
                    ></experience-selector>

                    <english-level-selector v-model="formData.english_level"></english-level-selector>

                    <chip-selector id="location_section"
                                   key="cities-selector"
                                   v-model="formData.cities"
                                   :options="cities"
                                   name="cities"
                                   :placeholder="__('Enter the name of the city')"
                                   :title="__('Location selection')"
                    >
                        <check-btn v-for="option in popularCities"
                                   :key="'city-'+option.id"
                                   v-model="formData.cities"
                                   :validation="false"
                                   :value="option.id"
                                   class="mb-8 me-8"
                                   name="cities"
                        >{{ option.title }}
                        </check-btn>
                        <check-btn v-model="formData.employment_types" :value="2" class="mb-8 me-8"
                                   name="employment_types">{{ __('Remotely') }}
                        </check-btn>
                        <div v-if="submitted && !isValidLocation" class="form-text text-danger">
                            {{ __('Please select at least one') }}
                        </div>
                    </chip-selector>
                    <vacancy-salary v-model:price-from="formData.price_from" v-model:price-to="formData.price_to"/>

                    <div id="short_description_section" class="mb-25 mw-840">
                        <div class="title-profile">{{ __('Short description') }}</div>
                        <div class="subtitle-profile mb-15">({{ __('not necessary') }})</div>
                        <div class="text-end">{{ formData.short_description.length }}\500</div>
                        <textarea id="short_description"
                                  v-model="formData.short_description"
                                  class="form-control"
                                  maxlength="500"
                                  name="short_description"
                                  rows="6"></textarea>
                    </div>
                    <div class="d-flex justify-content-between flex-column flex-lg-row mw-840 mb-40">
                        <checkbox v-model="formData.is_product" name="is_product">
                            <b>{{ __('We are a product company') }}</b>
                        </checkbox>
                        <checkbox v-model="formData.relocate" name="relocate">
                            <b>{{ __('Relocate to another country') }}</b>
                        </checkbox>
                        <checkbox v-model="formData.help_relocate" name="help_relocate">
                            <b>{{ __('We help with relocation') }}</b>
                        </checkbox>
                    </div>


                    <div id="description_section" class="mb-60 mw-840">
                        <div class="title-profile">{{ __('Vacancy description') }}</div>
                        <div class="subtitle-profile">
                            ({{ __('do not forget to include requirements, responsibilities and what you offer') }})
                        </div>

                        <Editor v-model="formData.description"
                                :api-key="editorKey"
                                :init="editorConfig"
                                rows="18"
                        ></Editor>
                        <input :value="formData.description" name="description" type="hidden">
                        <div v-if="submitted && formData.description.trim().length === 0" class="form-text text-danger">
                            Заполните описание
                        </div>
                    </div>

                    <div
                        class="d-flex flex-column flex-lg-row justify-content-between mb-50 mb-lg-100 mw-840 align-items-center wizard-btns-row">
                        <div>
                            <a class="btn btn-lg btn-link btn-preview ps-lg-0" href="#" @click.prevent="showPreview()">
                                <svg-icon class="me-5" icon="eye" size="25"/>
                                <span>{{ __('Preview') }}</span>
                            </a>
                        </div>
                        <div>
                            <button v-if="!vacancy.id" :disabled="anonymousCount >= 5 "
                                    class="btn btn-lg btn-outline-primary rounded-pill btn-save py-11 ps-20 pe-15"
                                    name="publish" type="submit"
                                    value="2">
                                <span>{{ __('Post anonymously') }}</span>
                                <bs-tooltip class="ms-15"
                                            placement="bottom"
                                            :title="__('The vacancy will not be displayed in the search, but you can send the candidate a link to the vacancy')"
                                ></bs-tooltip>
                            </button>

                            <button v-if="vacancy.id > 0" :value="vacancy.id > 0 ? vacancy.status : 0"
                                    class="btn btn-lg rounded-pill btn-primary ms-md-15 btn-publish"
                                    :class="vacancy.status !== 1 ? 'px-25' : 'px-35'"
                                    name="publish"
                                    type="submit">
                                <span>{{ __('Save') }}</span>
                            </button>

                            <button v-if="vacancy.status === 2"
                                    class="btn btn-lg btn-outline-primary rounded-pill ms-md-15 btn-save px-20"
                                    name="publish" type="submit"
                                    value="1">
                                <span>{{ __('Publish on site') }}</span>
                            </button>

                            <button v-if="vacancy.status !== 1" :value="1"
                                    class="btn btn-lg rounded-pill btn-primary ms-md-15 btn-publish px-25"
                                    name="publish"
                                    type="submit">
                                <span>{{ __(vacancy.id > 0 ? 'Save and publish' : 'Publish') }}</span>
                                <svg-icon class="ms-20" icon="arrow-right" size="15"/>
                            </button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
        <vacancy-preview v-if="preview"
                         :company="company"
                         :options="options"
                         :user="user"
                         :vacancy="formData"
                         @close="preview = false"
        />
    </div>
</template>

<script>
import {computed, nextTick, provide, reactive, ref} from "vue";
import SpecializationSelector from "../wizard/SpecializationSelector";
import TextFormGroup from "../form/TextFormGroup";
import ExperienceSelector from "../wizard/ExperienceSelector";
import EnglishLevelSelector from "../wizard/EnglishLevelSelector";
import ChipSelector from "../wizard/ChipSelector";
import SvgIcon from "../svg/SvgIcon";
import BsTooltip from "../bootstrap/BsTooltip";
import {Field, useForm} from "vee-validate";
import Checkbox from "../form/Checkbox";
import FormChips from "../form/FormChips";
import CheckBtn from "../form/CheckBtn";
import VacancyPreview from "./VacancyPreview";
import SpecializationSingleSelector from "../wizard/SpecializationSingleSelector";
import PopularSelector from "../wizard/PopularSelector";

import Editor from '@tinymce/tinymce-vue'
import {scrollToError} from "../wizard/useWizardErrors";
import {scrollTo} from "../../../utils/functions";
import VacancySalary from "./VacancySalary";

export default {
    name: "VacancyForm",
    components: {
        VacancySalary,
        PopularSelector,
        SpecializationSingleSelector,
        VacancyPreview,
        CheckBtn,
        FormChips,
        Checkbox,
        BsTooltip,
        SvgIcon,
        ChipSelector,
        Editor,
        EnglishLevelSelector,
        ExperienceSelector,
        TextFormGroup,
        SpecializationSelector
    },
    props: {
        action: String,
        pageTitle: String,
        vacancy: Object,
        user: Object,
        company: Object,
        options: Object,
        anonymousCount: {
            type: Number,
            default: 0,
        },
    },
    setup({vacancy, options}) {
        provide("WIZARD_OPTIONS", options);


        const formData = reactive({
            specializations: vacancy.specializations ? vacancy.specializations.map(c => c.id) : [],
            skills: vacancy.skills ? vacancy.skills.map(c => c.id) : [],
            title: vacancy.title || '',
            experience: vacancy.experience || 0,
            english_level: vacancy.english_level || 0,
            cities: vacancy.cities ? vacancy.cities.map(c => c.id) : [],
            price_from: vacancy.price_from || 0,
            price_to: vacancy.price_to || 100000,
            short_description: vacancy.short_description || '',
            description: vacancy.description || '',
            is_product: vacancy.is_product || 0,
            relocate: vacancy.relocate || 0,
            help_relocate: vacancy.help_relocate || 0,
            employment_types: vacancy.employment_types ? vacancy.employment_types.map(c => c.id) : [],
        });

        const submitted = ref(false);
        const isValidLocation = computed(() => formData.employment_types.indexOf(2) !== -1 || formData.cities.length > 0);


        const {submitForm, validate, errors} = useForm({
            validationSchema: {
                specializations: 'required',
                price_from: () => {
                    return formData.price_from >= 0 ? true : 'Поле обязательно для заполнения'
                },
                price_to: () => {
                    return formData.price_to >= 0 ? true : 'Поле обязательно для заполнения'
                },
                title: 'required',
                english_level: 'min_value:1',
                description: () => {
                    return formData.description.trim().length > 0 ? true : 'Заполните описание'
                },
            },
        });


        const onSubmit = async (event) => {
            const result = await validate();
            if (result.valid && isValidLocation.value) {
                await submitForm();
            } else {
                submitted.value = true;
                event.preventDefault();
                if (Object.keys(errors.value).length > 0) {
                    const first_error = Object.keys(errors.value)[0];
                    scrollTo('#' + first_error + '_section', -20);
                } else {
                    scrollTo('#location_section', -20);
                }

            }
        }


        const cities = options.cities.filter(c => c.popular === 0);
        const popularCities = options.cities.filter(c => c.popular === 1);

        const preview = ref(false);

        const isValid = computed(() => {
            return isValidLocation.value &&
                formData.specializations.length &&
                formData.price_from >= 0 &&
                formData.price_to > 0 &&
                formData.price_to >= formData.price_from &&
                formData.title.length > 0 &&
                formData.description.length > 0;
        })

        const editorKey = ref(process.env.MIX_TINYMCE_KEY);

        const showPreview = () => {
            preview.value = true;
            scrollTo('.page-header')
        }


        const editorConfig = {
            menubar: false,
            inline: false,
            branding: false,
            elementpath: false,
            valid_elements: 'p[class],span[class],div[class],b[class],strong[class],i[class],em[class],ol[class],ul[class],li[class],br',
            invalid_elements: 'a,h1,h2,h3,h4,h5,h6,img',
            invalid_styles: 'color font-size font-family background',
            formats: {
                // Changes the default format for h1 to have a class of heading
                h1: {block: 'div', classes: 'h1'},
                h2: {block: 'div', classes: 'h2'},
                h3: {block: 'div', classes: 'h3'},
                h4: {block: 'div', classes: 'h4'},
                h5: {block: 'div', classes: 'h5'},
            },
            // statusbar: false,
            content_style: 'body {font-size: 16px; font-family: Roboto, sans-serif; line-height: 24px;}',
            fontsize_formats: '16px',
            fontsize: '16px',
            fontname: 'Roboto, sans-serif',
            valid_styles: 'text-align,font-weight,font-style,text-decoration',
            plugins: 'lists link emoticons paste',
            toolbar: 'bold italic | bullist numlist',
        }
        return {
            editorConfig,
            formData,
            preview,
            cities,
            popularCities,
            errors,
            isValid,
            isValidLocation,
            submitted,
            submitForm,
            onSubmit,
            showPreview,
            editorKey,
        }
    }
}
</script>

<style scoped>

</style>
