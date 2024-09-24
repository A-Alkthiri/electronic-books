import 'package:electronic_books/core/constants/dimensions.dart';
import 'package:electronic_books/core/views/widgets/silver_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  AboutScreen({super.key});

  List title = [
    'الاسم: ',
    'مواليد:',
    'تاريخ الميلاد: ',
    'المستوى الدراسي:',
    'المهمات:',
    'أبرز شيوخه:',
  ];
  List subTitle = [
    'أبو الحـــارث عمر بن سالم بن عبدالله بن ضبعان باوزير ',
    'مدينـة جـدة - المملكـة العربيـة السعـوديـة',
    '1393 هـ - 1973 م',
    'جامعي ',
    'عضو مجلس علماء حضرموت، وعضو هيئة علماء اليمن، ورئيس مؤسسة ابن عباس العلمية، ومـؤســس ورئيـس مؤسـسـة روابــي الخـيــــر الـتــنـــمــــويـــة ســابــقــاً، ونــائـب رئيـس مـخـيـــم الـبـحـــر الصيفي، والمشرف العام على دار الخير لتعليم القرآن الكريم والعلوم الشرعية، والمشرف العام على جامع ومعهد ابن عباس العلمي بالمكلا.',
    'محمد بن صالح العثيمين، وعبدالله بن جبرين، ومحمد بن محمد المختار الشنقيطي، وعبدالرحمن الكوني، ومحمد الطيب المغربي، وعبدالله بن عبدالعزيز البسام، وسعود الشريم، وسعد الحميد، وعلي بكير، وأبوالحسن السليماني... وغيرهم؛ رحم الله الأموات منهم، وحفظ الأحياء.'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                opacity: 0.2,
                image: AssetImage(
                  'assets/images/background.jpg',
                ))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SilverAppBar(),
            Text(
              'نبذة مختصرةعن الشيخ ',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'noor',
                fontSize: Dimensions.width(context) * 0.08,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: Dimensions.height(context) * 0.70,
              width: Dimensions.width(context),
              child: ListView.builder(
                itemCount: title.length,
                itemBuilder: (context, index) {
                  return buildListTile(context, title[index], subTitle[index]);
                },
              ),
            ),
          ],
        ),
      ),
    ));
  }

  ListTile buildListTile(context, title, subTitle) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'noor',
          fontSize: Dimensions.width(context) * 0.05,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(subTitle,
          textAlign: TextAlign.justify,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'noor',
            fontSize: Dimensions.width(context) * 0.04,
          )),
      style: ListTileStyle.drawer,
    );
  }
}
