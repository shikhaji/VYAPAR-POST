import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_asset.dart';
import '../utils/app_color.dart';
import '../utils/app_text_style.dart';
import '../utils/screen_utils.dart';

class PrimaryBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const PrimaryBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      onTap: onTap,
      showSelectedLabels: true,
      selectedLabelStyle:
      AppTextStyle.body1.copyWith(color: AppColor.primaryBlue),
      unselectedLabelStyle: AppTextStyle.body1,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: _buildImageIcon(AppAsset.home),
          activeIcon: _buildImageIcon(AppAsset.homeFill),
        ),
        BottomNavigationBarItem(
          label: 'Post ad',
          icon: _buildImageIcon(AppAsset.plus),
          activeIcon: _buildImageIcon(AppAsset.plusFill),
        ),
        BottomNavigationBarItem(
          label: 'Wallet',

          icon: _buildImageIcon(AppAsset.wallet),
          activeIcon: _buildImageIcon(AppAsset.walletFill),
        ),
        BottomNavigationBarItem(
          label: 'Profile',
          icon: _buildImageIcon(AppAsset.user),
          activeIcon: _buildImageIcon(AppAsset.userFill),
        ),
      ],
    );
  }

  Widget _buildImageIcon(String imagePath, {double size = 22}) {
    return Image.asset(
      imagePath,
      height: ScreenUtil().setHeight(size),
      width: ScreenUtil().setHeight(size),
    );
  }
}
