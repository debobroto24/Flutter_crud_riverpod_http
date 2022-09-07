import 'package:flutte_crud_riverpod_http/model/user_model.dart';
import 'package:flutte_crud_riverpod_http/repositories/userRepository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final UserRepositoryProvider =
    Provider<IUserRepositoy>((ref) => UserRepository());

final userList = FutureProvider.autoDispose<UserModel>((ref) async {
  final repositoy = ref.watch(UserRepositoryProvider);
  return repositoy.fetchUserList();
});
