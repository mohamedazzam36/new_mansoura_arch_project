import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/constants/app_constants.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Public helper — opens the 360° viewer inside a full-screen dialog.
// ─────────────────────────────────────────────────────────────────────────────
void showPerspectiveDialog(BuildContext context, {required String assetPath}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close 360°',
    barrierColor: Colors.black.withValues(alpha: 0.88),
    transitionDuration: const Duration(milliseconds: 320),
    pageBuilder: (_, _, _) => PerspectiveDialog(assetPath: assetPath),
    transitionBuilder: (_, anim, _, child) => FadeTransition(
      opacity: CurvedAnimation(parent: anim, curve: Curves.easeOut),
      child: child,
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// Full-screen dialog widget
// ─────────────────────────────────────────────────────────────────────────────
class PerspectiveDialog extends StatefulWidget {
  const PerspectiveDialog({super.key, required this.assetPath});
  final String assetPath;

  @override
  State<PerspectiveDialog> createState() => _PerspectiveDialogState();
}

class _PerspectiveDialogState extends State<PerspectiveDialog> {
  bool _showHint = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showHint = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 900;

    // Fixed wide dimensions: 90% width (max 1000), height = width / 2.2
    final w = isDesktop
        ? (size.width * 0.88).clamp(600.0, 1000.0)
        : size.width * 0.96;
    final h = (w / 2.2).clamp(260.0, size.height * 0.80);

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: w,
          height: h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.radiusXl),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 48,
                spreadRadius: 4,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppConstants.radiusXl),
            child: Stack(
              children: [
                // ── Panorama fills the container ─────────────────────────
                PanoramaViewer(
                  child: Image.asset(widget.assetPath),
                ),

                // ── Close button ─────────────────────────────────────────
                Positioned(
                  top: 12,
                  right: 12,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.6),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.close,
                          color: Colors.white, size: 22),
                    ),
                  ),
                ),

                // ── 360° label (top-left) ────────────────────────────────
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.brownPrimary.withValues(alpha: 0.85),
                      borderRadius: BorderRadius.circular(AppConstants.radiusCircle),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.rotate_90_degrees_cw_outlined,
                            color: Colors.white, size: 14),
                        SizedBox(width: 6),
                        Text(
                          '360°  Perspective',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // ── Drag hint badge ────────────────────────────────────────
                Positioned(
                  bottom: 16,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: AnimatedOpacity(
                      opacity: _showHint ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 600),
                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.55),
                            borderRadius:
                                BorderRadius.circular(AppConstants.radiusCircle),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.open_with_rounded,
                                  color: Colors.white, size: 16),
                              const SizedBox(width: 8),
                              Text(
                                'Drag to explore 360°',
                                style: AppTextStyles.caption.copyWith(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
