<template>
  <div class="h-full w-full p-5">
    <Title class="text-center mb-4">Todos</Title>
    <div class="flex">
      <div
        v-for="week in weeks"
        :key="week.med"
        class="h-10 w-16 text-center border-b border-gray-400"
      >
        {{ week.medium }}
      </div>
    </div>
    <div
      v-for="(week, i) in currentDays.value"
      :key="`week-${i}`"
      class="flex select-none text-sm"
    >
      <div
        v-for="(day, j) in week"
        :key="`day-${j}`"
        class="h-16 w-16 flex items-center justify-center cursor-pointer"
        :class="getClass(day)"
      >
        {{ day.date }}
      </div>
    </div>
  </div>
</template>

<script setup>
import { computed, ref, watchEffect } from "vue";
import { useRoute } from "vue-router";
import calendar from "calendar-dates";
import { useStore } from "vuex";
import Title from "../components/text/Title.vue";

const store = useStore();
const route = useRoute();
const calendarDates = new calendar();
const selectProject = () => {
  const id = route.params.id;
  store.dispatch("project/setSelected", id);
};

const today = new Date();
const todayDate = today.getDate();
const daysRef = ref([]);
const currentDays = computed(() => daysRef);
const weeks = [
  {
    long: "Sunday",
    medium: "Sun",
    short: "S",
  },
  {
    long: "Monday",
    medium: "Mon",
    short: "M",
  },
  {
    long: "Tuesday",
    medium: "Tue",
    short: "T",
  },
  {
    long: "Wednesday",
    medium: "Wed",
    short: "W",
  },
  {
    long: "Thursday",
    medium: "Thu",
    short: "T",
  },
  {
    long: "Friday",
    medium: "Fri",
    short: "F",
  },
  {
    long: "Saturday",
    medium: "Sat",
    short: "S",
  },
];
const getClass = (day) => {
  let classes =
    day.date === todayDate ? "bg-blue-300 font-bold" : "hover:bg-gray-300";
  if (day.type !== "current") {
    classes += " opacity-40 bg-gray-200";
  }
  return classes;
};

watchEffect(async () => {
  selectProject();
  const days = await calendarDates.getMatrix(today);
  daysRef.value = days.slice(0, days.length - 1);
});
</script>
