import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/dimensions.dart';
import '../../models/content.dart';
import '../../viewModels/contents_vm.dart';
import '../widgets/silver_app_bar.dart';
import '../widgets/text_style_noor.dart';
import '../widgets/video_style.dart';

class VideosScreen extends StatelessWidget {
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: Colors.indigo[200],
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SilverAppBar(),
                // Positioned(
                //     right: Dimensions.width(context) / 6,
                //     top: Dimensions.width(context) / 3 - 20,
                //     child: SearchTextField()),
              ],
            ),
            SizedBox(
              height: Dimensions.width(context) * 0.08,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 30,
              width:
                  Dimensions.width(context) - Dimensions.width(context) * 0.1,
              decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  borderRadius: BorderRadius.circular(30)),
              child: TabBar(tabs: [
                TextStyleNoor(
                  text: "عقيدة",
                  color: Colors.indigo,
                ),
                TextStyleNoor(
                  text: "فقه",
                  color: Colors.indigo,
                ),
                TextStyleNoor(
                  text: "حديث",
                  color: Colors.indigo,
                ),
                TextStyleNoor(
                  text: "سيرة",
                  color: Colors.indigo,
                ),
              ]),
            ),
            SizedBox(
              height: Dimensions.width(context) * 0.04,
            ),
            Expanded(
              child: Container(
                width: Dimensions.width(context) - 20,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                height: Dimensions.height(context) -
                    Dimensions.width(context) * 0.5,
                decoration: BoxDecoration(
                    color: Colors.indigo[100],
                    borderRadius: BorderRadius.circular(10)),
                child: TabBarView(
                  children: [
                    tabBarView(1, 3, context),
                    tabBarView(2, 3, context),
                    tabBarView(3, 3, context),
                    tabBarView(4, 3, context),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

Widget tabBarView(int categoryId, int typeId, BuildContext ctx) {
  ContentsVm c = ContentsVm();
  c.getContents(categoryId, typeId);
  return Selector<ContentsVm, List<Content>>(
    selector: (ctx, cvm) => c.contents,
    builder: (ctx, value, child) {
      if (value.isNotEmpty) {
        return GridView.builder(
            itemCount: value.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 25, mainAxisSpacing: 20, crossAxisCount: 2),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Content c = value[index];
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Directionality(
                          textDirection: TextDirection.rtl,
                          child: AlertDialog(
                            title: TextStyleNoor(
                              size: 14,
                              text: value[index].title!,
                              color: Colors.indigo,
                            ),
                            actionsAlignment: MainAxisAlignment.spaceEvenly,
                            backgroundColor: Colors.indigo[200],
                            content: SingleChildScrollView(
                              child: TextStyleNoor(
                                  text: value[index].description!),
                            ),
                            actions: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/youtube',
                                        arguments: value[index]);
                                  },
                                  icon: const Icon(
                                    Icons.play_arrow,
                                    color: Colors.green,
                                    size: 40,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.red,
                                    size: 40,
                                  )),
                            ],
                          ),
                        );
                      });
                },
                child: VideoStyle(
                  content: value[index],
                ),
                // child: TextStyleNoor(text: value[index].title!),
              );
            });
      } else {
        return Center(
            child: Column(
          children: [
            const CircularProgressIndicator(),
            TextStyleNoor(
              text: "جاري التحميل..",
            ),
            TextStyleNoor(
              text: "أو قد تكون هذه القائمة فارغة",
            )
          ],
        ));
      }
    },
  );
}
