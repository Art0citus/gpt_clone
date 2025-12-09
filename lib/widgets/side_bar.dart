import 'package:flutter/material.dart';
import 'package:gpt_clone/theme/colors.dart';
import 'package:gpt_clone/widgets/side_bar_button.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isCollapsed = true;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      width: isCollapsed ? 60 : 150,
      color: AppColors.sideNav,
      child: Column(
        crossAxisAlignment: isCollapsed
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Icon(
            Icons.auto_awesome_mosaic,
            color: AppColors.whiteColor,
            size: 30,
          ),
          const SizedBox(height: 16),
          SideBarButton(isCollapsed: isCollapsed, icon: Icons.add, text: "New Chat"),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Icon(Icons.search, color: AppColors.iconGrey, size: 18),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Icon(Icons.language, color: AppColors.iconGrey, size: 18),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Icon(
              Icons.auto_awesome,
              color: AppColors.iconGrey,
              size: 18,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Icon(
              Icons.cloud_outlined,
              color: AppColors.iconGrey,
              size: 18,
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isCollapsed = !isCollapsed;
              });
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Icon(
                isCollapsed
                    ? Icons.keyboard_arrow_right
                    : Icons.keyboard_arrow_left,
                color: AppColors.iconGrey,
                size: 18,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
