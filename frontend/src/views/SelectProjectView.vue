<template>
  <div class="w-full">
    <div class="p-5 w-full h-full">
      <Title class="text-center mb-4">Select or create a project</Title>
      <div class="flex flex-wrap text-sm">
        <router-link
          v-for="project in projects"
          :key="project"
          :to="`/projects/${project}`"
        >
          <div
            class="h-48 w-48 mr-2 mb-2 bg-white flex flex-col flex-wrap items-center p-1.5 text-center justify-center hover:outline outline-2 outline-gray-500 rounded-lg cursor-pointer"
          >
            <div class="font-bold mb-2">{{ project }}</div>
            <img
              class="object-cover w-14 h-14 rounded-full"
              src="https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82"
            />
          </div>
        </router-link>
        <div
          class="h-48 w-48 mr-2 mb-2 flex flex-col flex-wrap items-center p-1.5 text-center justify-center border-2 text-gray-400 hover:text-gray-500 border-gray-300 hover:border-gray-500 rounded-lg cursor-pointer"
        >
          <div class="font-bold">New project</div>
          <PlusIcon class="h-5 w-5 mt-1 t" />
        </div>
      </div>
    </div>
  </div>
</template>

<script setup>
import { PlusIcon } from "@heroicons/vue/solid";
import Title from "@/components/text/Title.vue";
const projects = [
  "Quipper",
  "Personal",
  "Austin",
  "Mekari",
  "TokyoSpace",
  "Pesona",
  "Badarawuh",
  "Sony",
  "Mentari",
];
</script>
