import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/views/widgets/search_text_field.dart';
import 'package:electronic_books/core/views/widgets/silver_app_bar.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../models/content.dart';
import '../../viewModels/contents_vm.dart';
import '../widgets/text_style_noor.dart';

class MaqalatScreen extends StatelessWidget {
  const MaqalatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.indigo[200],
      body: SizedBox(
        height: Dimensions.height(context),
        width: Dimensions.width(context),
        child: Column(
          children: [
            const Stack(
              clipBehavior: Clip.none,
              children: [
                SilverAppBar(),
                // Positioned(
                //     right: Dimensions.width(context) / 6,
                //     top: Dimensions.width(context) / 3 - 20,
                //     child: SearchTextField()),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: Selector<ContentsVm, List<Content>>(
                selector: (context, cvm) {
                  cvm.getContents(1, 5);
                  return cvm.contents;
                },
                builder: (context, value, child) {
                  return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(Assets.imagesBackground),
                                    opacity: 0.5,
                                    fit: BoxFit.cover),
                              ),
                              child: ListTile(
                                // leading: TextStyleNoor(
                                //   color: Colors.indigo,
                                //   text: "${index + 1}",
                                //   size: 20,
                                // ),
                                title: TextStyleNoor(
                                  size: 16,
                                  text: "${value[index].title!}\n",
                                  color: Colors.indigo,
                                ),
                                subtitle: TextStyleNoor(
                                  size: 12,
                                  text: value[index].description!,
                                  color: Colors.indigoAccent[500],
                                ),
                                trailing: IconButton(
                                    onPressed: () {
                                      Content c = value[index];
                                      Share.share(
                                          "${c.title}\n\n${c.description}\n\n\n\n\nتمت مشاركة هذا المقال عبر تطبيق الشيخ أبي الحارث عمر باوزير");
                                    },
                                    icon: const Icon(
                                      Icons.share,
                                      color: Colors.indigoAccent,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
