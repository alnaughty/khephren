// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
    '[{"inputs":[{"internalType":"uint256","name":"_price","type":"uint256"},{"internalType":"address","name":"_projectImplementation","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"time","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"}],"name":"depositFund","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"creator","type":"address"},{"indexed":false,"internalType":"address","name":"project","type":"address"},{"indexed":false,"internalType":"uint256","name":"time","type":"uint256"}],"name":"projectCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"time","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"}],"name":"withdrawFund","type":"event"},{"inputs":[{"internalType":"address","name":"_nftAddress","type":"address"},{"internalType":"bytes[3]","name":"_projectDetails","type":"bytes[3]"}],"name":"createProject","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"getAllProjects","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getAllUserProjects","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getBalance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"price","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"_price","type":"uint256"}],"name":"setPlatformPrice","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_to","type":"address"},{"internalType":"uint256","name":"_amount","type":"uint256"}],"name":"withdraw","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
    'NFTStakingContract');

class NFTStakingContract extends _i1.GeneratedContract {
  NFTStakingContract(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(_i1.DeployedContract(_contractAbi, address), client, chainId);

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createProject(
      _i1.EthereumAddress _nftAddress, List<_i2.Uint8List> _projectDetails,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '69898176'));
    final params = [_nftAddress, _projectDetails];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> getAllProjects(
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '80d03829'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> getAllUserProjects(
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '164f0589'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getBalance({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '12065fe0'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> price({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, 'a035b1fe'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setPlatformPrice(BigInt _price,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '4310a25e'));
    final params = [_price];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> withdraw(_i1.EthereumAddress _to, BigInt _amount,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, 'f3fef3a3'));
    final params = [_to, _amount];
    return write(credentials, transaction, function, params);
  }

  /// Returns a live stream of all depositFund events emitted by this contract.
  Stream<depositFund> depositFundEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('depositFund');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return depositFund(decoded);
    });
  }

  /// Returns a live stream of all projectCreated events emitted by this contract.
  Stream<projectCreated> projectCreatedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('projectCreated');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return projectCreated(decoded);
    });
  }

  /// Returns a live stream of all withdrawFund events emitted by this contract.
  Stream<withdrawFund> withdrawFundEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('withdrawFund');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return withdrawFund(decoded);
    });
  }
}

class depositFund {
  depositFund(List<dynamic> response)
      : time = (response[0] as BigInt),
        amount = (response[1] as BigInt);

  final BigInt time;

  final BigInt amount;
}

class projectCreated {
  projectCreated(List<dynamic> response)
      : creator = (response[0] as _i1.EthereumAddress),
        project = (response[1] as _i1.EthereumAddress),
        time = (response[2] as BigInt);

  final _i1.EthereumAddress creator;

  final _i1.EthereumAddress project;

  final BigInt time;
}

class withdrawFund {
  withdrawFund(List<dynamic> response)
      : time = (response[0] as BigInt),
        amount = (response[1] as BigInt);

  final BigInt time;

  final BigInt amount;
}
