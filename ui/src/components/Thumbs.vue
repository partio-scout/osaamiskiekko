<script setup lang="ts">
import { tr } from "../composables/internationalization";
import { ref } from "vue";
import useApiStore from "../store/api";

const apiStore = useApiStore();

const thumbUp = ref({ color: "white", clicked: false });
const thumbDown = ref({ color: "white", clicked: false });

const props = defineProps({
  degreeId: { type: String, required: true },
  skillId: { type: String, required: true },
  feedbackType: { type: String, required: true }
});

const sendFeedback = (apiMethod: Function, degreeId: string, skillId: string, feedback: number) => {
  if (thumbUp.value.clicked || thumbDown.value.clicked) return;
  apiMethod(degreeId, skillId, feedback);
  if (feedback === 1) {
    thumbUp.value.color = "blue";
    thumbUp.value.clicked = true;
  } else {
    thumbDown.value.color = "blue";
    thumbDown.value.clicked = true;
  }
};
</script>

<template>
  <div class="mt-10 mt-sm-10">
    <div class="text-sm-h6 poppins-white">{{ tr("RATE_THIS_MATCH") }}!</div>
    <div class="text-sm-h6 dm-sans">
      {{ tr("HELP_THE_ALGORITHM") }}?
      <v-icon
        alt="{{ tr('THUMB_UP') }}"
        @click="
          sendFeedback(
            props.feedbackType === 'degree'
              ? apiStore.sendFeedbackDegree
              : apiStore.sendFeedbackSkill,
            props.degreeId,
            props.skillId,
            1
          )
        "
        :color="thumbUp.color"
        size="x-large"
        :style="{
          cursor: thumbUp.clicked || thumbDown.clicked ? 'default' : 'pointer'
        }"
        class="ml-sm-5 mt-5 mt-sm-0"
        >thumb_up</v-icon
      >
      <v-icon
        alt="{{ tr('THUMB_DOWN') }}"
        @click="
          sendFeedback(
            props.feedbackType === 'degree'
              ? apiStore.sendFeedbackDegree
              : apiStore.sendFeedbackSkill,
            props.degreeId,
            props.skillId,
            -1
          )
        "
        :color="thumbDown.color"
        size="x-large"
        :style="{
          cursor: thumbUp.clicked || thumbDown.clicked ? 'default' : 'pointer'
        }"
        class="ml-5 mt-5 mt-sm-0"
        >thumb_down</v-icon
      >
    </div>
  </div>
</template>

<style scoped>
@import url("../assets/styles.css");
</style>
