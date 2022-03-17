<template>
    <div>
        <button class="btn btn-danger btn-close"
                :title="__('Close vacancy')"
                @click.prevent="opened = true">
            <svg-icon class="me-10" icon="times-red"/>
            <span>{{ __('Close vacancy') }}</span>
        </button>

        <bs-modal :close-btn="true" :opened="opened" @bs-hide="opened = false">
            <div class="modal-body">
                <div class="font-18 text-center fw-600 mb-20">
                    {{ __('Did our resource help to close the vacancy?') }}
                </div>
                <a :class="{disabled: request}" :href="`/profile/vacancy/${vacancy.slug}/candidates`"
                   class="btn btn-primary d-block w-100 mb-20">
                    {{ __('Yes, we found a candidate on this resource') }}
                </a>
                <button :disabled="request"
                        class="btn btn-outline-secondary w-100 d-block"
                        @click.prevent="answerNo()">
                    {{ __('No, didn\'t help') }}
                </button>
            </div>
        </bs-modal>
    </div>
</template>

<script>
import SvgIcon from "../svg/SvgIcon";
import BsModal from "../bootstrap/BsModal";
import {ref} from "vue";
import {axiosPatch} from "../../services/api";

export default {
    name: "VacancyCloseBtn",
    components: {BsModal, SvgIcon},
    props: {
        vacancy: Object,
    },
    setup({vacancy}) {
        const opened = ref(false);
        const request = ref(false);


        const answerNo = async () => {
            request.value = true;
            const response = await axiosPatch(`/profile/vacancy/${vacancy.slug}/close`);
            if (response.result === 'success') {
                opened.value = false;
                toast.success(response.message);
                document.location.reload();
            } else {
                request.value = false;
            }

        }

        return {
            opened,
            request,
            answerNo,
        }
    }
}
</script>

<style scoped>

</style>
