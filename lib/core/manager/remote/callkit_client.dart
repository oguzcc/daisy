// import 'dart:async';
// import 'dart:convert';

// import 'dart:developer' show log;
// import 'dart:io';
// import 'dart:math' hide log;
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
// import 'package:flutter_callkit_incoming/entities/entities.dart';
// import 'package:expathy/router/router.dart';
// import 'package:expathy/router/screens.dart';
// import 'package:uikit/modal/show.dart';

// import '../../../data/model/notification/notificaiton_payload_model.dart';

// class CallKitClient {
//   // Singleton instance
//   static final CallKitClient _instance = CallKitClient._internal();

//   factory CallKitClient() {
//     return _instance;
//   }

//   CallKitClient._internal() {
//     _initialize();
//   }

//   final String _logTag = 'CallService';

//   // StreamController for broadcasting call events
//   final _callEventController = StreamController<CallEvent>.broadcast();

//   // Expose a stream of call events
//   Stream<CallEvent> get onCallEvent => _callEventController.stream;

//   void _initialize() {
//     FlutterCallkitIncoming.onEvent.listen((event) {
//       if (event != null) {
//         _callEventController.add(event);
//         _handleCallEvent(event);
//       } else {
//         log('Received null event', name: _logTag);
//       }
//     });
//   }

//   /// Generate a random UUID
//   /// Used to generate a unique call ID
//   /// for each incoming call
//   String generateUUID() {
//     final Random random = Random();
//     final StringBuffer uuid = StringBuffer();

//     for (int i = 0; i < 32; i++) {
//       int value = random.nextInt(16);
//       if (i == 8 || i == 12 || i == 16 || i == 20) {
//         uuid.write('-');
//       }
//       if (i == 12) {
//         value = 4;
//       } else if (i == 16) {
//         value = (value & 0x3) | 0x8;
//       }
//       uuid.write(value.toRadixString(16));
//     }

//     return uuid.toString();
//   }

//   /// Show incoming call screen
//   /// with the provided caller information
//   Future<void> showIncomingCall(
//       {RemoteNotification? notification,
//       required Map<String, dynamic> data}) async {
//     log('Show incoming call: $data', name: _logTag);
//     log('Notification: $notification', name: _logTag);

//     CallKitParams callKitParams = CallKitParams(
//       id: generateUUID(),
//       nameCaller: notification?.title?.toUpperCase() ?? "(Unknown Name) Psy",
//       appName: 'Expathy',
//       avatar: 'https://via.placeholder.com/150',
//       handle: 'Calling...',
//       type: 1,
//       textAccept: 'Accept',
//       textDecline: 'Decline',
//       missedCallNotification: const NotificationParams(
//         showNotification: true,
//         isShowCallback: false,
//         subtitle: 'Missed call',
//         callbackText: 'Contact with your psychologist',
//       ),
//       duration: 30000,
//       extra: data,
//       headers: <String, dynamic>{'apiKey': 'Abc@123!', 'platform': 'flutter'},
//       android: const AndroidParams(
//           isCustomNotification: true,
//           isShowLogo: false,
//           ringtonePath: 'system_ringtone_default',
//           backgroundColor: '#0955fa',
//           backgroundUrl: 'https://via.placeholder.com/150',
//           actionColor: '#4CAF50',
//           textColor: '#ffffff',
//           incomingCallNotificationChannelName: "Incoming Video Call",
//           missedCallNotificationChannelName: "Missed Video Call",
//           isShowCallID: false),
//       ios: const IOSParams(
//         iconName: 'CallKitLogo',
//         handleType: 'generic',
//         supportsVideo: true,
//         maximumCallGroups: 2,
//         maximumCallsPerCallGroup: 1,
//         audioSessionMode: 'default',
//         audioSessionActive: true,
//         audioSessionPreferredSampleRate: 44100.0,
//         audioSessionPreferredIOBufferDuration: 0.005,
//         supportsDTMF: true,
//         supportsHolding: false,
//         supportsGrouping: false,
//         supportsUngrouping: false,
//         ringtonePath: 'system_ringtone_default',
//       ),
//     );
//     await FlutterCallkitIncoming.showCallkitIncoming(callKitParams);
//   }

//   /// Handle incoming call events
//   /// and perform necessary actions
//   Future<void> _handleCallEvent(CallEvent event) async {
//     switch (event.event) {
//       case Event.actionCallIncoming:
//         // Uncomment if you need to log incoming call
//         // log('Incoming call from ${event.event} ${event.body}', name: _logTag);
//         break;

//       case Event.actionCallStart:
//         log('Call started from ${event.event} ${event.body}', name: _logTag);
//         break;

//       case Event.actionCallAccept:
//         await FlutterCallkitIncoming.setCallConnected(event.body['id']);
//         if (event.body['extra']['agoraToken'] == null ||
//             event.body['extra']['agoraToken'].isEmpty) {
//           _handleCallAcceptForeground(event.body);
//         } else {
//           _handleCallAcceptBackground(event.body);
//         }

//         break;

//       case Event.actionCallDecline:
//         log('Call declined ${Event.actionCallDecline}', name: _logTag);
//         break;

//       case Event.actionCallEnded:
//       case Event.actionCallTimeout:
//       case Event.actionCallToggleAudioSession:
//         await FlutterCallkitIncoming.endAllCalls();
//         break;

//       default:
//         log('Unknown event: ${event.event}', name: _logTag);
//         break;
//     }
//   }

//   /// Handle incoming call accept event
//   Future<void> _handleCallAcceptBackground(Map<String, dynamic> body) async {
//     final payload = body;

//     debugPrint('XXXXX---> Background Payload: $payload');

//     final callNotificationPayload = CallNotificationPayload(
//       channel: payload['extra']['channelId'],
//       token: payload['extra']['agoraToken'],
//       callingTime: int.tryParse(payload['extra']['callingTime'] ?? '0'),
//       callerImageUrl: payload['extra']['callerImageUrl'],
//       psyFcmToken: payload['extra']['advisorToken'],
//       callerName: payload['extra']['callerName'],
//     );

//     if (callNotificationPayload.token == null ||
//         callNotificationPayload.token!.isEmpty) {
//       Show.bannerTop('This call is not available at the moment. [BG]');
//       return;
//     }

//     final channelId = callNotificationPayload.channel;
//     final agoraToken = callNotificationPayload.token;
//     final psyToken = callNotificationPayload.psyFcmToken;
//     final nameCaller = callNotificationPayload.callerName ?? 'Psychologist';
//     final callTime = callNotificationPayload.endTime;
//     final callingTime = callNotificationPayload.callingTime;

//     final extra = {
//       'token': agoraToken,
//       'channel': channelId,
//       'endTime': callTime,
//       'callingTime': callingTime,
//       'callerName': nameCaller,
//       'callerImageUrl': callNotificationPayload.callerImageUrl,
//     };

//     debugPrint('XXXXX---> Extra: $extra');

//     await Future.delayed(const Duration(seconds: 3), () {
//       goRouter.pushNamed(Screens.call.name, extra: extra);
//     });

//     callNotificationPayload.clear();
//   }

//   void _handleCallAcceptForeground(Map<String, dynamic> body) {
//     final payload = body['extra']['payload'];

//     debugPrint('XXXXX---> Payload: $payload');
//     if (payload == null) {
//       Show.bannerTop('This call is not available at the moment');
//       return;
//     }

//     final callNotificationPayload =
//         CallNotificationPayload.fromJson(jsonDecode(payload as String));

//     if (callNotificationPayload.token == null) {
//       Show.bannerTop('This call is not available at the moment');
//       return;
//     }

//     final channelId = callNotificationPayload.channel;
//     final agoraToken = callNotificationPayload.token;
//     final psyToken = callNotificationPayload.psyFcmToken;
//     const nameCaller = 'Psychologist';
//     final callTime = callNotificationPayload.endTime;
//     final callingTime = callNotificationPayload.callingTime;

//     final extra = {
//       'token': agoraToken,
//       'channel': channelId,
//       'endTime': callTime,
//       'callingTime': callingTime,
//       'callerName': nameCaller,
//       'callerImageUrl': callNotificationPayload.callerImageUrl,
//     };

//     debugPrint('XXXXX---> Extra: $extra');

//     Future.delayed(const Duration(seconds: 3), () {
//       goRouter.pushNamed(
//         Screens.call.name,
//         extra: extra,
//       );
//     });

//     callNotificationPayload.clear();
//   }

//   Future<String> deviceVoipToken() async {
//     var token = await FlutterCallkitIncoming.getDevicePushTokenVoIP();
//     return Platform.isIOS ? token : '';
//   }

//   /// End all active calls
//   Future<void> endAllCalls() async {
//     await FlutterCallkitIncoming.endAllCalls();
//   }

//   /// Get active calls
//   Future<void> getActiveCalls() async {
//     var calls = await FlutterCallkitIncoming.activeCalls();
//     log('Active calls: $calls', name: _logTag);
//   }

//   /// Dispose of the CallService
//   void dispose() {
//     _callEventController.close();
//   }
// }
