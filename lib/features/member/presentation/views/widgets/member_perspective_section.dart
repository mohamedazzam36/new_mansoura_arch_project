import 'package:flutter/material.dart';
import 'package:nour_arch/core/utils/responsive_helper.dart';
import 'package:nour_arch/core/widgets/perspective_viewer/perspective_viewer.dart';

class MemberPerspectiveSection extends StatelessWidget {
  const MemberPerspectiveSection({super.key, required this.assetPath});
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final hPad = ResponsiveHelper.pagePadding(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPad),
      child: PerspectiveViewer(assetPath: assetPath),
    );
  }
}
