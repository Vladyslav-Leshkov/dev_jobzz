<template>
    <div class="mb-60" id="position_section">
        <div class="title-profile">{{ __('Position') }}</div>
        <div class="subtitle-profile">({{ __('candidate.position-note') }})</div>
        <text-form-group class="mw-420"
                         v-model.trim="innerValue"
                         :label="__('Enter position')"
                         name="position"
                         floating
                         rules="required"
                         placeholder=" "/>
    </div>
</template>

<script>
import TextFormGroup from "../form/TextFormGroup";
import {useVModel} from "../../../composables/useVModel";

export default {
    name: "PositionSelector",
    components: {TextFormGroup},
    props: {
        modelValue: {
            type: String,
            default: ''
        }
    },
    emits: ['update:modelValue'],
    setup(props) {
        const innerValue = useVModel(props, 'modelValue');
        return {
            innerValue,
        }
    }
}
</script>

<style scoped>

</style>
