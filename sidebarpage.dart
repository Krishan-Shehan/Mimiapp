import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';

class SidebarPage extends StatefulWidget {
  final String name;

  const SidebarPage({super.key, required this.name});

  @override
  State<SidebarPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SidebarPage> {
  late String var1;
  late List<CollapsibleItem> _items;
  late String _headline;

  static String get name => "$name";

  // @override
  // void initState() {
  //   super.initState();
  //   _items = _generateItems;
  //   _headline = _items.firstWhere((item) => item.isSelected).text;
  // }

  List<CollapsibleItem> get _generateItems {
    return [
      CollapsibleItem(
        text: "$var1",
        icon: Icons.home,
        onPressed: () => setState(() => _headline = 'Home'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'DashBoard'),
      ),
      CollapsibleItem(
        text: 'Reports',
        icon: Icons.assignment,
        onPressed: () => setState(() => _headline = 'Reports'),
      ),
      CollapsibleItem(
        text: 'insights',
        icon: Icons.insights,
        onPressed: () => setState(() => _headline = 'insights'),
      ),
      CollapsibleItem(
        text: 'Map',
        icon: Icons.location_pin,
        onPressed: () => setState(() => _headline = 'insights'),
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () => setState(() => _headline = 'Settings'),
      ),
      CollapsibleItem(
        text: 'LogOut',
        icon: Icons.logout,
        onPressed: () => setState(() => _headline = 'insights'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    String var2 = widget.name;
    var1 = var2;
    var size = MediaQuery.of(context).size;
    //  String var1 = widget.name;
    return SafeArea(
      child: CollapsibleSidebar(
        selectedIconColor: Color.fromARGB(255, 87, 93, 251),
        selectedIconBox: Color.fromARGB(255, 115, 186, 234),
        topPadding: 110,
        screenPadding: 16,
        borderRadius: 30.82,
        height: 808,
        // maxWidth: 68,
        isCollapsed: MediaQuery.of(context).size.width <= 800,
        items: _generateItems,
        // avatarImg: _avatarImg,
        title: 'MiMi',
        // onTitleTap: () {
        //   ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(content: Text('Yay! Flutter Collapsible Sidebar!')));
        // },
        // body: _body(size, context),
        body: Center(),
        backgroundColor: Color.fromARGB(255, 214, 226, 234),
        // selectedTextColor: Color.fromARGB(255, 87, 93, 251),
        textStyle: const TextStyle(
          fontSize: 15,
          fontStyle: FontStyle.italic,
        ),

        // titleStyle: const TextStyle(
        //     fontSize: 20,
        //     fontStyle: FontStyle.italic,
        //     fontWeight: FontWeight.bold),
        // toggleTitleStyle: TextStyle(
        //   fontSize: 20,
        //   fontWeight: FontWeight.bold,
        // ),
        sidebarBoxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
            blurRadius: 72.43,
            spreadRadius: 0,
            offset: Offset(5.35, 11.5),
          ),
        ],
      ),
    );
  }
}
