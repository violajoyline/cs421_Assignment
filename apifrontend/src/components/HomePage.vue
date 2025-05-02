<script setup>
import { ref } from 'vue'





</script>

<template>
 <div class="container  h-[100vh] flex flex-col  ">
  <div class="flex flex-col items-center">
    <div class="text-center"><span class="text-8xl text-blue-600">WELCOME!</span></div>
    
    <br>
    <div class="flex w-1/3 text-justify">
    <span>Click the <mark class="bg-blue-200">Students</mark> button to see the list of students and their courses. 
          Click the <mark class="bg-blue-200">Courses</mark> button to see the list of courses for each year for the Software Engineering program</span>
    </div>      
  </div>
  <div class="p-6 flex flex-row justify-center space-x-10">
    <button class="w-48 h-8 bg-blue-600 rounded-2xl text-white">Students</button>
    <button class="w-48 h-8 bg-blue-600 rounded-2xl text-white">Courses</button>
  </div>
 </div>
</template>

<style scoped> 
.container {
  width: 100vw;
  height: 100vh;
  background: #f1f1f1;
  background-image: linear-gradient(
      90deg,
      transparent 50px,
      #ffb4b8 50px,
      #ffb4b8 52px,
      transparent 52px
    ),
    linear-gradient(#e1e1e1 0.1em, transparent 0.1em);
  background-size: 100% 25px;
}

</style>
