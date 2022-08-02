import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class Gols extends StatelessWidget {
  const Gols({Key? key}) : super(key: key);

  final currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    // var cubit = BlocProvider.of<UserCubit>(context);
    // var userData = cubit.model;
    // var data = cubit.contestantModel;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'اهداف الجائزة',
          ),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
        backgroundColor: Color(0xff647295),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 10.0, top: 30.0, right: 10.0, bottom: 10),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: Color(0xff647295),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0, left: 20.0, right: 20.0),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                'images/gools.jpeg',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 65.0,
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  shadowColor: Color(0xffeeb44c),
                  elevation: 8,
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Column(
                    children: [
                      Text(
                        '''اهداف الجائزة''',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      ReadMoreText(
                        '''
1- دعم وتنمية روح البحث العلمي بين شرائح المجتمع المصري
2- الاهتمام بالموهوبين والمبدعين وتشجيعهم على العطاء بإعطائهم فرصة للتعبير عن أفكارهم وآرائهم
3- مساعدة الباحثين في استثمار نتائج أبحاثهم وابتكاراتهم وتحويلها الى منتجات تؤثر بشكل إيجابي علي اقتصاديات البلد والمنطقة العربية
4- اكتشاف وتبني الطاقات والمواهب البحثية والأدبية المبدعة بين الشباب في مصر
''',
                        style: TextStyle(
                          fontFamily: 'El Messier',
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: 'قراءة المزيد',
                        textAlign: TextAlign.right,
                        textDirection: TextDirection.rtl,
                        trimExpandedText: 'اقل',
                        moreStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2B262D)),
                        lessStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2B262D)),
                      ),
                    ],
                  ),
                ),

                //1---
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
