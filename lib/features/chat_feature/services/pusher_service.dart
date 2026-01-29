import 'package:flutter/widgets.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

final _apiKey = '77bdbdd971e8b1fb165c';
final _cluster = 'mt1';

class PusherService {
  static final PusherChannelsFlutter pusher =
      PusherChannelsFlutter.getInstance();

  static Future<void> init() async {
    await pusher.init(
      apiKey: _apiKey,
      cluster: _cluster,
      //online, offline بيعرفنا حالة ل user
      onConnectionStateChange: (currentState, previousState) {
        debugPrint(
          "Pusher connection state: $currentState, previous: $previousState",
        );
      },

      onError: (_, _, error) {
        debugPrint("Pusher error: ${error!.message}");
      },
      onSubscriptionSucceeded: (channelName, _) {
        debugPrint("Subscribed to $channelName successfully");
      },
    );

    await pusher.connect();
  }

  static Future<void> subscribeToChat(
    String chatId,
    Function(dynamic) onEvent,
  ) async {
    await pusher.subscribe(
      channelName: 'conversation-$chatId',
      onEvent: (event) {
        onEvent(event);
      },
    );
  }

  static Future<void> unSubscribe(String chatId) async {
    await pusher.unsubscribe(channelName: 'conversation-$chatId');
  }
}
