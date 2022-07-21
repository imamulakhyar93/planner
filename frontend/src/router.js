import { createRouter, createWebHistory } from "vue-router";
import HomeView from "./views/HomeView.vue";
import SelectProjectView from "./views/SelectProjectView.vue";

const router = createRouter({
  history: createWebHistory(),
  routes: [
    {
      path: "/",
      component: SelectProjectView,
    },
    {
      path: "/projects/:id",
      component: HomeView,
    },
  ],
});

export { router };
