import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:kprn/constant/khprn.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

class SalesFunction {
  late Web3Client web3Client;
  late http.Client httpClient;
  final String address;
  SalesFunction(this.address) {
    httpClient = http.Client();
    web3Client = Web3Client(rpcUrl, httpClient);
  }

  Future purchase({required String userAddress, required BigInt amount}) async {
    final DeployedContract contract = await getContract();
    final ContractFunction function = contract.function("Purchase");
    final result = await web3Client.call(
      contract: contract,
      function: function,
      params: [
        userAddress,
        amount,
      ],
    );
    return result;
  }

  Future<DeployedContract> getContract() async {
    String abi = await rootBundle.loadString('assets/abis/salesContract.json');
    print(abi);
    final contract = DeployedContract(
      ContractAbi.fromJson(json.decode(abi), "Sale"),
      EthereumAddress.fromHex(address),
    );
    return contract;
  }
}
