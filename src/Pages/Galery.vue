<template>
  <v-container class="d-flex justify-center ">
    <v-card  flat tile >
      <v-row v-if="image != null" class="mt-5 mb-5 d-flex justify-center ">
        <v-img contain lazy-src="https://picsum.photos/id/11/10/6"
              max-height="219"
              max-width="458"
              :src="'https:ipfs.infura.io/ipfs/'+image" 
        ></v-img> 
       
      </v-row>
      <v-row class="mt-5 mb-5 d-flex justify-center ">
        <div v-for="(  imageHash , index ) in imageHashes" :key="index"  class="mx-3">
          <v-img  contain lazy-src="https://picsum.photos/id/11/10/6"
                max-height="50"
                max-width="50"
                :src="'https:ipfs.infura.io/ipfs/'+imageHash"
                @click="changeImage(imageHash)" 
          ></v-img> 
        </div>
      </v-row>
      <v-row>
        <v-col cols="8">
          <v-file-input counter multiple show-size truncate-length="9" 
          @change="onChange($event)" ></v-file-input>
        </v-col>
        <v-col cols="4">
          <div v-show="buffer != null">
            <v-btn v-if="uploading == false" depressed color="primary" small class="mt-4 ml-5" @click="onSubmit" > Upload Image </v-btn>
            <v-btn v-if="uploading == true" disabled depressed color="primary" small class="mt-4 ml-5" @click="onSubmit" > Uploading... </v-btn>
          </div>
        </v-col>
      </v-row>
    </v-card>
  </v-container>
</template>

<script>
const ipfsClient = require('ipfs-http-client')
const _ipfs = ipfsClient({ host: 'ipfs.infura.io', port: 5001, protocol: 'https' })

  export default {
    name: 'Galery',

    data: () => ({ 
      image:null,
      buffer : null,
      imageIndex:null,
      uploading : false
    }),
    methods:{
      onChange(File) { 
        this.buffer = null
        if(typeof File[0] !== 'undefined'){
          const file = File[0]
          const reader = new window.FileReader()
          reader.readAsArrayBuffer(file)
          reader.onloadend = () => {
              this.buffer = Buffer(reader.result) 
          }
        }
      },

      onSubmit(){
        console.log("submitting Data");
        this.uploading = true
        _ipfs.add(this.buffer ,async (error , result) =>{
          if(error){
            console.error(error)
            return
          }
          this.image = result[0].path
          this.buffer = null
            
          this.$store.dispatch('storeImage' , result[0].path)
      
          this.uploading  = false
        })
        
      },

      changeImage(_imageHash){
        this.image = _imageHash
      }
    },
    async mounted(){
      this.$store.dispatch('getImageHashes')  
    },
    computed: {
      imageHashes(){ return this.$store.getters.imgeHashes }
    },
  }
</script>
