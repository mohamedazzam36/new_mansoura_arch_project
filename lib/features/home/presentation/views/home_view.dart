import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nour_arch/core/constants/team_carousel_data.dart';
import 'package:nour_arch/core/constants/team_members_data.dart';
import 'package:nour_arch/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:nour_arch/features/home/data/models/carousel_item_model.dart';
import 'package:nour_arch/features/member/data/models/member_model.dart';
import 'package:nour_arch/features/member/presentation/views/member_view.dart';
import 'package:nour_arch/core/widgets/media_detail/media_detail_dialog.dart';
import 'package:nour_arch/core/widgets/video_player/video_player_dialog.dart';
import 'package:nour_arch/core/constants/asset_paths.dart';
import 'package:nour_arch/features/home/presentation/views/widgets/app_bar/custom_app_bar.dart';
import 'package:nour_arch/features/home/presentation/views/widgets/hero_carousel/hero_carousel_section.dart';
import 'package:nour_arch/features/home/presentation/views/widgets/vision/vision_section.dart';
import 'package:nour_arch/features/home/presentation/views/widgets/video/video_section.dart';
import 'package:nour_arch/features/home/presentation/views/widgets/members/members_section.dart';
import 'package:nour_arch/features/home/presentation/views/widgets/footer/footer_section.dart';
import 'package:nour_arch/features/home/presentation/views/widgets/app_bar/home_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();

  final _keys = {
    HomeSection.hero: GlobalKey(),
    HomeSection.vision: GlobalKey(),
    HomeSection.video: GlobalKey(),
    HomeSection.contact: GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(BuildContext ctx, HomeSection section) {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.of(ctx).pop();
    }
    ctx.read<HomeCubit>().navigate(section);
    Future.delayed(const Duration(milliseconds: 300), () {
      final key = _keys[section];
      if (key?.currentContext != null) {
        Scrollable.ensureVisible(
          key!.currentContext!,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeInOutCubic,
        );
      }
    });
  }

  void _openMemberPage(MemberModel member) {
    if (_scaffoldKey.currentState?.isDrawerOpen ?? false) {
      Navigator.of(context).pop();
    }
    Future.delayed(const Duration(milliseconds: 250), () {
      if (mounted) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MemberView(member: member)),
        );
      }
    });
  }

  void _showCarouselDetail(BuildContext ctx, CarouselItemModel item) {
    showMediaDetailDialog(
      ctx,
      imagePath: item.imagePath,
      title: item.title,
      description: item.description ?? '',
      designer: item.designer ?? '',
    );
  }

  void _showVideoDetail(BuildContext ctx) {
    showVideoPlayerDialog(
      ctx,
      assetPath: AssetPaths.video1,
      title: 'Project Story',
      description: teamVideoDescription,
      designer: teamVideoDesigner,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: Builder(
        builder: (ctx) => Scaffold(
          key: _scaffoldKey,
          drawer: HomeDrawer(
            onNavTap: (s) => _scrollToSection(ctx, s),
            onMemberTap: _openMemberPage,
            members: teamMembers,
          ),
          appBar: CustomAppBar(
            onMenuTap: () => _scaffoldKey.currentState?.openDrawer(),
            onLogoTap: () => _scrollToSection(ctx, HomeSection.hero),
            onNavItemTap: (key) {
              final map = {
                'vision': HomeSection.vision,
                'video': HomeSection.video,
                'contact': HomeSection.contact,
              };
              if (map.containsKey(key)) _scrollToSection(ctx, map[key]!);
            },
          ),
          body: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                HeroCarouselSection(
                  key: _keys[HomeSection.hero],
                  items: teamCarouselItems,
                  onItemTapped: (item) => _showCarouselDetail(ctx, item),
                ),
                VisionSection(key: _keys[HomeSection.vision]),
                VideoSection(
                  key: _keys[HomeSection.video],
                  onInfoTapped: () => _showVideoDetail(ctx),
                ),
                MembersSection(members: teamMembers),
                FooterSection(key: _keys[HomeSection.contact]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
