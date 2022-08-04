import 'dart:convert';

import 'package:web3dart/contracts.dart';

class ContractAbiGenerator {
  final RegExp array = RegExp(r'^(.*)\[(\d*)\]$');
  final Map<String, StateMutability> _mutabilityNames = {
    'pure': StateMutability.pure,
    'view': StateMutability.view,
    'nonpayable': StateMutability.nonPayable,
    'payable': StateMutability.payable,
  };
  final Map<String, ContractFunctionType> _functionTypeNames = {
    'function': ContractFunctionType.function,
    'event': ContractFunctionType.function,
    'constructor': ContractFunctionType.constructor,
    'fallback': ContractFunctionType.fallback,
  };
  List<FunctionParameter> _parseParams(List? data) {
    if (data == null || data.isEmpty) return [];

    final elements = <FunctionParameter>[];
    for (final entry in data) {
      elements.add(_parseParam(entry as Map));
    }

    return elements;
  }

  CompositeFunctionParameter _parseTuple(
      String name, String typeName, List<FunctionParameter> components) {
    // The type will have the form tuple[3][]...[1], where the indices after the
    // tuple indicate that the type is part of an array.
    assert(RegExp(r'^tuple(?:\[\d*\])*$').hasMatch(typeName),
        '$typeName is an invalid tuple type');

    final arrayLengths = <int?>[];
    var remainingName = typeName;

    while (remainingName != 'tuple') {
      final arrayMatch = array.firstMatch(remainingName)!;
      remainingName = arrayMatch.group(1)!;

      final insideSquareBrackets = arrayMatch.group(2)!;
      if (insideSquareBrackets.isEmpty) {
        arrayLengths.insert(0, null);
      } else {
        arrayLengths.insert(0, int.parse(insideSquareBrackets));
      }
    }

    return CompositeFunctionParameter(name, components, arrayLengths);
  }

  FunctionParameter _parseParam(Map entry) {
    final name = entry['name'] as String;
    final typeName = entry['type'] as String;

    if (typeName.contains('tuple')) {
      final components = entry['components'] as List;
      return _parseTuple(name, typeName, _parseParams(components));
    } else {
      final type = parseAbiType(entry['type'] as String);
      return FunctionParameter(name, type);
    }
  }

  ContractAbi convertFromJson(String jsonData, String name) {
    final data = json.decode(jsonData);
    List<ContractFunction> functions = <ContractFunction>[];
    List<ContractEvent> events = <ContractEvent>[];
    for (final element in data['abi']) {
      final String type = element['type'];
      final String name = element['name'] ?? '';
      if (type == "event") {
        final bool anonymous = element['anonymous'] ?? false;
        final components = <EventComponent>[];

        for (final entry in element['inputs']) {
          components.add(EventComponent(
              _parseParam(entry as Map), entry['indexed'] as bool));
        }

        events.add(
          ContractEvent(anonymous, name, components),
        );
        // continue;
      }
      final mutability =
          _mutabilityNames[element['stateMutability'] ?? "nonpayable"];
      final parsedType = _functionTypeNames[element['type']];

      final inputs = _parseParams(element['inputs'] as List?);
      final outputs = _parseParams(element['outputs'] as List?);
      ContractFunction func = ContractFunction(
        name,
        inputs,
        outputs: outputs,
        type: parsedType ?? ContractFunctionType.function,
        mutability: mutability ?? StateMutability.nonPayable,
      );
      functions.add(func);
    }
    return ContractAbi(name, functions, events);
  }
}
