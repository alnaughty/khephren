import 'package:http/http.dart';
import 'package:kprn/constant/khprn.dart';
import 'package:kprn/kephrenTokenContract.g.dart';
import 'package:kprn/launchpadFactoryContract.g.dart';
import 'package:web3dart/web3dart.dart';

class ConstantContracts {
  ConstantContracts._private();
  static final ConstantContracts _instance = ConstantContracts._private();
  static ConstantContracts get instance => _instance;
  static final Client _httpClient = Client();
  static final Web3Client _ethClient = Web3Client(rpcUrl, _httpClient);
  final KephrenTokenContract khprnTokenContract = KephrenTokenContract(
    address: EthereumAddress.fromHex(khprnHex),
    client: _ethClient,
  );

  final LaunchpadFactoryContract launchpadContract = LaunchpadFactoryContract(
    address: EthereumAddress.fromHex(factoryAddress),
    client: _ethClient,
  );
}
