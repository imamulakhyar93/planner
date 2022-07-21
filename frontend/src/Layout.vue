<template>
  <div class="bg-gray-50">
    <Navbar v-show="selectedProject" />
    <div class="container min-h-screen h-screen mx-auto pt-12">
      <router-view></router-view>
    </div>
  </div>
</template>

<script setup>
import Navbar from "./components/navbar/NavBar.vue";
import { useStore } from "vuex";
import { computed } from "vue";
const store = useStore();
const selectedProject = computed(() => store.state.project.selected);
</script>

<style>
html {
  background-color: rgb(249 250 251);
}
</style>
