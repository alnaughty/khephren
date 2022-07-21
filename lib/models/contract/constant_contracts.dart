import 'package:http/http.dart';
import 'package:kprn/constant/khprn.dart';
import 'package:kprn/models/abi_model/factory/launchpadContract.g.dart';
import 'package:kprn/models/abi_model/nft_staking/NFTStakingContract.g.dart';
import 'package:kprn/models/abi_model/sales/salesContract.g.dart';
import 'package:web3dart/web3dart.dart';

class ConstantContracts {
  ConstantContracts._private();
  static final ConstantContracts _instance = ConstantContracts._private();
  static ConstantContracts get instance => _instance;
  static final Client _httpClient = Client();
  static final Web3Client _ethClient = Web3Client(rpcUrl, _httpClient);
  Web3Client get ethClient => _ethClient;
  // final KephrenTokenContract khprnTokenContract = KephrenTokenContract(
  //   address: EthereumAddress.fromHex(khprnHex),
  //   client: _ethClient,
  // );

  final LaunchpadContract launchpad = LaunchpadContract(
    address: EthereumAddress.fromHex(factoryAddress),
    client: _ethClient,
  );
  final SalesContract sales = SalesContract(
    address: EthereumAddress.fromHex(khprnHex), // change to sales contract
    client: _ethClient,
  );

  final NFTStakingContract nftStaking = NFTStakingContract(
    address: EthereumAddress.fromHex(factoryAddress),
    client: _ethClient,
  );
}
