import 'package:cars_maintance/core/theme/light_theme.dart';
import 'package:cars_maintance/core/utils/extentions.dart';
import 'package:cars_maintance/shared/widgets/customtext.dart';
import 'package:cars_maintance/shared/widgets/edit_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/home_web_cubit.dart';
import '../../cubit/home_web_states.dart';
import '../widgets/widgets.dart';

///// put it in routes
///  import '../../features/home_web/presentation/screens/HomeWeb.dart';
/// static const String HomeWebScreen = "HomeWebScreen";

class HomeWebScreen extends StatefulWidget {
  const HomeWebScreen({super.key});

  @override
  State<HomeWebScreen> createState() => _HomeWebScreenState();
}

class _HomeWebScreenState extends State<HomeWebScreen> {
  @override
  void initState() {
    super.initState();
  }

  final List<String> items = [
    "بايبال,",
    "ابل باي,",
    "فيزا,",
    ",ماستر كارد",
    ",تمارا"
  ];

  // List<MenuItem> headerModelList = [
  //   MenuItem(id: 1, name: 'لمحة عنا'),
  //   MenuItem(id: 2, name: 'البروفايل'),
  //   MenuItem(id: 3, name: 'مركزنا'),
  //   MenuItem(id: 4, name: 'خدماتنا'),
  //   MenuItem(id: 5, name: 'المركز الاعلامي'),
  //   MenuItem(id: 6, name: 'عروضنا'),
  //   MenuItem(id: 7, name: 'الأسئلة الشائعة'),
  //   MenuItem(id: 8, name: 'احجز خدمتك الآن'),
  //   MenuItem(id: 9, name: 'الوظائف'),
  //   MenuItem(id: 10, name: 'تواصل معنا'),
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeWebCubit(),
      child: BlocConsumer<HomeWebCubit, HomeWebStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          final cubit = HomeWebCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  /// Header
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      decoration:
                          const BoxDecoration(color: LightThemeColors.primary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            clipBehavior: Clip.antiAlias,
                            width: (MediaQuery.of(context).size.width / 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: const PlutoMenuBarDemo(),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: const CustomText(
                              "رقم الاتصال المجانى:٥٣٨٨٧٠٢٢٢_٩٦٦+",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 35,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                                width: MediaQuery.of(context).size.width / 5.6,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    const CustomText("طرق الدفع المتوفرة (",
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w400)),
                                    Expanded(
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: List.generate(
                                            items.length,
                                            (index) => Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4),
                                              child: CustomText(
                                                items[index],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const CustomText(")",
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                              16.pw,
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)),
                                child: const Text(
                                  "Ar",
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),

                  /// End of Header
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 61,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/splash.jpeg"),
                          fit: BoxFit.fill),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Placeholder(
                              fallbackHeight: 100,
                              fallbackWidth: 100,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                              child: TextFormFieldWidget(
                                hintText: "البحث",
                                prefixIconWidget: const Icon(Icons.search),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
// SizedBox(
// width: MediaQuery.of(context).size.width /
// 12.5,
// child: SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: List.generate(
// items.length,
// (index) => Padding(
// padding:
// const EdgeInsets.symmetric(
// horizontal: 4),
// child: CustomText(
// items[index],
// style: const TextStyle(
// fontWeight: FontWeight.w400,
// fontSize: 12),
// ),
// ),
// ),
// ),
// ),
// ),
