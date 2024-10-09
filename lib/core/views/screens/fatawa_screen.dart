import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/viewModels/contents_vm.dart';
import 'package:electronic_books/core/views/widgets/silver_app_bar.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:electronic_books/generated/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../../models/content.dart';
import '../widgets/search_text_field.dart';

class FatawaScreen extends StatelessWidget {
  const FatawaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: Dimensions.height(context),
        width: Dimensions.width(context),
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesBackground),
              opacity: 0.5,
              fit: BoxFit.cover),
        ),
        child: Column(
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
            Expanded(
              child: Selector<ContentsVm, List<Content>>(
                selector: (context, cvm) {
                  cvm.getContents(1, 4);
                  return cvm.contents;
                },
                builder: (context, value, child) {
                  return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, index) {
                        return ListTile(
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
                                      actionsAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      backgroundColor: Colors.indigo[200],
                                      content: SingleChildScrollView(
                                        child: TextStyleNoor(
                                            text: value[index].description!),
                                      ),
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              Share.share(
                                                  "${c.description!}\n\n\n\n\nتمت مشاركة هذه الفتوى عبر تطبيق الشيخ أبي الحارث عمر باوزير");
                                            },
                                            icon: const Icon(
                                              Icons.share,
                                              color: Colors.white,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            icon: const Icon(
                                              Icons.close,
                                              color: Colors.red,
                                            )),
                                      ],
                                    ),
                                  );
                                });
                          },
                          leading: TextStyleNoor(
                            color: Colors.indigo,
                            text: "${index + 1}",
                            size: 20,
                          ),
                          title: TextStyleNoor(
                            size: 14,
                            text: value[index].title!,
                            color: Colors.indigo,
                          ),
                        );
                      });
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
