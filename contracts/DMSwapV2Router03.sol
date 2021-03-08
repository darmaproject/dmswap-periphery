pragma solidity =0.6.6;

import '../../dmswap-core/contracts/interfaces/IUniswapV2Factory.sol';

import './libraries/UniswapV2Library.sol';

contract UniswapV2Router03 {
    address public immutable factory;

    constructor(address _factory) public {
        factory = _factory;
    }

    function getPairVolume(
        address tokenA,
        address tokenB
    ) external view returns (uint amount) {
        address pair = UniswapV2Library.pairFor(factory, tokenA, tokenB);
        amount = IUniswapV2Pair(pair).getPairVolume();
    }

    function getPairUserVolume(
        address tokenA,
        address tokenB,
        address user
    ) external view returns (uint amount, uint totalAmount) {
        address pair = UniswapV2Library.pairFor(factory, tokenA, tokenB);
        (amount, totalAmount) = IUniswapV2Pair(pair).getUserVolume(user);
    }

    function getPairInviteRewardAmount(
        address tokenA,
        address tokenB,
        address user
    ) external view returns (uint amount) {
        address pair = UniswapV2Library.pairFor(factory, tokenA, tokenB);
        amount = IUniswapV2Pair(pair).getInviteRewardAmount(user);
    }
}
