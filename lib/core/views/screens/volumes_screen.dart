import 'package:electronic_books/core/views/screens/audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/assets.dart';
import '../../constants/dimensions.dart';
import '../../models/content.dart';
import '../../viewModels/contents_vm.dart';
import '../widgets/silver_app_bar.dart';
import '../widgets/text_style_noor.dart';

class VolumesScreen extends StatelessWidget {
  const VolumesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.indigo[200],
      body: Container(
        height: Dimensions.height(context),
        width: Dimensions.width(context),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SilverAppBar(),
              ],
            ),
            TextStyleNoor(
              text: "الدروس الصوتية",
              size: Dimensions.width(context) * 0.1,
              color: Colors.indigo,
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: Selector<ContentsVm, List<Content>>(
                selector: (context, cvm) {
                  cvm.getContents(1, 1);
                  return cvm.contents;
                },
                builder: (context, value, child) {
                  return value.isNotEmpty
                      ? ListView.builder(
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image:
                                            AssetImage(Assets.imagesBackground),
                                        opacity: 0.5,
                                        fit: BoxFit.cover),
                                  ),
                                  child: ListTile(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/audio',
                                          arguments: value[index]);
                                    },
                                    trailing: IconButton(
                                        onPressed: () {
                                          Navigator.pushNamed(context, '/audio',
                                              arguments: value[index]);
                                        },
                                        icon: Icon(
                                          Icons.play_arrow,
                                          size:
                                              Dimensions.width(context) * 0.08,
                                        )),
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
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                )
                              ],
                            );
                          })
                      : Container();
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
