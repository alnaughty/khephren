// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
    '[{"anonymous":false,"inputs":[{"indexed":false,"internalType":"uint256","name":"status","type":"uint256"}],"name":"ChangeState","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"account","type":"address"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"}],"name":"Claim","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},{"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"}],"name":"Purchase","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"sender","type":"address"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"}],"name":"TokenDeposited","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"WhitelistAdded","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"account","type":"address"}],"name":"WhitelistRemoved","type":"event"},{"inputs":[],"name":"activate","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"additionalDetails","outputs":[{"internalType":"bytes[12]","name":"","type":"bytes[12]"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"cancel","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"claim","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"contributors","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"uint256","name":"amount","type":"uint256"}],"name":"depositTokens","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"finalize","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_owner","type":"address"},{"internalType":"address","name":"platformOwner","type":"address"},{"internalType":"uint256","name":"additionalFee","type":"uint256"},{"internalType":"address[2]","name":"addresses","type":"address[2]"},{"internalType":"bytes[12]","name":"details","type":"bytes[12]"},{"internalType":"uint256[2]","name":"date","type":"uint256[2]"},{"internalType":"uint256[3]","name":"qty","type":"uint256[3]"},{"internalType":"uint256[2]","name":"liquidity","type":"uint256[2]"}],"name":"init","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"liquidityDetails","outputs":[{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"pause","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"pullOutTokens","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"purchase","outputs":[],"stateMutability":"payable","type":"function"},{"inputs":[],"name":"refund","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"removeLiquidity","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"saleDetails","outputs":[{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"address","name":"","type":"address"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"},{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"saleType","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"bytes[12]","name":"info","type":"bytes[12]"}],"name":"setDetails","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"state","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"account","type":"address"}],"name":"totalContributions","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"withdrawFunds","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
    'FairLaunchContract');

class FairLaunchContract extends _i1.GeneratedContract {
  FairLaunchContract(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(_i1.DeployedContract(_contractAbi, address), client, chainId);

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> activate(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[0];
    assert(checkSignature(function, '0f15f4c0'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<AdditionalDetails> additionalDetails({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '31f4b58a'));
    final params = [];
    final response = await read(function, params, atBlock);
    return AdditionalDetails(response);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> cancel(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, 'ea8a1af0'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> claim(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '4e71d92d'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> contributors(
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '6e7e3b2b'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> depositTokens(BigInt amount,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, 'dd49756e'));
    final params = [amount];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> finalize(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, '4bb278f3'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> init(
      _i1.EthereumAddress _owner,
      _i1.EthereumAddress platformOwner,
      BigInt additionalFee,
      List<_i1.EthereumAddress> addresses,
      List<_i2.Uint8List> details,
      List<BigInt> date,
      List<BigInt> qty,
      List<BigInt> liquidity,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, 'a21c2b17'));
    final params = [
      _owner,
      platformOwner,
      additionalFee,
      addresses,
      details,
      date,
      qty,
      liquidity
    ];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<LiquidityDetails> liquidityDetails({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, '07a130f7'));
    final params = [];
    final response = await read(function, params, atBlock);
    return LiquidityDetails(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> owner({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, '8da5cb5b'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> pause(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, '8456cb59'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> pullOutTokens(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, 'edad0dfe'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> purchase(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, '64edfbf0'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> refund(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[13];
    assert(checkSignature(function, '590e1ae3'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> removeLiquidity(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[14];
    assert(checkSignature(function, '67b9a286'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> renounceOwnership(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[15];
    assert(checkSignature(function, '715018a6'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<SaleDetails> saleDetails({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[16];
    assert(checkSignature(function, '3474a4a6'));
    final params = [];
    final response = await read(function, params, atBlock);
    return SaleDetails(response);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> saleType({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[17];
    assert(checkSignature(function, '5bcc7928'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setDetails(List<_i2.Uint8List> info,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[18];
    assert(checkSignature(function, '48536688'));
    final params = [info];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> state({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[19];
    assert(checkSignature(function, 'c19d93fb'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> totalContributions(_i1.EthereumAddress account,
      {_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[20];
    assert(checkSignature(function, '7ed3deba'));
    final params = [account];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> transferOwnership(_i1.EthereumAddress newOwner,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[21];
    assert(checkSignature(function, 'f2fde38b'));
    final params = [newOwner];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> withdrawFunds(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[22];
    assert(checkSignature(function, '24600fc3'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// Returns a live stream of all ChangeState events emitted by this contract.
  Stream<ChangeState> changeStateEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('ChangeState');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return ChangeState(decoded);
    });
  }

  /// Returns a live stream of all Claim events emitted by this contract.
  Stream<Claim> claimEvents({_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('Claim');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return Claim(decoded);
    });
  }

  /// Returns a live stream of all OwnershipTransferred events emitted by this contract.
  Stream<OwnershipTransferred> ownershipTransferredEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('OwnershipTransferred');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return OwnershipTransferred(decoded);
    });
  }

  /// Returns a live stream of all Purchase events emitted by this contract.
  Stream<Purchase> purchaseEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('Purchase');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return Purchase(decoded);
    });
  }

  /// Returns a live stream of all TokenDeposited events emitted by this contract.
  Stream<TokenDeposited> tokenDepositedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('TokenDeposited');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return TokenDeposited(decoded);
    });
  }

  /// Returns a live stream of all WhitelistAdded events emitted by this contract.
  Stream<WhitelistAdded> whitelistAddedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('WhitelistAdded');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return WhitelistAdded(decoded);
    });
  }

  /// Returns a live stream of all WhitelistRemoved events emitted by this contract.
  Stream<WhitelistRemoved> whitelistRemovedEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('WhitelistRemoved');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return WhitelistRemoved(decoded);
    });
  }
}

class AdditionalDetails {
  AdditionalDetails(List<dynamic> response)
      : var1 = (response[0] as List<dynamic>).cast<_i2.Uint8List>(),
        var2 = (response[1] as BigInt),
        var3 = (response[2] as BigInt),
        var4 = (response[3] as BigInt);

  final List<_i2.Uint8List> var1;

  final BigInt var2;

  final BigInt var3;

  final BigInt var4;
}

class LiquidityDetails {
  LiquidityDetails(List<dynamic> response)
      : var1 = (response[0] as BigInt),
        var2 = (response[1] as BigInt);

  final BigInt var1;

  final BigInt var2;
}

class SaleDetails {
  SaleDetails(List<dynamic> response)
      : var1 = (response[0] as _i1.EthereumAddress),
        var2 = (response[1] as BigInt),
        var3 = (response[2] as BigInt),
        var4 = (response[3] as _i1.EthereumAddress),
        var5 = (response[4] as BigInt),
        var6 = (response[5] as BigInt),
        var7 = (response[6] as BigInt);

  final _i1.EthereumAddress var1;

  final BigInt var2;

  final BigInt var3;

  final _i1.EthereumAddress var4;

  final BigInt var5;

  final BigInt var6;

  final BigInt var7;
}

class ChangeState {
  ChangeState(List<dynamic> response) : status = (response[0] as BigInt);

  final BigInt status;
}

class Claim {
  Claim(List<dynamic> response)
      : account = (response[0] as _i1.EthereumAddress),
        amount = (response[1] as BigInt);

  final _i1.EthereumAddress account;

  final BigInt amount;
}

class OwnershipTransferred {
  OwnershipTransferred(List<dynamic> response)
      : previousOwner = (response[0] as _i1.EthereumAddress),
        newOwner = (response[1] as _i1.EthereumAddress);

  final _i1.EthereumAddress previousOwner;

  final _i1.EthereumAddress newOwner;
}

class Purchase {
  Purchase(List<dynamic> response)
      : account = (response[0] as _i1.EthereumAddress),
        amount = (response[1] as BigInt);

  final _i1.EthereumAddress account;

  final BigInt amount;
}

class TokenDeposited {
  TokenDeposited(List<dynamic> response)
      : sender = (response[0] as _i1.EthereumAddress),
        amount = (response[1] as BigInt);

  final _i1.EthereumAddress sender;

  final BigInt amount;
}

class WhitelistAdded {
  WhitelistAdded(List<dynamic> response)
      : account = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress account;
}

class WhitelistRemoved {
  WhitelistRemoved(List<dynamic> response)
      : account = (response[0] as _i1.EthereumAddress);

  final _i1.EthereumAddress account;
}
