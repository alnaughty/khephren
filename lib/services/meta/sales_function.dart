import 'dart:convert';

import 'package:ethers/ethers.dart';
import 'package:flutter/services.dart';
import 'package:kprn/constant/khprn.dart';
// import 'package:kprn/constant/khprn.dart';
import 'package:kprn/services/meta/contract_abi_generator.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart' as http;

class SalesFunction extends ContractAbiGenerator {
  late Web3Client web3Client;
  late http.Client httpClient;
  final String address;
  SalesFunction(this.address) {
    httpClient = http.Client();
    web3Client = Web3Client(rpcUrl, httpClient);
  }

  Future purchase(
      {required EthereumAddress userAddress, required BigInt amount}) async {
    final DeployedContract contract = await getContract();
    print(contract.functions.map((e) => e.name));
    // for (ContractFunction func in contract.functions) {
    //   print("FUNCTION : ${func.name}");
    // }
    contract.constructors;
    final ContractFunction function = contract.function("purchase");
    final result = await web3Client.call(
      contract: contract,
      function: function,
      sender: userAddress,
      params: [
        // amount,
      ],
    ).then((value) {
      print(value);
    });
    return result;
  }

  Future<DeployedContract> getContract() async {
    String abi = await rootBundle.loadString('assets/abis/salesContract.json');

    final contract = DeployedContract(
      convertFromJson(abi, "Sale"),
      EthereumAddress.fromHex(address),
    );
    return contract;
  }
}
