import web3 from '@/web3'
import ipfsx from '@/ipfsx' 

const state = {
   login : false,
   walletAddress : null,
   imgeHashes : [],
   registered : true
  };

  const getters = {
    login:(state) => { return state.login },
    walletAddress:(state) => { return state.walletAddress },
    imgeHashes:(state) => { return state.imgeHashes },
    registered:(state) => { return state.registered }
  };
  
  const actions = {
    
    loginUser: async (contex ) =>{
      let res = await ipfsx.methods.loginUser().call({ from : state.walletAddress })
      if(res == true){
        contex.commit('setLogin' , res)
      }else if(res == false){
        contex.commit('seRegistration' , res)
      }
      
    },
    logoutUser : (contex) =>{
      let res = false
      contex.commit('setLogin' , res)
    },

    registerUser : async () =>{
      await ipfsx.methods.registerUser().send({ from : state.walletAddress })
      state.registered = true
    },

    getWalletAddress: async (contex) =>{
      
      let address =  (await web3.eth.getAccounts())[0] 
      contex.commit('setWalletAddress' , address );
    },

    getImageHashes : async (contex ) =>{
      if(state.imgeHashes.length == 0 ){
        let hashes = await ipfsx.methods.getImageHashes().call({ from : state.walletAddress }) 
        contex.commit('setHashes' , hashes);
      }
    } ,

    storeImage : async(contex, hash) =>{
      await ipfsx.methods.setImageHash(hash).send({ from : state.walletAddress })
      contex.commit('pushImageHash' , hash)
    }

  };
  
  const mutations = { 
    setWalletAddress: (state , address) =>{
      state.walletAddress = address;
    } ,
    setLogin :(state , res) =>{
      state.login = res;
    },
    seRegistration :( state , res ) =>{
      state.registered = res
    } ,
    setHashes :(state , hashes) =>{
      hashes.forEach(element => {
        state.imgeHashes.push(element)
      }); 
    },
    pushImageHash :(state , hash) =>{
      state.imgeHashes.push(hash)
    }
    
  };

  export default{
    state,
    getters,
    actions,
    mutations
}