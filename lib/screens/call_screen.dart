import 'dart:math';

import 'package:doctor_consultation/models/doctor.dart';
import 'package:doctor_consultation/utils/zego_config.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:zego_uikit/zego_uikit.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallScreen extends StatefulWidget {
  final Doctor doctor;
  const CallScreen({super.key, required this.doctor});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late final String userId;
  final String userName = "Patient";
  late final String callId;
  bool _granted = false;
  bool _checking = true;

  @override
  void initState() {
    super.initState();
    userId = 'patient_${Random().nextInt(10000)}';
    callId =
        'consultation_${widget.doctor.id}_${DateTime.now().microsecondsSinceEpoch}';
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    final cam = await Permission.camera.status;
    final mic = await Permission.microphone.status;
    if (cam.isGranted && mic.isGranted) {
      setState(() {
        _granted = true;
        _checking = false;
      });
      return;
    }

    final statuses = await [Permission.camera, Permission.microphone].request();
    setState(() {
      _granted =
          statuses[Permission.camera]?.isGranted == true &&
          statuses[Permission.microphone]?.isGranted == true;
      _checking = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_checking) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!_granted) {
      return Scaffold(
        appBar: AppBar(title: const Text('Permissions required')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Camera and microphone permissions are required to make calls.',
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _checkPermissions,
                child: const Text('Grant permissions'),
              ),
            ],
          ),
        ),
      );
    }

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
            title: widget.doctor.name,
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
                      image: NetworkImage(widget.doctor.imageUrl),
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
                      const Icon(
                        Icons.circle,
                        color: Color(0xFF00BFA5),
                        size: 8,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        user?.name ?? 'unknown',
                        style: const TextStyle(
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
