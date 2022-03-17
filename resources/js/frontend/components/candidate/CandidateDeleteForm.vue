<template>
    <form ref="formRef" :action='action' @submit="onSubmit">

        <slot/>
        <input name="confirm" type="hidden" value="1">
        <bs-modal :close-btn="true" :opened="modalOpened" @bs-hide="modalOpened = false">
            <div class="modal-body">
                <div class="font-18 text-center fw-600 mb-20">{{ __('Did our resource help you find a job?') }}</div>
                <a :class="{disabled: request}"
                   :href="redirectUrl"
                   class="btn btn-primary d-block w-100 mb-20"
                   @click.prevent="answerYes()">{{ __('Yes, I found a job at Jobzz.ru') }}</a>
                <button :disabled="request"
                        class="btn btn-outline-secondary w-100 d-block"
                        @click.prevent="answerNo()">{{ __('No, didn\'t help') }}
                </button>
            </div>
        </bs-modal>
    </form>
</template>

<script>
import BsModal from "../bootstrap/BsModal";
import {ref} from "vue";

export default {
    name: "CandidateDeleteForm",
    components: {BsModal},
    props: {
        action: String,
        redirectUrl: String,
        ask: Boolean

    },
    setup(props) {
        const modalOpened = ref(false);
        const request = ref(false);
        const answer = ref('');
        const formRef = ref(null);

        const onSubmit = async (event) => {
            if (props.ask && answer.value === '') {
                event.preventDefault();
                modalOpened.value = true;
            }
        }

        const answerNo = () => {
            request.value = true;
            answer.value = 'no';
            formRef.value.submit();
        }

        const answerYes = () => {
            request.value = true;
            answer.value = 'yes';
            document.location.href = props.redirectUrl;
        }

        
        return {
            formRef,
            modalOpened,
            request,
            answer,
            onSubmit,
            answerYes,
            answerNo,
        }
    }
}
</script>

<style scoped>

</style>