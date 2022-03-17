<template>
  <div v-click-outside="close" class="typeahead">
    <input v-model="searchText"
           :class="inputClass"
           :placeholder="placeholder"
           type="text"
           @focus="open"
           @keypress.enter="onEnter"
    >
    <div v-if="opened" class="list-group">
      <a v-for="item in filteredItems" :key="'chip-typeahead-item'"
         class="list-group-item list-group-item-action"
         href="#"
         @click.prevent="select(item)">{{ item.title }}</a>
    </div>
  </div>
</template>

<script>
import {computed, ref} from 'vue';
import {useDropdown} from "./useDropdown";

export default {
  name: "Typeahead",
  props: {
    placeholder: {
      type: String,
      default: ''
    },
    options: {
      type: Array,
      default() {
        return []
      }
    },
    inputClass: {
      type: String,
      default: 'form-control form-control-search'
    },
    allowCustom: {
      type: Boolean,
      default: false,
    }
  },
  emits: ['select', 'custom'],
  setup(props, {emit}) {
    const searchText = ref('');

    const {opened, open, close} = useDropdown();

    const filteredItems = computed(() => {
      if (searchText.value.length) {
        return props.options.filter(o => o.title.toLowerCase().includes(searchText.value.toLowerCase()));
      }
      return [];
    })

    const select = (item) => {
      opened.value = false;
      searchText.value = '';
      emit('select', item);
    }

    const onEnter = () => {
      const text = searchText.value.trim();
      opened.value = false;
      searchText.value = '';
      if (text.length > 0) {
        let item = props.options.find(it => it.title_ru.toLowerCase() === text.toLowerCase() || it.title_en.toLowerCase() === text.toLowerCase());
        if (!item && props.allowCustom) {
          item = {title: text, id: Date.now(), custom: 1}
        }
        
        if (item) {
          emit('select', item);
        }

      }

    }

    return {
      open,
      close,
      opened,
      searchText,
      filteredItems,
      select,
      onEnter,
    }
  }
}
</script>

<style scoped>

</style>
