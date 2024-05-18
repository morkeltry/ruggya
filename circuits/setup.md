```
circom state_transition.circom --r1cs --wasm --sym --c
node state_transition_js/generate_witness.js state_transition_js/state_transition.wasm inputState.json out/witness0.wtns
```


```
snarkjs powersoftau new bn128 12 setup/pot12_0000.ptau -v
snarkjs powersoftau contribute setup/pot12_0000.ptau setup/pot12_0001.ptau --name="First contribution" 
snarkjs powersoftau prepare phase2 setup/pot12_0001.ptau setup/pot12_final.ptau -v
snarkjs groth16 setup state_transition.r1cs setup/pot12_final.ptau setup/state_transition_0000.zkey
snarkjs zkey contribute setup/state_transition_0000.zkey setup/state_transition_0001.zkey  --name="1st Contributor Name" -v
snarkjs zkey export verificationkey setup/state_transition_0001.zkey out/verification_key.json
```

```
snarkjs groth16 prove out/state_transition_0001.zkey out/witness0.wtns out/proof0.json out/public0.json
snarkjs groth16 verify setup/verification_key.json public.json proof.json
snarkjs zkey export solidityverifier setup/state_transition_0001.zkey verifier.sol

```
