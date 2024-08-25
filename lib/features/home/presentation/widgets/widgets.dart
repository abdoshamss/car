import 'package:flutter/material.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

// class AnimatedHoverMenuItem extends StatelessWidget {
//   const AnimatedHoverMenuItem({super.key});
//
//   @override
//   Widget build(BuildContext context) {List<Menu> headerModelList = {
//     Menu(id: 1, name: 'Home'),
//     Menu(id: 2, name: 'Profile'),
//     Menu(id: 3, name: 'Help'),
//     Menu(id: 4, name: 'Contact Us'),
//     Menu(id: 5, name: 'About Us')
//   }.toList();
//
//   List<SubMenu> menuModelList = {
//     SubMenu(id: 1, name: 'Declarative style'),
//     SubMenu(id: 2, name: 'Premade common'),
//     SubMenu(id: 3, name: 'Stateful hot reload'),
//     SubMenu(id: 4, name: 'Native performance'),
//     SubMenu(id: 5, name: 'Great community')
//   }.toList();
//
//   return   AnimatedHoverMenu(
//       headerPosition: HeaderPosition.bottomRight,
//       headerTiles: headerModelList,
//       menuTiles: menuModelList,
//       backgroundWidget: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.bottomCenter,
//             end: Alignment.bottomRight,
//             colors: [
//               Color(0xfffff8f9),
//               Color(0xfffef7f8),
//               Color(0xffecf0fa),
//             ],
//           ),
//         ),
//       ),
//       headerBoxDecoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(5.0),
//           ),
//           color: LightThemeColors.primary),
//       headerTextColor: Colors.white,
//       headerTextSize: 15.0,
//       menuBoxDecoration: const BoxDecoration(
//         border: Border.fromBorderSide(
//           BorderSide(color: LightThemeColors.primary, width: 2),
//         ),
//       ),
//       menuTextColor:   LightThemeColors.primary,
//       animationType: AnimationType.springAcrossAxis,
//       menuTextSize: 16.0,
//     );
//   }
// }
// class AnimatedHoverMenuItem extends StatelessWidget {
//   const AnimatedHoverMenuItem({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     List<Menu> headerModelList = {
//       Menu(id: 1, name: 'Home'),
//       Menu(id: 2, name: 'Profile'),
//       Menu(id: 3, name: 'Help'),
//       Menu(id: 4, name: 'Contact Us'),
//       Menu(id: 5, name: 'About Us')
//     }.toList();
//
//     List<SubMenu> menuModelList = {
//       SubMenu(id: 1, name: 'Declarative style'),
//       SubMenu(id: 2, name: 'Premade common'),
//       SubMenu(id: 3, name: 'Stateful hot reload'),
//       SubMenu(id: 4, name: 'Native performance'),
//       SubMenu(id: 5, name: 'Great community')
//     }.toList();
//
//     return Row(
//       children:
//      MenuBar(children:List.generate(headerModelList.length ,(index) => headerModelList[index].name),),
//     )
//   }
// }
class MenuItem {
  final int id;
  final String name;

  MenuItem({required this.id, required this.name});
}

class MenuBarItem extends StatelessWidget {
  final List<MenuItem> menuItems;

  const MenuBarItem({super.key, required this.menuItems});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: menuItems.map((menuItem) {
          return Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Text(
              style: const TextStyle(fontSize: 16, color: Colors.black),
              menuItem.name,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class PlutoMenuBarDemo extends StatefulWidget {
  const PlutoMenuBarDemo({
    super.key,
  });

  @override
  State<PlutoMenuBarDemo> createState() => _PlutoMenuBarDemoState();
}

class _PlutoMenuBarDemoState extends State<PlutoMenuBarDemo> {
  late final List<PlutoMenuItem> whiteHoverMenus;

  late final List<PlutoMenuItem> orangeHoverMenus;

  late final List<PlutoMenuItem> whiteTapMenus;

  late final List<PlutoMenuItem> orangeTapMenus;

  @override
  void initState() {
    super.initState();

    whiteHoverMenus = _makeMenus(context);
    orangeHoverMenus = _makeMenus(context);
    whiteTapMenus = _makeMenus(context);
    orangeTapMenus = _makeMenus(context);
  }

  void message(context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<PlutoMenuItem> _makeMenus(BuildContext context) {
    return [
      PlutoMenuItem(
        title: 'لمحة عنا',
        onTap: () => message(context, "لمحة عنا"),
        // icon: Icons.home,
        // children: [
        //   PlutoMenuItem(
        //     title: 'Menu 1-1',
        //     enable: false,
        //     icon: Icons.group,
        //     onTap: () => message(context, 'Menu 1-1 tap'),
        //     children: [
        //       PlutoMenuItem(
        //         title: 'Menu 1-1-1',
        //         onTap: () => message(context, 'Menu 1-1-1 tap'),
        //         children: [
        //           PlutoMenuItem(
        //             title: 'Menu 1-1-1-1',
        //             onTap: () => message(context, 'Menu 1-1-1-1 tap'),
        //           ),
        //           PlutoMenuItem(
        //             title: 'Menu 1-1-1-2',
        //             onTap: () => message(context, 'Menu 1-1-1-2 tap'),
        //           ),
        //         ],
        //       ),
        //       PlutoMenuItem(
        //         title: 'Menu 1-1-2',
        //         onTap: () => message(context, 'Menu 1-1-2 tap'),
        //       ),
        //     ],
        //   ),
        //   PlutoMenuItem(
        //     title: 'Menu 1-2',
        //     onTap: () => message(context, 'Menu 1-2 tap'),
        //   ),
        //   PlutoMenuItem.divider(height: 10),
        //   PlutoMenuItem.checkbox(
        //     title: 'Menu 1-3',
        //     initialCheckValue: true,
        //     // onTap: () => message(context, 'Menu 1-3 tap'),
        //     onChanged: (flag) => print(flag),
        //   ),
        //   PlutoMenuItem.divider(height: 10),
        //   PlutoMenuItem.radio(
        //     title: 'Menu 1-3',
        //     initialRadioValue: _RadioItems.one,
        //     radioItems: _RadioItems.values,
        //     // onTap: () => message(context, 'Menu 1-3 tap'),
        //     onChanged: (item) => print(item),
        //     getTitle: (item) {
        //       switch (item as _RadioItems) {
        //         case _RadioItems.one:
        //           return 'One';
        //         case _RadioItems.two:
        //           return 'Two';
        //         case _RadioItems.three:
        //           return 'Three';
        //       }
        //     },
        //   ),
        //   PlutoMenuItem(
        //     title: 'Menu 1-4',
        //     icon: Icons.group,
        //     onTap: () => message(context, 'Menu 1-4 tap'),
        //     children: [
        //       PlutoMenuItem(
        //         title: 'Menu 1-4-1',
        //         onTap: () => message(context, 'Menu 1-4-1 tap'),
        //         children: [
        //           PlutoMenuItem(
        //             title: 'Menu 1-4-1-1',
        //             onTap: () => message(context, 'Menu 1-4-1-1 tap'),
        //           ),
        //           PlutoMenuItem(
        //             title: 'Menu 1-4-1-2',
        //             onTap: () => message(context, 'Menu 1-4-1-2 tap'),
        //           ),
        //         ],
        //       ),
        //       PlutoMenuItem(
        //         title: 'Menu 1-4-2',
        //         onTap: () => message(context, 'Menu 1-4-2 tap'),
        //       ),
        //     ],
        //   ),
        // ],
      ),
      PlutoMenuItem(
        title: 'البروفايل',
        // icon: Icons.add_circle,
        onTap: () => message(context, 'البروفايل'),
        children: [
          PlutoMenuItem(
            title: 'ملف PDF',
            onTap: () => message(context, 'PDF'),
          ),
        ],
      ),
      PlutoMenuItem(
        title: 'مركزنا',
        // icon: Icons.apps_outlined,
        onTap: () => message(context, 'مركزنا'),
      ),
      PlutoMenuItem(
        title: 'خدماتنا',
        onTap: () => message(context, 'خدماتنا'),
        children: [
          PlutoMenuItem(
            title: 'الميكانيكا',
            onTap: () => message(context, 'الميكانيكا'),
          ),
          PlutoMenuItem(
            title: 'الكهرباء',
            onTap: () => message(context, 'الكهرباء'),
          ),
          PlutoMenuItem(
            title: 'السمكرةوالدهان',
            onTap: () => message(context, "السمكرةوالدهان"),
          ),
          PlutoMenuItem(
            title: 'العزل الحراري والصوتي',
            onTap: () => message(context, 'العزل الحراري والصوتي'),
          ),
          PlutoMenuItem(
            title: 'برمجة ىالسيارات',
            onTap: () => message(context, 'برمجة ىالسيارات'),
          ),
          PlutoMenuItem(
            title: 'التعليق الرياضي',
            onTap: () => message(context, 'التعليق الرياضي'),
          ),
        ],
      ),
      PlutoMenuItem(
          title: 'المركز الاعلامي',
          onTap: () => message(context, 'Menu 5 tap'),
          children: [
            PlutoMenuItem(
              title: 'الاخبار',
              onTap: () => message(context, 'الاخبار'),
            ),
            PlutoMenuItem(
              title: 'معرض الصور',
              onTap: () => message(context, 'معرض الصور'),
            ),
          ]),
      PlutoMenuItem(
        title: 'عروضنا',
        onTap: () => message(context, 'عروضنا'),
      ),
      PlutoMenuItem(
        title: 'الأسئلة الشائعة',
        onTap: () => message(context, 'الأسئلة الشائعة'),
      ),
      PlutoMenuItem(
        title: 'احجز خدمتك الآن',
        onTap: () => message(context, 'احجز خدمتك الآن'),
      ),
      PlutoMenuItem(
        title: 'الوظائف',
        onTap: () => message(context, 'الوظائف'),
      ),
      PlutoMenuItem(
        title: 'تواصل معنا',
        onTap: () => message(context, 'تواصل معنا'),
      ),

    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PlutoMenuBar(
            mode: PlutoMenuBarMode.hover,
            menus: whiteHoverMenus,
          ),

          // PlutoMenuBar(
          //   mode: PlutoMenuBarMode.hover,
          //   backgroundColor: Colors.deepOrange,
          //   itemStyle: const PlutoMenuItemStyle(
          //     activatedColor: Colors.white,
          //     indicatorColor: Colors.deepOrange,
          //     textStyle: TextStyle(color: Colors.white),
          //     iconColor: Colors.white,
          //     moreIconColor: Colors.white,
          //   ),
          //   menus: orangeHoverMenus,
          // ),
          // const SizedBox(height: 30),
          // const Text('Tap-open Menu', style: TextStyle(fontSize: 30)),
          // const SizedBox(height: 30),
          // PlutoMenuBar(
          //   mode: PlutoMenuBarMode.tap,
          //   menus: whiteTapMenus,
          // ),
          // const SizedBox(height: 30),
          // PlutoMenuBar(
          //   backgroundColor: Colors.deepOrange,
          //   itemStyle: const PlutoMenuItemStyle(
          //     activatedColor: Colors.white,
          //     indicatorColor: Colors.deepOrange,
          //     textStyle: TextStyle(color: Colors.white),
          //     iconColor: Colors.white,
          //     moreIconColor: Colors.white,
          //   ),
          //   menus: orangeTapMenus,
          // ),
          // const SizedBox(height: 30),
          // const Text('Selected top menu', style: TextStyle(fontSize: 30)),
          // const SizedBox(height: 30),
          // PlutoMenuBar(
          //   mode: PlutoMenuBarMode.tap,
          //   itemStyle: const PlutoMenuItemStyle(
          //     enableSelectedTopMenu: true,
          //   ),
          //   menus: [
          //     PlutoMenuItem(
          //       title: 'Select1',
          //       id: 'Select1',
          //       onTap: () => message(context, 'Select1'),
          //     ),
          //     PlutoMenuItem(
          //       title: 'Select2',
          //       id: 'Select2',
          //       onTap: () => message(context, 'Select2'),
          //     ),
          //     PlutoMenuItem(
          //       title: 'Select3',
          //       id: 'Select3',
          //       onTap: () => message(context, 'Select3'),
          //     ),
          //     PlutoMenuItem(
          //       title: 'Select4',
          //       id: 'Select4',
          //       onTap: () => message(context, 'Select4'),
          //     ),
          //     PlutoMenuItem(
          //       title: 'Select5',
          //       id: 'Select5',
          //       onTap: () => message(context, 'Select5'),
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 30),
          // const Text('Toggled top menu', style: TextStyle(fontSize: 30)),
          // const SizedBox(height: 30),
          // PlutoMenuBar(
          //   mode: PlutoMenuBarMode.tap,
          //   itemStyle: PlutoMenuItemStyle(
          //     enableSelectedTopMenu: true,
          //     selectedTopMenuResolver: (menu, enabled) {
          //       final description = enabled == true ? 'disabled' : 'enabled';
          //       message(context, '${menu.title} $description');
          //       return enabled == true ? null : true;
          //     },
          //   ),
          //   menus: [
          //     PlutoMenuItem(
          //       title: 'Toggle1',
          //       id: 'Toggle1',
          //     ),
          //     PlutoMenuItem(
          //       title: 'Toggle2',
          //       id: 'Toggle2',
          //     ),
          //     PlutoMenuItem(
          //       title: 'Toggle3',
          //       id: 'Toggle3',
          //     ),
          //     PlutoMenuItem(
          //       title: 'Toggle4',
          //       id: 'Toggle4',
          //     ),
          //     PlutoMenuItem(
          //       title: 'Toggle5',
          //       id: 'Toggle5',
          //     ),
          //   ],
          // ),
          // const SizedBox(height: 50),
        ],
      ),
    );
  }
}

enum _RadioItems {
  one,
  two,
  three,
}
