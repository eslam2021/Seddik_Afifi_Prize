import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

// ignore: camel_case_types, must_be_immutable
class NavigateToStories extends StatefulWidget {
  @override
  State<NavigateToStories> createState() => _NavigateToStories();
}

class _NavigateToStories extends State<NavigateToStories> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  bool _isVisible = false;
  bool _isVisible2 = false;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  void showToast2() {
    setState(() {
      _isVisible2 = !_isVisible2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'مجال الادب في كتابة الرواية',
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
                                'images/book.jpeg',
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
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xff2B262D),
                        width: 3,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              oneText(context),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xff2B262D),
                        width: 3,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              twoText(context),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Color(0xff2B262D),
                        width: 3,
                      )),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Center(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              threeText(context),
                              SizedBox(
                                height: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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

  Widget buildImage() => Image.asset(
        'images/2021.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: 400,
      );

  Widget oneText(BuildContext context) => ExpansionTile(
        childrenPadding: EdgeInsets.all(16).copyWith(top: 1),
        title: Text(
          '''الشروط العامة للترشح''',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff262220),
          ),
        ),
        children: [
          ReadMoreText(
            ''' 
	. أن يكون المرشّح مصري الجنسية
٢ .ألا يكون قد سبق حصول المرشح على أي  جائزة علمية أخرى بنفس الإنتاج العلمي المقدم لهذه الجائزة. 
٣. يشترط في الأبحاث أو الإنتاج الذي يتقدم به المرشح لنيل أي جائزة من الجوائز المعلنة ألا يكون قد سبق وأن تقدم بها للحصول علي جوائز أخري. 
٤. يقوم المرشح بملء الاستمارة المعدة للترشح للجائزة.
٥. لا تقبل أي إضافات او تعديلات لأى مستند بعد وصوله. 
٦. لا ينظر في الطلبات التي لا تلتزم بشروط الجائزة ولا تلك التي تصل بعد انتهاء فترة الترشح.
 ''',
            style: TextStyle(
              fontFamily: 'El Messier',
              fontSize: 20,
              color: Color(0xff262220),
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
      );

  Widget twoText(BuildContext context) => ExpansionTile(
        childrenPadding: EdgeInsets.all(16).copyWith(top: 1),
        title: Text(
          '''مكونات الجائزة''',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff262220),
          ),
        ),
        children: [
          ReadMoreText(
            ''' 
	١. شهادة تتضمن اسم الجائزة واسم الفائز وسنة الحصول عليها . 
٢. ميدالية عليها أسم الأكاديمية و اسم الجائزة ومجالها والتاريخ.
٣. مكافأة مالية قدرها: 
– ١٠٠.٠٠٠( مائة ألف جنية مصري) في مجال الابتكار في حال التقدم بمنتج.
–  ٥٠.٠٠٠  (خمسون ألف جنية مصري في حال التقدم بأبحاث علمية منشورة في مجلات دولية ذات معامل تأثير عالي.
''',
            style: TextStyle(
              fontFamily: 'El Messier',
              fontSize: 20,
              color: Color(0xff262220),
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
      );

  Widget threeText(BuildContext context) => ExpansionTile(
        childrenPadding: EdgeInsets.all(16).copyWith(top: 1),
        title: Text(
          '''إجراءات التقدم للجائزة والمستندات المطلوبة''',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff262220),
          ),
        ),
        children: [
          ReadMoreText(
            '''
المستندات المطلوبة هى:
* مستند رقم (1) و هو طلب تقدم لنيل جائزة الدكتور/ صديق عفيفي للبحث العلمي والابتكار والادب لعام ٢٠٢٠/٢٠٢١ مرفق به صورة فوتوغرافية حديثة.
* مستند رقم (2) وهو استمارة بيانات متقدم لجائزة دكتور/ صديق عفيفي للبحث العلمي والابتكار والادب
* مستند رقم (3) وهو إقرار باستيفاء الشروط العامة للجائزة
* صورة بطاقة الرقم القومي
* عدد ٢ صورة ملونة حديثة للمتقدم
* المؤهلات العلمية والتاريخ الوظيفي .
* الإنتاج المقدم للجائزة مع :
١- ملخص عن الإنتاج بما لا يزيد عن ٣٠٠ كلمة (times new roman 12 with space 1.5 )
٢- تفاصيل الإنتاج المقدم لا يزيد عن ١٠ صفحات (times new roman 12 with space 1.5 )
٣- في حال مشاركة أكثر من باحث في  البحث أو الابتكار يجب احضار موافقة مكتوبة من أعضاء فريق العمل تفيد بموافقتهم على التقدم للجائزة ، وتفويض احد أعضاء الفريق لاستلام الجائزة في حال فاز البحث/الابتكار بأحد الجوائز.
٤- في حال عدم وجود شركاء فيكون الإقرار من المتقدم بعدم وجود شركاء معه في العمل.
٥- عدد ٣ أسطوانات مدمجة تحتوي علي نسخة الكترونية (PDF ) للإنتاج المقدم للجائزة و المستندات المطلوبة مرتبة حسب قائمة المستندات المدونة.
٦- تقديم فيديو يوضح الابتكار أو مجسم للابتكار.
٧- الابحاث العلمية يجب أن تكون خلال الخمس سنوات السابقة المنشورة فى مجلات ال Q1 أو Q2 ( لا يوجد حد أدنى لعدد الابحاث).
٨- تقديم ثلاث نسخ ورقية على العنوان التالي:
أكاديمية طيبة – أول كورنيش المعادي خلف مستشفي كليوباترا (النيل بدراوي سابقا) 
*لا يجوز للمتقدم سحب أوراقه بعد انتهاء الموعد المحدد للتقديم
* المستندات والإنتاج العلمي لا يرد.   
''',
            style: TextStyle(
              fontFamily: 'El Messier',
              fontSize: 20,
              color: Color(0xff262220),
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
      );
}

class AnimatedImage extends StatefulWidget {
  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  late final Animation<Offset> _animation = Tween<Offset>(
    begin: Offset.zero,
    end: Offset(0, 0.08),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SlideTransition(
          position: _animation,
          child: Image.asset('images/book.jpeg'),
        ),
      ],
    );
  }
}
