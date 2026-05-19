import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/constants/app_constants.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'perspective_dialog.dart';

/// Interactive 360° perspective viewer using [panorama_viewer].
/// Tapping the preview opens a fullscreen dialog.
class PerspectiveViewer extends StatefulWidget {
  const PerspectiveViewer({super.key, required this.assetPath});

  final String assetPath;

  @override
  State<PerspectiveViewer> createState() => _PerspectiveViewerState();
}

class _PerspectiveViewerState extends State<PerspectiveViewer> {
  bool _hovered = false;

  double _height(BuildContext ctx) =>
      ResponsiveHelper.value(ctx, mobile: 240.0, tablet: 340.0, desktop: 460.0);

  @override
  Widget build(BuildContext context) {
    final height = _height(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => showPerspectiveDialog(context, assetPath: widget.assetPath),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.radiusLg),
          child: SizedBox(
            height: height,
            child: Stack(
              children: [
                // ── Panorama preview (interactive in the card too) ───────
                Positioned.fill(
                  child: PanoramaViewer(
                    child: Image.asset(widget.assetPath),
                  ),
                ),

                // ── Hover overlay with expand icon ───────────────────────
                Positioned.fill(
                  child: IgnorePointer(
                    child: AnimatedContainer(
                      duration: AppConstants.animFast,
                      color: _hovered
                          ? Colors.black.withValues(alpha: 0.3)
                          : Colors.transparent,
                      child: _hovered
                          ? const Center(
                              child: Icon(
                                Icons.fullscreen_rounded,
                                color: Colors.white,
                                size: 48,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),

                // ── 360° badge ───────────────────────────────────────────
                Positioned(
                  top: 12,
                  right: 12,
                  child: IgnorePointer(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.brownPrimary.withValues(alpha: 0.85),
                        borderRadius:
                            BorderRadius.circular(AppConstants.radiusCircle),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.rotate_90_degrees_cw_outlined,
                              color: Colors.white, size: 12),
                          SizedBox(width: 4),
                          Text(
                            '360°',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // ── Tap to expand hint (bottom) ──────────────────────────
                Positioned(
                  bottom: 12,
                  left: 0,
                  right: 0,
                  child: IgnorePointer(
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(
                              AppConstants.radiusCircle),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.fullscreen_rounded,
                                color: Colors.white, size: 13),
                            const SizedBox(width: 5),
                            Text(
                              'Tap to open fullscreen',
                              style: AppTextStyles.caption.copyWith(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ],
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
