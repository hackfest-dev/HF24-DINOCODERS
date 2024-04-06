import 'dart:convert';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GenTokenCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    String? amount = '',
  }) async {
    final ffApiRequestBody = '''
{
  "orderId": "$orderId",
  "orderAmount": "$amount",
  "orderCurrency": "INR"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'genToken',
      apiUrl: 'https://test.cashfree.com/api/v1/cftoken/order',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
        'x-client-id': '6568576a87f3fe9de91975d1e3758656',
        'x-client-secret':
            'cfsk_ma_prod_b7f519196c888f6ada0cd6a982e3ac9d_402c0b7b',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? reason(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.reason''',
      ));
}

class VerifySignatureCall {
  static Future<ApiCallResponse> call({
    String? orderId = '',
    String? orderAmount = '',
    String? referenceId = '',
    String? txStatus = '',
    String? paymentMode = '',
    String? txMsg = '',
    String? txTime = '',
    String? signature = '',
    String? secretKey = '',
  }) async {
    final ffApiRequestBody = '''
{
  "orderId": "$orderId",
  "orderAmount": "$orderAmount",
  "referenceId": "$referenceId",
  "txStatus": "$txStatus",
  "paymentMode": "$paymentMode",
  "txMsg": "$txMsg",
  "txTime": "$txTime",
  "signature": "$signature",
  "secretKey": "$secretKey"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verifySignature',
      apiUrl: 'http://192.168.6.128/cashfree/signature/',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
