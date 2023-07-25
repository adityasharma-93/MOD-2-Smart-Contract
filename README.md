# Starter Hardhat Project

After cloning the github, you will want to do the following to get the code running on your computer.

1. Inside the project directory, in the terminal type: npm i
2. Open two additional terminals in your VS code
3. In the second terminal type: npx hardhat node
4. In the third terminal, type: npx hardhat run --network localhost scripts/deploy.js
5. Back in the first terminal, type npm run dev to launch the front-end.

After this, the project will be running on your localhost. 
Typically at http://localhost:3000/


The code you provided is a React component named "HomePage" that interacts with an Ethereum smart contract called "Assessment" deployed at a specific contract address. The component allows users to connect their Ethereum wallets (specifically, MetaMask) to the application, view their account balance, and perform deposit and withdrawal operations using the smart contract.

Here's a brief explanation of the component's functionality:

1. State Variables:
   - `ethWallet`: Represents the MetaMask wallet object.
   - `account`: Holds the connected Ethereum account address.
   - `atm`: Represents the Ethereum smart contract instance.
   - `balance`: Holds the user's balance fetched from the smart contract.

2. Contract Address and ABI:
   - `contractAddress`: The address where the smart contract is deployed on the Ethereum network.
   - `atmABI`: The ABI (Application Binary Interface) of the smart contract, required to interact with the contract methods.

3. `getWallet` function:
   - This function checks if MetaMask is available and sets the `ethWallet` state variable.
   - If `ethWallet` is available, it fetches the connected Ethereum account and calls `handleAccount` to update the `account` state variable.

4. `handleAccount` function:
   - Updates the `account` state variable with the connected Ethereum account.
   - If there is no connected account, it logs "No account found."

5. `connectAccount` function:
   - Checks if MetaMask is available and prompts the user to install it if not.
   - Requests account access from MetaMask and updates the `account` state variable.
   - Calls `getATMContract` to get a reference to the deployed smart contract.

6. `getATMContract` function:
   - Creates a provider and signer using the `ethWallet`.
   - Initializes the `atmContract` instance with the contract address and ABI.
   - Updates the `atm` state variable with the contract instance.

7. `getBalance` function:
   - If `atm` is available, it fetches the user's balance from the smart contract and updates the `balance` state variable.

8. `deposit` and `withdraw` functions:
   - If `atm` is available, they trigger the respective methods (`deposit` and `withdraw`) on the smart contract and update the user's balance by calling `getBalance` afterward.

9. `initUser` function:
   - Renders different content based on the user's wallet connection status and balance.
   - If MetaMask is not installed, it prompts the user to install it.
   - If the user's account is not connected, it provides a button to connect the account.
   - If the user's balance is not fetched yet, it fetches the balance.
   - If everything is set up, it displays the user's account address, balance, and buttons to deposit and withdraw.

10. `useEffect` hook:
   - Calls `getWallet` function when the component mounts to check for MetaMask and fetch the connected account.

The component is designed to work with MetaMask to interact with the Ethereum smart contract. When the user connects their wallet, they can view their account balance and perform deposit and withdrawal operations by clicking the respective buttons.

It's important to note that this code assumes the presence of the required dependencies (e.g., React, ethers.js) and the successful deployment of the "Assessment" smart contract at the specified contract address.
