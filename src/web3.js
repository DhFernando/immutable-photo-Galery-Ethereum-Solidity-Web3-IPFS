 
import Web3 from 'web3'

const provider = new Web3.providers.HttpProvider('http://localhost:7545')


const web3 = new Web3(window.ethereum || provider)
    window.ethereum.enable().catch(error => {
        // User denied account access
        console.log(error)
    })
    
export default web3 