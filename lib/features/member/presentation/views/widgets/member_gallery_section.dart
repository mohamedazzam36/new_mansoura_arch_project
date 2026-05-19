import 'package:flutter/material.dart';
import 'package:nour_arch/core/theme/app_colors.dart';
import 'package:nour_arch/core/theme/app_styles.dart';
import 'package:nour_arch/core/constants/app_constants.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'package:nour_arch/features/member/data/models/member_model.dart';
import 'package:nour_arch/core/widgets/media_detail/media_detail_dialog.dart';

class MemberGallerySection extends StatelessWidget {
  const MemberGallerySection({super.key, required this.images});
  final List<MemberImageModel> images;

  int _crossAxisCount(BuildContext context) =>
      ResponsiveHelper.value(context, mobile: 2, tablet: 3, desktop: 4);

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.pagePadding(context);
    final cols = _crossAxisCount(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: images.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cols,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.0,
        ),
        itemBuilder: (_, i) => MemberPhotoCard(image: images[i]),
      ),
    );
  }
}

class MemberPhotoCard extends StatefulWidget {
  const MemberPhotoCard({super.key, required this.image});
  final MemberImageModel image;

  @override
  State<MemberPhotoCard> createState() => _MemberPhotoCardState();
}

class _MemberPhotoCardState extends State<MemberPhotoCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => showMediaDetailDialog(
          context,
          imagePath: widget.image.path,
          title: widget.image.title,
          description:
              widget.image.description ??
              'An architectural design by the project team.',
          designer: widget.image.designer ?? 'Architectural Engineering Dept.',
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.radiusMd),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                widget.image.path,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  color: AppColors.creamDark,
                  child: const Icon(
                    Icons.image_outlined,
                    color: AppColors.brownMedium,
                    size: 40,
                  ),
                ),
              ),
              AnimatedContainer(
                duration: AppConstants.animFast,
                color: _hovered
                    ? AppColors.brownDeep.withValues(alpha: 0.55)
                    : AppColors.brownDeep.withValues(alpha: 0.25),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    widget.image.title,
                    style: AppTextStyles.caption.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              if (_hovered)
                const Center(
                  child: Icon(
                    Icons.zoom_in_rounded,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
