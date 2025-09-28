// File: chat_repository.dart
import 'package:file_picker/file_picker.dart';
import 'package:bloc_basic_template/common/chat/model/chat_list_item_model.dart';
import 'package:bloc_basic_template/common/chat/model/chat_model.dart';
import 'package:bloc_basic_template/core/config/network/response_state.dart';

abstract class ChatRepository {
  Future<ResponseState<List<ChatListItemModel>>> fetchChatList({required int page});
  Future<ResponseState<List<ChatModel>>> fetchChat({required int page, required String chatId});
  Future<bool> sendMessage({
    required String message,
    required String chatId,
    required String userId,
    List<PlatformFile>? file,
  });
}
