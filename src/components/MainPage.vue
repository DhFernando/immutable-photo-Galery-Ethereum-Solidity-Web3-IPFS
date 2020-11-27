<template>
  <v-container class="d-flex justify-center ">
      <v-row>
        <v-col cols="12">
          <v-row>
            <v-col cols="12">
                <Home />
            </v-col>
          </v-row>
          <v-row>
            <v-col cols="12">
               <Galery />
            </v-col>
          </v-row>
        </v-col>
      </v-row>
  </v-container>
</template>

<script>

import Home from '@/Pages/Home'
import Galery from '@/Pages/Galery'

  export default {
    name: 'MainPage',

    components:{
      Galery,
      Home
    },

    data: () => ({ 
     
    }),
    methods:{
      
    },
    async mounted(){

     
    }
  }
</script>
