import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vyapar_post/views/Dashboard/post_ad_Screen.dart';
import 'package:vyapar_post/views/Dashboard/profile_screen.dart';
import 'package:vyapar_post/views/Dashboard/wallet_screen.dart';
import 'package:vyapar_post/widget/scroll_view.dart';

import '../../routs/arguments.dart';
import '../../utils/app_sizes.dart';
import '../../utils/screen_utils.dart';
import '../../widget/drawer_widget.dart';
import '../../widget/primary_bottom_navigtion_bar.dart';
import 'home_screen.dart';

class MainHomeScreen extends StatefulWidget {
  final SendArguments? arguments;

  const MainHomeScreen({Key? key,required this.arguments}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  bool isMenuOpen = false;
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier(0);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.arguments!.bottomIndex != 0) {
      _currentIndexNotifier.value = widget.arguments!.bottomIndex!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndexNotifier,
      builder: (context, currentIndex, child) {
        return Scaffold(
          key: _scaffoldKey,
          body: _buildBody(currentIndex),
          drawer: Drawer(
            backgroundColor: Colors.white,
            elevation: 0,
            width: ScreenUtil().screenWidth * 0.8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(Sizes.s20.r),
                bottomRight: Radius.circular(Sizes.s20.r),
              ),
            ),
            child: const DrawerWidget(),
          ),

          bottomNavigationBar: PrimaryBottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              _currentIndexNotifier.value = index;
            },
          ),
        );
      },
    );
  }
  Widget _buildBody(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const PostAdScreen();
      case 2:
        return const WalletScreen();
      case 3:
        return const ProfileScreen();
      default:
    }
    return Container();
  }
}
