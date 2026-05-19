import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/constants/app_constants.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'package:nour_arch/core/widgets/common/animated_fade_widget.dart';
import 'package:nour_arch/core/widgets/common/section_title.dart';
import 'video_play_button.dart';
import 'video_thumbnail.dart';

/// Video preview section with a play button overlay.
/// Tapping calls [onInfoTapped] to show the details popup.
class VideoSection extends StatelessWidget {
  const VideoSection({super.key, this.onInfoTapped});

  final VoidCallback? onInfoTapped;

  double _videoHeight(BuildContext context) => ResponsiveHelper.value(
    context,
    mobile: 220.0,
    tablet: 320.0,
    desktop: 460.0,
  );

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.pagePadding(context);
    final vPad = ResponsiveHelper.sectionPadding(context);

    return Container(
      color: AppColors.creamLight,
      padding: EdgeInsets.symmetric(horizontal: hPad, vertical: vPad),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: AnimatedFadeWidget(
            delay: const Duration(milliseconds: 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SectionTitle(title: 'Project Overview'),
                const SizedBox(height: 16),
                Text(
                  'Our project prioritizes environmental integration, utilizing eco-friendly '
                  'materials and energy-efficient systems to establish a resilient and '
                  'sustainable urban framework for the future. Watch the introductory video below '
                  'to learn more about our vision and design process.',
                  style: AppTextStyles.bodyMedium,
                ),
                const SizedBox(height: 32),
                GestureDetector(
                  onTap: onInfoTapped,
                  child: MouseRegion(
                    cursor: onInfoTapped != null
                        ? SystemMouseCursors.click
                        : SystemMouseCursors.basic,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                        AppConstants.radiusLg,
                      ),
                      child: SizedBox(
                        height: _videoHeight(context),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            // Thumbnail image
                            const VideoThumbnail(),

                            // Play Button
                            const VideoPlayButton(),

                            // Tap hint
                            if (onInfoTapped != null)
                              Positioned(
                                top: 12,
                                left: 12,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black38,
                                    borderRadius: BorderRadius.circular(
                                      AppConstants.radiusCircle,
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.info_outline,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        'Details',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            // Label
                            Positioned(
                              bottom: 16,
                              right: 20,
                              child: Text(
                                'VIDEO PREVIEW',
                                style: AppTextStyles.label.copyWith(
                                  color: AppColors.creamLight.withValues(
                                    alpha: 0.7,
                                  ),
                                ),
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
