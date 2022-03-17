<template>
    <div class="push-question-item">
        <div class="container">
            <div class="push-question-content">
                <div v-html="item.question" class="push-question-ask"></div>
                <div v-if="item.type === 'vacancy-candidate' && !submitted" class="push-question-actions">
                    <a href="#" @click.prevent="answerAction('yes')">{{ __('Yes, I will work for this company') }}</a>
                    <a href="#" @click.prevent="answerAction('still')">{{ __('We still communicate') }}</a>
                    <a href="#" @click.prevent="answerAction('no')">{{ __('No, I was not hired') }}</a>
                </div>
                <div v-if="item.type === 'vacancy-recruiter' && !submitted" class="push-question-actions">
                    <a href="#" @click.prevent="answerAction('yes')">{{ __('Yes, we hired a candidate') }}</a>
                    <a href="#" @click.prevent="answerAction('still')">{{ __('We are still looking for') }}</a>
                    <a href="#" @click.prevent="answerAction('no')">{{ __('No, we did not make new hires') }}</a>
                </div>
                <div v-if="item.type === 'acquaintance' && !submitted" class="push-question-actions">
                    <a href="#" @click.prevent="answerAction('yes')">{{ __('Yes, I found a job') }}</a>
                    <a href="#" @click.prevent="answerAction('no')">{{ __('Not yet') }}</a>
                </div>
                <div v-if="submitted" class="push-question-actions">
                    <span>{{ __('Thank you for your answer!') }}</span>
                </div>
                <a v-if="closeButton" class="push-question-close" href="#" @click.prevent="close()">
                    <svg-icon icon="close-black"/>
                </a>
            </div>

        </div>

    </div>


</template>

<script>
import SvgIcon from "../svg/SvgIcon";
import {axiosPost} from "../../services/api";
import {ref} from "vue";

export default {
    name: "PushQuestion",
    components: {SvgIcon},
    props: {
        item: {
            type: Object,
            default() {
                return {
                    question: '',
                    type: '',
                    action: {
                        recruiter_id: 0,
                        vacancy_id: 0,
                    },
                }
            }
        },
        closeButton: Boolean
    },
    emits: ['close'],
    setup(props, {emit}) {
        const submitted = ref(false);

        const answerAction = async (answer) => {
            const response = await axiosPost('/api/push-questions/' + props.item.id, {answer: answer});
            if (response.message) {
                toast.show({
                    type: response.result,
                    message: response.message,
                })
            }
            emit('close', props.item);
            if (response.redirect_url) {
                document.location.href = response.redirect_url;
            }
        }

        const close = () => {
            emit('close', props.item);
        }

        return {
            submitted,
            answerAction,
            close,
        }
    }
}
</script>

<style scoped>

</style>
