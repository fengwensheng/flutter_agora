import 'package:flutter_agora/common/vi_dio.dart';

class DiscoverApi {
  static final search_path = '/search';

  static Future<String> search({
    required keywords,
  }) async {
    String data = await ViDio().get(
      path: search_path,
      para: {
        'term': keywords,
        // 'country': 'CN',
        'media': 'podcast',
      },
    );
    return data;
  }
}
