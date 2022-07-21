<template>
  <transition
    enter-active-class="transition duration-150 ease-out"
    leave-active-class="transition duration-150 ease-in"
    enter-from-class="-translate-y-2 opacity-0"
    enter-to-class="translate-y-0 opacity-100"
    leave-from-class="translate-y-0 opacity-100"
    leave-to-class="-translate-y-2 opacity-0"
  >
    <slot />
  </transition>
</template>
