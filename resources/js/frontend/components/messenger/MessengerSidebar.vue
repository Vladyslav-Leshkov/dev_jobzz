<template>
    <div class="msgr-sidebar">
        <messenger-sb-actions />
        <messenger-contact-list />
    </div>
</template>

<script>

import MessengerSbActions from "./MessengerSbActions";
import MessengerContactList from "./MessengerContactList";
export default {
    name: "MessengerSidebar",
    components: {
        MessengerContactList,
        MessengerSbActions
    },
}
</script>

<style scoped>

</style>
