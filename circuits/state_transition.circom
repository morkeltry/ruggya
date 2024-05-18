pragma circom 2.0.0;

include "circomlibs/sign.circom"; // Include a circomlib for signature verification
include "circomlibs/comparators.circom";

template state_transition () {
    signal input liveness[5]; // L for each of the 5 players
    signal input publicVotingPower[5]; // P for each of the 5 players
    signal input secretVotingPower[5]; // S for each of the 5 players
    signal input pubkey[5]; // pubkey for each of the 5 players

    signal input votes[55];        // KP and KS for each player (5*5*2), signatures for each player (5)
    signal input outputState[20];  // L, P, S, pubkey for each of the 5 players (4*5)

    var publicRugTotal[5];
    var secretRugTotal[5];
    var playerToRugFwd;
    var playerToRugBkwd;
    var highestRugTotalFwd;
    var highestRugTotalBkwd;

    component signVerifiers[5];

    for (var i = 0; i < 5; i++) {
        publicRugTotal[i] = 0;
        secretRugTotal[i] = 0;
    }

    for (var i = 0; i < 5; i++) {
        // Extract votes and signatures
        var KPStart = i * 10;
        var KSStart = KPStart + 5;
        var signatureStart = 50 + i;

      //   // Check if vote is signed with the key matching their pubkey
      //   signVerifiers[i] = SignatureVerifier();
      //   signVerifiers[i].pubkey <== currentState[15 + i]; // Assuming pubkey is at 15-19 in currentState
      //   for (var j = 0; j < 5; j++) {
      //       signVerifiers[i].message[j] <== votes[KPStart + j];
      //       signVerifiers[i].message[j + 5] <== votes[KSStart + j];
      //   }
      //   signVerifiers[i].signature <== votes[signatureStart];

        for (var j = 0; j < 5; j++) {
            var KP = votes[KPStart + j];
            var KS = votes[KSStart + j];

            // Ensure KP and KS against the player themself is zero
            if (i == j) {
                assert (KP == 0);
                assert (KS == 0);
            }

            // // Ensure KP and KS against dead players is zero
            if (liveness[j] == 0) {
                assert(KP == 0);
                assert(KS == 0);
            }

            // Exclude votes from dead players
            if (i >= 0 && i < 5 && liveness[i] != 0) {
                publicRugTotal[j] =  publicRugTotal[j] + KP;
                secretRugTotal[j] =  secretRugTotal[j] + KS;
            }
        }
    }

    highestRugTotalFwd = 0;
    highestRugTotalBkwd = 0;
    playerToRugFwd = 0;
    playerToRugBkwd = 0;

    for (var i = 0; i < 5; i++) {
      // Check public and secret rug votes each total against vote power
      assert (publicRugTotal[i] <= publicVotingPower[i]);
      assert (secretRugTotal[i] <= secretVotingPower[i]);

        // TODO: check tie case
        if (publicRugTotal[i] + secretRugTotal[i] > highestRugTotalFwd) {
            highestRugTotalFwd = publicRugTotal[i] + secretRugTotal[i];
            playerToRugFwd = i;
        }

        if (publicRugTotal[4-i] + secretRugTotal[4-i] > highestRugTotalBkwd) {
            highestRugTotalBkwd = publicRugTotal[i] + secretRugTotal[i];
            playerToRugBkwd = i;
        }
    }
    // Verify that there was no tie
    if (playerToRugFwd != playerToRugBkwd) {
      playerToRugFwd = -1;
      playerToRugBkwd = -1;
    }

   //  Verify that output state remains same as input state
    for (var i = 0; i < 5; i++) {

    }
    
    // Verify that in the output state, the player to be rugged has liveness of 0
   assert (outputState[playerToRugFwd] == 0);
}

component main = state_transition();
