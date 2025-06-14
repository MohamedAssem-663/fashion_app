import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  // Constructor
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        
      leading:SvgPicture.asset("assets/svgs/Menu.svg",
            width: 10,
            height: 10,
            color: Colors.white,
            
          ),
      centerTitle: true,
        title: SvgPicture.asset(
          "assets/logo/logo-bg.svg",
          width: 100,
          height: 40,
          color: Colors.white,
        ),
        actions: [
          SvgPicture.asset("assets/svgs/Search.svg",height: 30, width: 30, ),
          const SizedBox(width: 15),
          SvgPicture.asset(
            "assets/svgs/shopping bag.svg",
            height: 30,
            width: 30,
            color: Colors.white,
          ),
          const SizedBox(width: 15),
        ],
      ),
    );
    
  }
}

//  IconButton(
//       icon: const Icon(Icons.menu, color: Colors.black),
//       onPressed: () {
//         // Action for menu button
//       },