// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_details_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _UserDetailsClient implements UserDetailsClient {
  _UserDetailsClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  getUserDetail(page) async {
    ArgumentError.checkNotNull(page, 'page');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{'page': page};
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'https://reqres.in/api/users',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = UserModel.fromJson(_result.data);
    return Future.value(value);
  }
}
