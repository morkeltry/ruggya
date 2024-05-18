// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract Groth16Verifier {
    // Scalar field size
    uint256 constant r    = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q   = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax  = 4725293584568908397952288702556297432697642946712404617205755475946877481967;
    uint256 constant alphay  = 8227452693334494569491658600186891592775882683827864082696630177311538181272;
    uint256 constant betax1  = 3494594519911171268062806016309224932153703884285405389844477577030345431127;
    uint256 constant betax2  = 21848218995410515527810602247248905873416643965390054843472564921332169755576;
    uint256 constant betay1  = 8238459557867313819560296117150251986054925511714202929897760334273543553274;
    uint256 constant betay2  = 2415987727017616973063680069201762711232469663087211089087838431786006012957;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 7454826753015222031416911705348001474146666279689606526136637293981143925709;
    uint256 constant deltax2 = 20851460588376651683130583291221067104355079484702862984144059931163495966281;
    uint256 constant deltay1 = 2681858549237448541463553516716141386207506517254407252259068532790767438151;
    uint256 constant deltay2 = 19467976622895992208105441270213634542313277449487483951844651010552242539182;

    
    uint256 constant IC0x = 17839271322330174084467137083957037392393721317330432512231497209391075505728;
    uint256 constant IC0y = 20553311964583056963718407635051849462003887588502632957748453671478256229892;
    
    uint256 constant IC1x = 19420100503285852218849688327709834871756556213833246129960848336902687443037;
    uint256 constant IC1y = 19111316873550881650837342105913599783439871893340907728921468753964780043992;
    
    uint256 constant IC2x = 21223482706283270058872594175804031598533065627597088087424316184628139803069;
    uint256 constant IC2y = 9889205888853145717122081146505243860936774136588074798700314762152001379618;
    
    uint256 constant IC3x = 10429010542803757754914142621337382513305152084282207111176876114513112673651;
    uint256 constant IC3y = 15145188258524256925879630013367915318994161564612964844054450654793527011568;
    
    uint256 constant IC4x = 13349053544398745138853270285147119829921552517204412838275849107177115921515;
    uint256 constant IC4y = 20655607164771134665602770592411530065741429226404685166492024937455256047312;
    
    uint256 constant IC5x = 19244663706954906745129347240492694665055225258125950018396772617576369314565;
    uint256 constant IC5y = 3449812164914892422543530167786594137303064706260533026823951251732564215049;
    
    uint256 constant IC6x = 1471599191799850845000110920046555986719687348678748461031382539688265948682;
    uint256 constant IC6y = 3538837344712738587033035224294486781718509976299908379670773261931983755653;
    
    uint256 constant IC7x = 13143079692128492311391002642438348790999787024891999068717545978894204757997;
    uint256 constant IC7y = 4318026382287711685171835140923426538464318286497053656007992540416459834672;
    
    uint256 constant IC8x = 10925028310791976129939536001658986092689199894538990230138481215834653814718;
    uint256 constant IC8y = 7322980065053504925851644134807443133628447801025571043127452452669365353682;
    
    uint256 constant IC9x = 14304380522795137089956017263847508284850845363307705675101125777948280552945;
    uint256 constant IC9y = 15944307573283571252378767292132450771156443580187056542845490427188532770839;
    
    uint256 constant IC10x = 17311678146070445050829948548043696416393144168439194270304517651389778379862;
    uint256 constant IC10y = 14994589873690719226453053720218813600003540869747768366794495907785391738120;
    
    uint256 constant IC11x = 2550768350206304472858671929665864027167816231630315282338119479279879555582;
    uint256 constant IC11y = 9641045366576251474570663436385252638670889755596488098361387200725579121904;
    
    uint256 constant IC12x = 12106075422323454100133935400760309667034529696444384899027181966436055123844;
    uint256 constant IC12y = 1873314806864071433735605354335947269756738486777479398318614743702137612880;
    
    uint256 constant IC13x = 5355132545920198409226488408561893696450799032357103783319361194072874623115;
    uint256 constant IC13y = 12498393531732206240810320372664978883575759303570731472515541531944461560789;
    
    uint256 constant IC14x = 6371008120972630366567027390366723379750830390049925195978439935079441682335;
    uint256 constant IC14y = 16872581229949480943561705191802297359023475688511052315020498760223991777678;
    
    uint256 constant IC15x = 4939634249946574851535829120597978295448554607881431073927842137409550443772;
    uint256 constant IC15y = 13509050689308877049543430600324637991875918630311617192765931387468737431509;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[15] calldata _pubSignals) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, r)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }
            
            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x
                
                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))
                
                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))
                
                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))
                
                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))
                
                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))
                
                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))
                
                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))
                
                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))
                
                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))
                
                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))
                
                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))
                
                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))
                
                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))
                
                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))
                
                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))
                

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))


                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)


                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F
            
            checkField(calldataload(add(_pubSignals, 0)))
            
            checkField(calldataload(add(_pubSignals, 32)))
            
            checkField(calldataload(add(_pubSignals, 64)))
            
            checkField(calldataload(add(_pubSignals, 96)))
            
            checkField(calldataload(add(_pubSignals, 128)))
            
            checkField(calldataload(add(_pubSignals, 160)))
            
            checkField(calldataload(add(_pubSignals, 192)))
            
            checkField(calldataload(add(_pubSignals, 224)))
            
            checkField(calldataload(add(_pubSignals, 256)))
            
            checkField(calldataload(add(_pubSignals, 288)))
            
            checkField(calldataload(add(_pubSignals, 320)))
            
            checkField(calldataload(add(_pubSignals, 352)))
            
            checkField(calldataload(add(_pubSignals, 384)))
            
            checkField(calldataload(add(_pubSignals, 416)))
            
            checkField(calldataload(add(_pubSignals, 448)))
            
            checkField(calldataload(add(_pubSignals, 480)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
