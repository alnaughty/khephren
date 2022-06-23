// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
    '[{"inputs":[{"internalType":"address","name":"_poolImplementation","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"owner","type":"address"},{"indexed":false,"internalType":"address","name":"poolAddress","type":"address"},{"indexed":false,"internalType":"uint256","name":"time","type":"uint256"}],"name":"createPool721EVT","type":"event"},{"inputs":[{"internalType":"uint256[]","name":"_dates","type":"uint256[]"},{"internalType":"uint16[]","name":"_data","type":"uint16[]"}],"name":"createPool721","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"getAllPool","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_nftAddress","type":"address"},{"internalType":"address","name":"_project721Owner","type":"address"}],"name":"setProjectDetails","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
    'Project');

class Project extends _i1.GeneratedContract {
  Project(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(_i1.DeployedContract(_contractAbi, address), client, chainId);

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createPool721(List<BigInt> _dates, List<BigInt> _data,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '7a998082'));
    final params = [_dates, _data];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> getAllPool({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, 'a20a4cb4'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setProjectDetails(
      _i1.EthereumAddress _nftAddress, _i1.EthereumAddress _project721Owner,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '0f85d111'));
    final params = [_nftAddress, _project721Owner];
    return write(credentials, transaction, function, params);
  }

  /// Returns a live stream of all createPool721EVT events emitted by this contract.
  Stream<createPool721EVT> createPool721EVTEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('createPool721EVT');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return createPool721EVT(decoded);
    });
  }
}

class createPool721EVT {
  createPool721EVT(List<dynamic> response)
      : owner = (response[0] as _i1.EthereumAddress),
        poolAddress = (response[1] as _i1.EthereumAddress),
        time = (response[2] as BigInt);

  final _i1.EthereumAddress owner;

  final _i1.EthereumAddress poolAddress;

  final BigInt time;
}
