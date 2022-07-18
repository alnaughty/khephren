// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
    '[{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"nftAddress","type":"address"},{"indexed":false,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"time","type":"uint256"}],"name":"addNftRewardEVT","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"tokenAddress","type":"address"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"time","type":"uint256"}],"name":"addTokenRewardEVT","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"owner","type":"address"},{"indexed":false,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"time","type":"uint256"}],"name":"claimNftEVT","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"by","type":"address"},{"indexed":false,"internalType":"uint256","name":"tokenId","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"time","type":"uint256"}],"name":"claimNftRewardEVT","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"by","type":"address"},{"indexed":false,"internalType":"uint256","name":"amount","type":"uint256"},{"indexed":false,"internalType":"uint256","name":"time","type":"uint256"}],"name":"claimTokenRewardEVT","type":"event"},{"inputs":[{"internalType":"uint256","name":"_tokenId","type":"uint256"}],"name":"addNftRewards","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_amount","type":"uint256"},{"internalType":"address","name":"_rewardAddress","type":"address"},{"internalType":"uint8","name":"_tokenRewardType","type":"uint8"}],"name":"addTokenRewards","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"cancelPool721","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"finalize","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[],"name":"getAllstakers","outputs":[{"components":[{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"address","name":"stakers","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"uint256","name":"stakeTime","type":"uint256"},{"internalType":"bool","name":"isWinner","type":"bool"},{"internalType":"uint256","name":"nftReward","type":"uint256"},{"internalType":"enum Pool721.StakeStatus","name":"status","type":"uint8"}],"internalType":"struct Pool721.Stake[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getNFTReward","outputs":[{"components":[{"internalType":"uint256","name":"index","type":"uint256"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"address","name":"from","type":"address"},{"internalType":"enum Pool721.RewardStatus","name":"status","type":"uint8"}],"internalType":"struct Pool721.Reward[]","name":"","type":"tuple[]"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getPoolDetails","outputs":[{"components":[{"internalType":"uint256","name":"start","type":"uint256"},{"internalType":"uint256","name":"stakingEndDate","type":"uint256"},{"internalType":"uint256","name":"end","type":"uint256"},{"internalType":"uint16","name":"minimumStakers","type":"uint16"},{"internalType":"uint16","name":"maximumStakers","type":"uint16"},{"internalType":"uint16","name":"tax","type":"uint16"},{"internalType":"address","name":"nftAddress","type":"address"},{"internalType":"enum Pool721.PoolStatus","name":"status","type":"uint8"}],"internalType":"struct Pool721.poolDetails721","name":"","type":"tuple"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getTokenBalance","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"to","type":"address"},{"internalType":"address","name":"from","type":"address"},{"internalType":"uint256","name":"tokenId","type":"uint256"},{"internalType":"bytes","name":"_data","type":"bytes"}],"name":"onERC721Received","outputs":[{"internalType":"bytes4","name":"","type":"bytes4"}],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256[]","name":"_dates","type":"uint256[]"},{"internalType":"uint16[]","name":"_data","type":"uint16[]"},{"internalType":"address","name":"_nftAddress","type":"address"},{"internalType":"address","name":"_poolOwner","type":"address"}],"name":"setPoolDetails","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_tokenId","type":"uint256"}],"name":"stake","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_tokenId","type":"uint256"},{"internalType":"bool","name":"_iswinner","type":"bool"},{"internalType":"uint256","name":"_rewardId","type":"uint256"}],"name":"unStakeNftReward","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"uint256","name":"_tokenId","type":"uint256"}],"name":"unStakeTokenReward","outputs":[],"stateMutability":"nonpayable","type":"function"}]',
    'Pool721');

class Pool721 extends _i1.GeneratedContract {
  Pool721(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(_i1.DeployedContract(_contractAbi, address), client, chainId);

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addNftRewards(BigInt _tokenId,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[0];
    assert(checkSignature(function, '697a1198'));
    final params = [_tokenId];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addTokenRewards(BigInt _amount,
      _i1.EthereumAddress _rewardAddress, BigInt _tokenRewardType,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, 'add00256'));
    final params = [_amount, _rewardAddress, _tokenRewardType];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> cancelPool721(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '5082cb81'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> finalize(
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '4bb278f3'));
    final params = [];
    return write(credentials, transaction, function, params);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getAllstakers({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, 'c375a705'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<dynamic>> getNFTReward({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, '54883d5e'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as List<dynamic>).cast<dynamic>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<dynamic> getPoolDetails({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, 'aca34c11'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as dynamic);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getTokenBalance({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '82b2e257'));
    final params = [];
    final response = await read(function, params, atBlock);
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> onERC721Received(_i1.EthereumAddress to,
      _i1.EthereumAddress from, BigInt tokenId, _i2.Uint8List _data,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, '150b7a02'));
    final params = [to, from, tokenId, _data];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> setPoolDetails(List<BigInt> _dates, List<BigInt> _data,
      _i1.EthereumAddress _nftAddress, _i1.EthereumAddress _poolOwner,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, 'a2834151'));
    final params = [_dates, _data, _nftAddress, _poolOwner];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> stake(BigInt _tokenId,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, 'a694fc3a'));
    final params = [_tokenId];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> unStakeNftReward(
      BigInt _tokenId, bool _iswinner, BigInt _rewardId,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, '15a2bd64'));
    final params = [_tokenId, _iswinner, _rewardId];
    return write(credentials, transaction, function, params);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> unStakeTokenReward(BigInt _tokenId,
      {required _i1.Credentials credentials,
      _i1.Transaction? transaction}) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, '21c42d51'));
    final params = [_tokenId];
    return write(credentials, transaction, function, params);
  }

  /// Returns a live stream of all addNftRewardEVT events emitted by this contract.
  Stream<addNftRewardEVT> addNftRewardEVTEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('addNftRewardEVT');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return addNftRewardEVT(decoded);
    });
  }

  /// Returns a live stream of all addTokenRewardEVT events emitted by this contract.
  Stream<addTokenRewardEVT> addTokenRewardEVTEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('addTokenRewardEVT');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return addTokenRewardEVT(decoded);
    });
  }

  /// Returns a live stream of all claimNftEVT events emitted by this contract.
  Stream<claimNftEVT> claimNftEVTEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('claimNftEVT');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return claimNftEVT(decoded);
    });
  }

  /// Returns a live stream of all claimNftRewardEVT events emitted by this contract.
  Stream<claimNftRewardEVT> claimNftRewardEVTEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('claimNftRewardEVT');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return claimNftRewardEVT(decoded);
    });
  }

  /// Returns a live stream of all claimTokenRewardEVT events emitted by this contract.
  Stream<claimTokenRewardEVT> claimTokenRewardEVTEvents(
      {_i1.BlockNum? fromBlock, _i1.BlockNum? toBlock}) {
    final event = self.event('claimTokenRewardEVT');
    final filter = _i1.FilterOptions.events(
        contract: self, event: event, fromBlock: fromBlock, toBlock: toBlock);
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(result.topics!, result.data!);
      return claimTokenRewardEVT(decoded);
    });
  }
}

class addNftRewardEVT {
  addNftRewardEVT(List<dynamic> response)
      : nftAddress = (response[0] as _i1.EthereumAddress),
        tokenId = (response[1] as BigInt),
        time = (response[2] as BigInt);

  final _i1.EthereumAddress nftAddress;

  final BigInt tokenId;

  final BigInt time;
}

class addTokenRewardEVT {
  addTokenRewardEVT(List<dynamic> response)
      : tokenAddress = (response[0] as _i1.EthereumAddress),
        amount = (response[1] as BigInt),
        time = (response[2] as BigInt);

  final _i1.EthereumAddress tokenAddress;

  final BigInt amount;

  final BigInt time;
}

class claimNftEVT {
  claimNftEVT(List<dynamic> response)
      : owner = (response[0] as _i1.EthereumAddress),
        tokenId = (response[1] as BigInt),
        time = (response[2] as BigInt);

  final _i1.EthereumAddress owner;

  final BigInt tokenId;

  final BigInt time;
}

class claimNftRewardEVT {
  claimNftRewardEVT(List<dynamic> response)
      : by = (response[0] as _i1.EthereumAddress),
        tokenId = (response[1] as BigInt),
        time = (response[2] as BigInt);

  final _i1.EthereumAddress by;

  final BigInt tokenId;

  final BigInt time;
}

class claimTokenRewardEVT {
  claimTokenRewardEVT(List<dynamic> response)
      : by = (response[0] as _i1.EthereumAddress),
        amount = (response[1] as BigInt),
        time = (response[2] as BigInt);

  final _i1.EthereumAddress by;

  final BigInt amount;

  final BigInt time;
}
