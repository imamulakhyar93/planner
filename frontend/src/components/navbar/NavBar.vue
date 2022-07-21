<template>
  <header class="z-10 bg-white shadow-md dark:bg-gray-800 w-full h-12 fixed">
    <div class="container flex px-4 items-center justify-between mx-auto">
      <!-- LOGO -->
      <div class="flex text-center">
        <div class="font-bold mr-2">Project Logo</div>
        <div>{{ selectedProject }}</div>
      </div>
      <!-- Menus -->
      <div class="flex mx-auto font-bold">
        <div
          class="px-3 cursor-pointer hover:text-purple-500 flex items-center"
          v-for="menu in menus"
          :key="menu.text"
        >
          <component class="mr-2 h-5 w-5" :is="menu.icon" />
          {{ menu.text }}
        </div>
      </div>
      <!-- User account -->
      <Menu as="div" class="relative">
        <MenuButton class="inline-flex items-center rounded-md h-12">
          <img
            class="object-cover w-8 h-8 rounded-full"
            src="https://images.unsplash.com/photo-1502378735452-bc7d86632805?ixlib=rb-0.3.5&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=200&fit=max&s=aa3a807e1bbdfd4364d1f449eaa96d82"
          />
          <ChevronDownIcon
            class="ml-2 h-5 w-5 transition duration-300 ease-in-out"
          />
        </MenuButton>
        <SlideDown>
          <MenuItems
            class="absolute right-0 mt-2 w-56 origin-top-right divide-y divide-gray-100 rounded-md bg-white shadow-lg ring-1 ring-black ring-opacity-5 focus:outline-none"
          >
            <div class="p-1.5">
              <DropdownMenuItem>
                <UserIcon class="mr-2 h-4 w-4" aria-hidden="true" />
                Account
              </DropdownMenuItem>
            </div>

            <div class="p-1.5">
              <DropdownMenuItem>
                <LogoutIcon class="mr-2 h-4 w-4" aria-hidden="true" />
                Logout
              </DropdownMenuItem>
            </div>
          </MenuItems>
        </SlideDown>
      </Menu>
    </div>
  </header>
</template>

<script setup>
import { useStore } from "vuex";
import SlideDown from "../transitions/SlideDown.vue";
import DropdownMenuItem from "../dropdown/DropdownMenuItem.vue";
import { Menu, MenuButton, MenuItems } from "@headlessui/vue";
import { ChevronDownIcon } from "@heroicons/vue/solid";
import {
  LogoutIcon,
  UserIcon,
  HomeIcon,
  ClipboardListIcon,
  CalendarIcon,
  DocumentTextIcon,
} from "@heroicons/vue/outline";
import { computed } from "vue";

const menus = [
  {
    text: "Home",
    icon: HomeIcon,
  },
  {
    text: "Todos",
    icon: ClipboardListIcon,
  },
  {
    text: "Calendar",
    icon: CalendarIcon,
  },
  {
    text: "Notes",
    icon: DocumentTextIcon,
  },
];
const store = useStore();
const selectedProject = computed(() => store.state.project.selected);
</script>
