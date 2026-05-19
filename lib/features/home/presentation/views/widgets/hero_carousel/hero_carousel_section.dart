import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nour_arch/core/constants/app_constants.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'package:nour_arch/features/home/data/models/carousel_item_model.dart';
import 'hero_carousel_indicator.dart';
import 'hero_carousel_slide.dart';

/// Full-width hero image carousel with auto-scroll, dot indicators,
/// and tap-to-detail support.
class HeroCarouselSection extends StatefulWidget {
  const HeroCarouselSection({
    super.key,
    required this.items,
    this.onItemTapped,
  });

  final List<CarouselItemModel> items;
  final void Function(CarouselItemModel item)? onItemTapped;

  @override
  State<HeroCarouselSection> createState() => _HeroCarouselSectionState();
}

class _HeroCarouselSectionState extends State<HeroCarouselSection> {
  late final PageController _pageController;
  late final Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _timer = Timer.periodic(AppConstants.carouselAutoScrollInterval, (_) {
      if (!mounted) return;
      final next = (_currentIndex + 1) % widget.items.length;
      _pageController.animateToPage(
        next,
        duration: AppConstants.carouselTransitionDuration,
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = ResponsiveHelper.heroHeight(context);

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          // ── Slides ──────────────────────────────────────────────────
          PageView.builder(
            controller: _pageController,
            itemCount: widget.items.length,
            onPageChanged: (i) => setState(() => _currentIndex = i),
            itemBuilder: (_, index) {
              final item = widget.items[index];
              return GestureDetector(
                onTap: () => widget.onItemTapped?.call(item),
                child: MouseRegion(
                  cursor: widget.onItemTapped != null
                      ? SystemMouseCursors.click
                      : SystemMouseCursors.basic,
                  child: HeroCarouselSlide(item: item),
                ),
              );
            },
          ),

          // ── Bottom gradient fade ─────────────────────────────────────
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: height * 0.40,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xDD000000).withValues(alpha: 0.4),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ── Tap hint icon ────────────────────────────────────────────
          if (widget.onItemTapped != null)
            Positioned(
              top: 12,
              right: 12,
              child: IgnorePointer(
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
                  child: IgnorePointer(
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.touch_app_outlined,
                          color: Colors.white,
                          size: 14,
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Tap for details',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          // ── Dot indicators ───────────────────────────────────────────
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.items.length,
                (index) => HeroCarouselIndicator(
                  isActive: index == _currentIndex,
                  onTap: () => _pageController.animateToPage(
                    index,
                    duration: AppConstants.carouselTransitionDuration,
                    curve: Curves.easeInOut,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
