import 'package:flutter/material.dart';
import 'video_player_dialog_ui.dart';

/// Shows the video player in a popup dialog.
void showVideoPlayerDialog(
  BuildContext context, {
  required String assetPath,
  required String title,
  required String description,
  required String designer,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close',
    barrierColor: Colors.black.withValues(alpha: 0.85),
    transitionDuration: const Duration(milliseconds: 320),
    pageBuilder: (_, _, _) => VideoPlayerDialogUi(
      assetPath: assetPath,
      title: title,
      description: description,
      designer: designer,
    ),
    transitionBuilder: (_, anim, _, child) => FadeTransition(
      opacity: CurvedAnimation(parent: anim, curve: Curves.easeOut),
      child: ScaleTransition(
        scale: Tween<double>(
          begin: 0.88,
          end: 1.0,
        ).animate(CurvedAnimation(parent: anim, curve: Curves.easeOutBack)),
        child: child,
      ),
    ),
  );
}
