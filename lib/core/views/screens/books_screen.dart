import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/models/content.dart';
import 'package:electronic_books/core/viewModels/contents_vm.dart';
import 'package:electronic_books/core/views/widgets/search_text_field.dart';
import 'package:electronic_books/core/views/widgets/silver_app_bar.dart';
import 'package:electronic_books/core/views/widgets/text_style_noor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/book_style.dart';
import '../widgets/dialog_book.dart';

class BooksScreen extends StatelessWidget {
  BooksScreen({super.key});

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
                    tabBarView(1, 2, context),
                    tabBarView(2, 2, context),
                    tabBarView(3, 2, context),
                    tabBarView(4, 2, context),
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
                  showDialog(
                      context: context,
                      builder: (context) => DialogBook(
                            book: value[index],
                          ));
                },
                child: BookStyle(image: NetworkImage(value[index].imagePath!)),
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
