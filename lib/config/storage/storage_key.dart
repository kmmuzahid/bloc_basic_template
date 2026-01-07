/*
 * @Author: Km Muzahid
 * @Date: 2026-01-07 15:14:48
 * @Email: km.muzahid@gmail.com
 */
import 'package:mygarage/config/storage/storage.dart';

class StorageService {
  StorageService._();
  static final StorageService instance = StorageService._();

  Future<String?> get accessToken => Storage.instance.read('access_token');
  set accessToken(String value) => Storage.instance.write('access_token', value);

  Future<String?> get refreshToken => Storage.instance.read('refresh_token');
  set refreshToken(String value) => Storage.instance.write('refresh_token', value);
}
