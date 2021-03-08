echo "deploy begin....."

mkdir -p ./deployments

TF_CMD=node_modules/.bin/truffle-flattener

echo "" >  ./deployments/DMSwapV2Router02.full.sol
cat  ./scripts/head.sol >  ./deployments/DMSwapV2Router02.full.sol
$TF_CMD ./contracts/DMSwapV2Router02.sol >>  ./deployments/DMSwapV2Router02.full.sol

echo "deploy end....."