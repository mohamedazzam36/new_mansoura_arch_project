import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/constants/app_constants.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'media_detail_image.dart';
import 'media_detail_info.dart';

/// Shows an animated popup dialog whose size adapts to the image's natural aspect ratio.
void showMediaDetailDialog(
  BuildContext context, {
  required String imagePath,
  required String description,
  required String designer,
  String? title,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close',
    barrierColor: Colors.black.withValues(alpha: 0.78),
    transitionDuration: const Duration(milliseconds: 380),
    pageBuilder: (_, _, _) => MediaDetailDialog(
      imagePath: imagePath,
      description: description,
      designer: designer,
      title: title,
    ),
    transitionBuilder: (_, anim, _, child) {
      final curved = CurvedAnimation(parent: anim, curve: Curves.easeOutBack);
      return FadeTransition(
        opacity: CurvedAnimation(parent: anim, curve: Curves.easeOut),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.80, end: 1.0).animate(curved),
          child: child,
        ),
      );
    },
  );
}

/// The dialog widget rendered inside [showMediaDetailDialog].
class MediaDetailDialog extends StatelessWidget {
  const MediaDetailDialog({
    super.key,
    required this.imagePath,
    required this.description,
    required this.designer,
    this.title,
  });

  final String imagePath;
  final String description;
  final String designer;
  final String? title;

  Widget _buildImageSpacer(double dialogWidth) {
    return Opacity(
      opacity: 0,
      child: Image.asset(
        imagePath,
        width: dialogWidth,
        fit: BoxFit.fitWidth,
        errorBuilder: (_, _, _) => SizedBox(
          width: dialogWidth,
          height: dialogWidth / 2.0,
          child: const ColoredBox(
            color: AppColors.brownMedium,
            child: Center(
              child: Icon(
                Icons.image_outlined,
                size: 64,
                color: AppColors.creamLight,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDesktop = ResponsiveHelper.isDesktop(context);

    final dialogWidth = isDesktop
        ? (size.width * 0.80).clamp(500.0, 860.0)
        : size.width * 0.95;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: dialogWidth,
          constraints: BoxConstraints(maxHeight: size.height * 0.92),
          decoration: BoxDecoration(
            color: AppColors.creamLight,
            borderRadius: BorderRadius.circular(AppConstants.radiusXl),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 48,
                spreadRadius: 4,
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              // ── Scrollable content column (with invisible image spacer) ─
              ClipRRect(
                borderRadius: BorderRadius.circular(AppConstants.radiusXl),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Invisible spacer — reserves the exact same space as the image
                    _buildImageSpacer(dialogWidth),

                    // ── Description + designer ──────────────────────────
                    Flexible(
                      child: MediaDetailInfo(
                        title: title,
                        description: description,
                        designer: designer,
                      ),
                    ),
                  ],
                ),
              ),

              // ── Image layer — stays fixed, overflows over text when zoomed ─
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: MediaDetailImage(
                  imagePath: imagePath,
                  width: dialogWidth,
                ),
              ),

              // ── Close button — always on top ───────────────────────────
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xBB000000),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
