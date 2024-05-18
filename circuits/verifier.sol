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
    uint256 constant alphax  = 18283493246242081139294329366686734503745090271282089060374406217373412046789;
    uint256 constant alphay  = 796381504778162727751085767380528000497808190758255510960020195242900869082;
    uint256 constant betax1  = 19710806529306615255685438119671851776148075802012871275884470886293060900807;
    uint256 constant betax2  = 14540835212791285130808310241744801802984629982757191975958227951604998349297;
    uint256 constant betay1  = 10687720527873126553330562161850904859156797667505471253262121340937567120735;
    uint256 constant betay2  = 14383937886908494555562106455681835860462569695016669780185109621997483034337;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 21269280009904203777336462764299934611212709252918620812020660457524550944150;
    uint256 constant deltax2 = 15945921785735413565033987635298766721898213678631398024221490783224422827081;
    uint256 constant deltay1 = 11780319743392183191336158413008047757192376305639951934721717581927549239619;
    uint256 constant deltay2 = 20075257658361347516806175170280473852419989336581038021697837704961367540737;

    
    uint256 constant IC0x = 7478387154554389666449243539827606347496015654956986841056336554036395629027;
    uint256 constant IC0y = 21156055251709751255529229770156492997951875601826487688586723958667770896052;
    
    uint256 constant IC1x = 2242921512691649220973360545163494046956118715021231706806971193185612168727;
    uint256 constant IC1y = 16517145119018859493863477502035423416149378459802542449743162329346433144741;
    
    uint256 constant IC2x = 6654439734491739221920275364621236304951324645525242798786814453058235011475;
    uint256 constant IC2y = 14554334078595616727411153664049692800912690031983617139463432700653659887761;
    
    uint256 constant IC3x = 11055912740670045350011551719265760610938064773369606292807642675055516752779;
    uint256 constant IC3y = 13727793411430326434517170444625329591439891603860337190291569073886240915895;
    
    uint256 constant IC4x = 15058758734547997665511710170133422940963946474529225537839570580075018172718;
    uint256 constant IC4y = 14876006073040485257763995090410087312069884784154166742779361938555793400183;
    
    uint256 constant IC5x = 922070145090190518698922146394184019536882059957051212777454328755993970216;
    uint256 constant IC5y = 4817291882273307671843386226945744472496013409338042164987304890586121611777;
    
    uint256 constant IC6x = 625537730146563909274860491684279651870124290185860009460589127160135368012;
    uint256 constant IC6y = 16504053186826505154911596241299360603741178159533534501488562077278533380717;
    
    uint256 constant IC7x = 6122683272885795589859770135186454563235839038565008344698507607790842023560;
    uint256 constant IC7y = 16766133118417983325630084373168754665300817863749643056536885152944904127882;
    
    uint256 constant IC8x = 16845911757194923073851528805936666687284076943562593442932034392490168281498;
    uint256 constant IC8y = 5341077395985539503368225463113443316041678685459030383048092731553092267676;
    
    uint256 constant IC9x = 1373171687451426599754737652602952347107476176671484325137649584824132153830;
    uint256 constant IC9y = 17148860716476360586627377530363950343511530599975367622278240966324534398900;
    
    uint256 constant IC10x = 5498277030411297464822278156173154690960535958062199017709791420521983892443;
    uint256 constant IC10y = 4945319567821674973008610615408061693539637626135793117737133717670826741021;
    
    uint256 constant IC11x = 494167599211123384397206233481613711543219401622766514238185322546669505620;
    uint256 constant IC11y = 6975013429266068967702681239079002408956932969019519797388459339021292542709;
    
    uint256 constant IC12x = 15150161051578819591887744979838365584367711068882270811373691796486527807988;
    uint256 constant IC12y = 8181124432647784947933505838225067517229423743539668495702368871730941212397;
    
    uint256 constant IC13x = 207819067820937708090098131073186106488501313495670494879839002073952411584;
    uint256 constant IC13y = 8472449632037016754729368225197254542702807968467107177576501161823524091310;
    
    uint256 constant IC14x = 1110880304259150015490311462659800996515594584870780864358817007289700059872;
    uint256 constant IC14y = 18541217538681333039687051283833964565779298357284868736735846087360463991068;
    
    uint256 constant IC15x = 18781436811830233967515482485549578827964635882453971171342727629247718689038;
    uint256 constant IC15y = 9559962703313046870841614249251113610924795610128850827403329085952640144630;
    
    uint256 constant IC16x = 14206828848251372591151238436155728564465445614170333886923290498138560555302;
    uint256 constant IC16y = 5797140419349432413084083469535206528580554334186332986825290003086918944215;
    
    uint256 constant IC17x = 18326093129688057264897355036599920713951448325015956096827374977518339862329;
    uint256 constant IC17y = 17294908468669406770330115942773449990651073198783908090701732052617033182041;
    
    uint256 constant IC18x = 2807919732820976951220453093466599363888202663539989813833065256249678365418;
    uint256 constant IC18y = 7489916237718617915259929751149141033525262270886235629129396761907829971596;
    
    uint256 constant IC19x = 20960226194656191745906595894042319792229047493694366457528566183898085410742;
    uint256 constant IC19y = 5747726940767346786381638228133154727251956787345099929617136389724444857098;
    
    uint256 constant IC20x = 4779004445662518235264672102726593337122470241318300114666091323947466941238;
    uint256 constant IC20y = 9250122908970830298428856814091838136010721528044139220355671572973885461262;
    
    uint256 constant IC21x = 12811504563836452552539385760178747494301909503142510547548037777949854105313;
    uint256 constant IC21y = 6419018820203758398074635097693648084655640456185454816949722877640347776310;
    
    uint256 constant IC22x = 21627981382675277581539417155247715613913608891809891827796860728082752324;
    uint256 constant IC22y = 15326926732018107883447794890093480732082554692136826344818064465154759063583;
    
    uint256 constant IC23x = 13383476879226004252126791980016770510771636079576429292315679858951321737276;
    uint256 constant IC23y = 1880685482769561001395672188959177789766556256759303569843773577875106569224;
    
    uint256 constant IC24x = 8052533808905675616493460328884091673465996933876312053749765674897724158479;
    uint256 constant IC24y = 15877652403818205013981829211662797210808182517024392719173722114023411714645;
    
    uint256 constant IC25x = 19266368445875689455914715803574603186478207341572097460558998424677173411623;
    uint256 constant IC25y = 15827041932672068793940831892139833468908955429776233341587222016042931162722;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[25] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))
                
                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))
                
                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))
                
                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))
                
                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))
                
                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))
                
                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))
                
                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))
                
                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))
                
                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))
                

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
            
            checkField(calldataload(add(_pubSignals, 512)))
            
            checkField(calldataload(add(_pubSignals, 544)))
            
            checkField(calldataload(add(_pubSignals, 576)))
            
            checkField(calldataload(add(_pubSignals, 608)))
            
            checkField(calldataload(add(_pubSignals, 640)))
            
            checkField(calldataload(add(_pubSignals, 672)))
            
            checkField(calldataload(add(_pubSignals, 704)))
            
            checkField(calldataload(add(_pubSignals, 736)))
            
            checkField(calldataload(add(_pubSignals, 768)))
            
            checkField(calldataload(add(_pubSignals, 800)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
