import 'dart:math';

import 'package:doctor_consultation/models/doctor.dart';
import 'package:doctor_consultation/utils/zego_config.dart';
import 'package:flutter/material.dart';
import 'package:zego_uikit/zego_uikit.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallScreen extends StatelessWidget {
  final Doctor doctor;
  const CallScreen({super.key, required this.doctor});

  // generate unique user ID and call ID for demo purpose
  String get userId => 'patient_${Random().nextInt(10000)}';
  String get userName => "Dear Pro";
  String get callId =>
      'consultation_${doctor.id}_${DateTime.now().microsecondsSinceEpoch}';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltCall(
        appID: ZegoConfig.appID,
        appSign: ZegoConfig.appSign,
        callID: callId,
        userID: userId,
        userName: userName,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
          ..topMenuBar = ZegoCallTopMenuBarConfig(
            isVisible: true,
            title: doctor.name,
          )
          ..avatarBuilder =
              (
                BuildContext context,
                Size size,
                ZegoUIKitUser? user,
                Map extraInfo,
              ) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(doctor.imageUrl),
                      fit: BoxFit.cover,
                    ),
                    border: Border.all(color: Color(0xFf00BFA5), width: 3),
                  ),
                );
              }
          ..audioVideoView = ZegoCallAudioVideoViewConfig(
            showSoundWavesInAudioMode: true,
            useVideoViewAspectFill: true,
            foregroundBuilder: (context, size, user, extraInfo) {
              return Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.circle, color: Color(0xFF00BFA5), size: 8),
                      SizedBox(width: 6),
                      Text(
                        user?.name ?? 'unknown',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
      ),
    );
  }
}
