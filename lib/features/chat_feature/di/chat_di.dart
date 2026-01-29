import 'package:mega_ecommerce_app/core/di/dependency_injection.dart';
import 'package:mega_ecommerce_app/features/chat_feature/data/data_source/chat_remote_data_source.dart';
import 'package:mega_ecommerce_app/features/chat_feature/data/repository_implement/chat_repository_implement.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/repository/chat_repository.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/use_cases/get_all_chats_use_case.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/use_cases/get_chat_details_use_case.dart';
import 'package:mega_ecommerce_app/features/chat_feature/domain/use_cases/send_message_use_case.dart';
import 'package:mega_ecommerce_app/features/chat_feature/presentation/cubits/chat/chat_cubit.dart';
import 'package:mega_ecommerce_app/features/chat_feature/presentation/cubits/chat_details/chat_details_cubit.dart';
import 'package:mega_ecommerce_app/features/chat_feature/presentation/cubits/send_message/send_message_cubit.dart';

Future<void> chatDi() async {
  /// Cubits
  sl.registerFactory(() => ChatCubit(sl()));
  sl.registerFactory(() => ChatDetailsCubit(sl()));
  sl.registerFactory(() => SendMessageCubit(sl()));

  
  //!useCase
  sl.registerLazySingleton(() => GetAllChatsUseCase(chatRepo: sl()));
  sl.registerLazySingleton(() => GetChatDetailsUseCase(chatRepo: sl()));
  sl.registerLazySingleton(() => SendMessageUseCase(chatRepo: sl()));


  //!repo
  sl.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImplement(chatRemoteDataSource: sl()),
  );

  //! Data sources
  sl.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImplement(apiHelper: sl()),
  );
}