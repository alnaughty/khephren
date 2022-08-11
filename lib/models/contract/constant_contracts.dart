import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:kprn/constant/khprn.dart';
import 'package:kprn/models/abi_model/factory/launchpadContract.g.dart';
import 'package:kprn/models/abi_model/nft_staking/NFTStakingContract.g.dart';
import 'package:web3dart/web3dart.dart';

class ConstantContracts {
  ConstantContracts._private();
  static final ConstantContracts _instance = ConstantContracts._private();
  static ConstantContracts get instance => _instance;
  static final Client _httpClient = Client();
  static final Web3Client _ethClient = Web3Client(rpcUrl, _httpClient);
  Web3Client get ethClient => _ethClient;

  final LaunchpadContract launchpad = LaunchpadContract(
    address: EthereumAddress.fromHex(dotenv.get("FACTORY_ADDRESS")),
    client: _ethClient,
  );

  final NFTStakingContract nftStaking = NFTStakingContract(
    address: EthereumAddress.fromHex(dotenv.get("FACTORY_ADDRESS")),
    client: _ethClient,
  );
}
