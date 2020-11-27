<template>
  <v-container class="d-flex justify-center ">
    <v-row>
        <v-col cols="12" > 
          <h2>Upload Images to IPFS *AND* Store in Smart Contract</h2>
        </v-col>
      </v-row>
    <v-row>
        <v-col cols="12">
            <v-btn  class="purple white--text ml-5" @click="loginUser" v-if="login == false && registered == true" > Click to login </v-btn>
            <v-btn  class="purple white--text ml-5" @click="logoutUser" v-if="login == true "> Click to logout </v-btn>
            <v-btn  class="purple white--text ml-5" v-if="registered == false" @click="registerUser" > Register Now  </v-btn>
       
        </v-col>
    </v-row>
  </v-container>
</template>

<script>

  export default {
    name: 'MainPage',
    methods:{
      async loginUser(){
         await this.$store.dispatch('loginUser')
      },
      logoutUser(){
         this.$store.dispatch('logoutUser')
      },
      async registerUser(){
       
         await this.$store.dispatch('registerUser')
          await this.loginUser()
          
      }
    },
    computed: {
      login(){ return this.$store.getters.login },
      registered(){ return this.$store.getters.registered }
    },
  }
</script>
