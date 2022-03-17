
import {ref} from 'vue';

export const useDropdown = () => {
    const opened = ref(false);

    const open = () => {
        opened.value = true;
    }

    const close = () => {
        opened.value = false;
    }

    const toggle = () => {
        opened.value = !opened.value;
    }

    return {
        opened,
        open,
        close,
        toggle,
    }
}
