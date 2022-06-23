// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
    '[{"inputs":[{"internalType":"uint256","name":"listingPrice","type":"uint256"},{"internalType":"uint256","name":"createTokenPrice","type":"uint256"},{"internalType":"address","name":"launchpad","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"contract_address","type":"address"},{"indexed":true,"internalType":"address","name":"owner","type":"address"}],"name":"LaunchpadCreated","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"from","type":"address"},{"indexed":true,"internalType":"address","name":"to","type":"address"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"}],"name":"TransferSent","type":"event"},{"inputs":[{"internalType":"address","name":"contractAddress","type":"address"}],"name":"addAcceptedRouter","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"price","type":"uint256"}],"name":"addPricing","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"balance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"changeListingPrice","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"changePricingInfo","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address[2]","name":"addresses","type":"address[2]"},{"internalType":"bytes32[10]","name":"projectDetails","type":"bytes32[10]"},{"internalType":"uint256[2]","name":"date","type":"uint256[2]"},{"internalType":"uint256[5]","name":"prices","type":"uint256[5]"},{"internalType":"uint256","name":"sellQty","type":"uint256"},{"internalType":"uint256","name":"listingPrice","type":"uint256"},{"internalType":"uint256[2]","name":"cap","type":"uint256[2]"},{"internalType":"uint256[2]","name":"minmaxBuy","type":"uint256[2]"},{"internalType":"uint256[2]","name":"liquidity","type":"uint256[2]"},{"internalType":"bool","name":"whitelist","type":"bool"}],"name":"createLaunchpad","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"getAcceptedRouter","outputs":[{"components":[{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"address","name":"the_address","type":"address"}],"internalType":"struct LaunchpadFactory.MyStandardStruct[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"launchpadAddress","type":"address"}],"name":"getLaunchpad","outputs":[{"components":[{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"address","name":"launchpad","type":"address"},{"internalType":"bool","name":"verified","type":"bool"}],"internalType":"struct LaunchpadFactory.LaunchpadStruct","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getLaunchpads","outputs":[{"components":[{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"address","name":"launchpad","type":"address"},{"internalType":"bool","name":"verified","type":"bool"}],"internalType":"struct LaunchpadFactory.LaunchpadStruct[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getOwnedLaunchpads","outputs":[{"components":[{"internalType":"address","name":"token","type":"address"},{"internalType":"address","name":"launchpad","type":"address"}],"internalType":"struct LaunchpadFactory.OwnedLaunchpadStuct[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getPricings","outputs":[{"components":[{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"string","name":"name","type":"string"},{"internalType":"uint256","name":"price","type":"uint256"}],"internalType":"struct LaunchpadFactory.AdditionalPrice[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getlistingPrice","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"contractAddress","type":"address"}],"name":"removeAcceptedRouter","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"launchpadAddress","type":"address"}],"name":"verifyLaunchPad","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"withdraw","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
    'LaunchpadFactoryContract');

class LaunchpadFactoryContract extends _i1.GeneratedContract {
  LaunchpadFactoryContract(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(_i1.DeployedContract(_contractAbi, address), client, chainId);

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addAcceptedRouter(_i1.EthereumAddress contractAddress,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '95f68a73'));
    final params = [contractAddress];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addPricing(String name, BigInt price,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '51780b6e'));
    final params = [name, price];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> balance({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, 'b69ef8a8'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> changeListingPrice(BigInt amount,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, 'ba0f1d9c'));
    final params = [amount];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> changePricingInfo(BigInt index, BigInt amount,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '23aed9b6'));
    final params = [index, amount];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> createLaunchpad(
      List<_i1.EthereumAddress> addresses,
      List<_i2.Uint8List> projectDetails,
      List<BigInt> date,
      List<BigInt> prices,
      BigInt sellQty,
      BigInt listingPrice,
      List<BigInt> cap,
      List<BigInt> minmaxBuy,
      List<BigInt> liquidity,
      bool whitelist,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '2104c175'));
    final params = [
      addresses,
      projectDetails,
      date,
      prices,
      sellQty,
      listingPrice,
      cap,
      minmaxBuy,
      liquidity,
      whitelist
    ];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getAcceptedRouter({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, 'a95bdd76'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getLaunchpad(_i1.EthereumAddress launchpadAddress,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, 'b6fbc2e1'));
    final params = [launchpadAddress];
    final response = await read(function, params, atBlock);
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getLaunchpads({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, '790e39f0'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getOwnedLaunchpads({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, 'ec9b2b5f'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getPricings({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, 'b9eabb70'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getlistingPrice({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, '6b0a2d11'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> removeAcceptedRouter(_i1.EthereumAddress contractAddress,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[13];
    assert(checkSignature(function, 'cbb2fd93'));
    final params = [contractAddress];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> verifyLaunchPad(_i1.EthereumAddress launchpadAddress,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[14];
    assert(checkSignature(function, '89c6308e'));
    final params = [launchpadAddress];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> withdraw(BigInt amount,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[15];
    assert(checkSignature(function, '2e1a7d4d'));
    final params = [amount];
    return write(credentials, transaction, function, params);
  }

  /// Returns a live stream of all LaunchpadCreated events emitted by this contract.
  Stream<LaunchpadCreated> launchpadCreatedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('LaunchpadCreated');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return LaunchpadCreated(decoded);
    });
  }

  /// Returns a live stream of all TransferSent events emitted by this contract.
  Stream<TransferSent> transferSentEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('TransferSent');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return TransferSent(decoded);
    });
  }
}

class LaunchpadCreated {
  LaunchpadCreated(List<dynamic> response)
      : contractaddress = (response[0] as _i1.EthereumAddress),
        owner = (response[1] as _i1.EthereumAddress);

  final _i1.EthereumAddress contractaddress;

  final _i1.EthereumAddress owner;
}

class TransferSent {
  TransferSent(List<dynamic> response)
      : from = (response[0] as _i1.EthereumAddress),
        to = (response[1] as _i1.EthereumAddress),
        amount = (response[2] as BigInt);

  final _i1.EthereumAddress from;

  final _i1.EthereumAddress to;

  final BigInt amount;
}
