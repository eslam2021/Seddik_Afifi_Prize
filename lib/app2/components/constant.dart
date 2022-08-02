import 'package:firist_project/app2/login2/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../network/cache_helper/cache_helper.dart';

dynamic token = '';
void SignOut(context) {
  CacheHelper.removeData(
    key: 'token',
  ).then((value) {
    if (value) {
      navigateAndFinish(context, Login());
    }
  });
}

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);
Widget buildText(BuildContext context) => ExpansionTile(
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        child: Text(
          '''حياته''',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff2B262D)),
        ),
      ),
      children: [
        ReadMoreText(
          ''' 
- مؤسس ورئيس مجموعة مؤسسات طيبة و النهضة التعليمية وتضم مدارس و معاهد عليا وجامعات  .
- رئيس  أكاديمية  طيبة. 
- رئيس المجلس العربي للأخلاق و المواطنة .
- رئيس لجنة علوم الإدارة بالمجلس الأعلى للثقافة.
- رئيس مجلس أمناء جامعة ميريت بسوهاج.
- رئيس جامعة النهضة سابقا والرئيس الشرفى لها مدى الحياة.
                  ''',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff2B262D),
          ),
          trimLines: 2,
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

Widget oneText(BuildContext context) => ExpansionTile(
      childrenPadding: EdgeInsets.all(16).copyWith(top: 1),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        child: Text(
          '''المؤهلات''',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xff2B262D)),
        ),
      ),
      children: [
        ReadMoreText(
          ''' 
–  ماجستير التسويق – جامعة مانشستر ، إنجلترا، 1996

– دكتواره في إدارة الأعمال – جامعة بارد فورد ، إنجلترا ،1969 

 – دكتوراه في التربية – جامعة ويلز ، بريطانيا  1998 
    ''',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff2B262D),
          ),
          trimLines: 2,
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
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        child: Text(
          '''الانجازات''',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff2B262D),
          ),
        ),
      ),
      children: [
        ReadMoreText(
          ''' 
	- أستاذ جامعي قدير في علوم الادارة وصل لأعلى المناصب في السلك الجامعي و تتلمذ على يديه مئات الألوف من الطلاب في مصر و الخارج.
- تولى عضوية أو رئاسة مجلس الإدارة لفترات مختلفة بعدد من الشركات الصناعية و التجارية
)فينكورب للاستثمار والاتحاد العربي للمقاولات وماس للاستشارات وطيبة الدولية للسياحة وطيبة التعليمية و شركة الرواد للأوراق المالية وشركة بيراميدز للاستثمار ) خلال الفترة من 1981 حتى تاريخه .
	- عضو فريق الأمم المتحدة لإعادة هيكلة الجهاز التنفيذي بدولة الكويت بعد تحريرها من الغزو العراقي 1992 و كان المصري الوحيد في الفريق .
	- رئيس فريق البنك الدولي للتطوير وإعادة الهيكلة في عدد كبير من الوزارات و المحافظات بســــلطنة عمان والكويت 88-1993.
-أسس واشرف على أول مركز للتدريب والاستشارات الإدارية بقطاع الغزل والنسيج والملابس في الثمانينيات.
-أسس وأشرف على أول مركز للاستشارات الإدارية بجامعة الكويت – كلية الاقتصاد (1975 – 1977).
- اشرف على إعادة تنظيم جامعة المنوفية (1982 – 1984) .
- اشرف على إعادة تنظيم جامعة قطر(1987 – 1988).
-نظم مئات الدورات التدريبية لرؤساء الشركات و الهيئات و نواب الوزراء و أساتذة الجامعات و عمداء الكليات و المديرين من خلال الجامعة الأمريكية و آراك و جامعة قطر و جامعة المنوفية و جمعية إدارة الأعمال و الجامعة العربية والمجلس الأعلى للجامعات، وغيرها.
- شارك في وضع خطة إعادة هيكلة القوى العاملة في دولة الكويت 1995 . 
- اشرف على إعادة تنظيم مكتب نائب أمير قطر 1988 .
- اختير نائباً لرئيس الجمعية الأمريكية لتقدم الإدارة 1988 .
- عضو اللجنة العلمية لمجلة تقدم الإدارة بأمريكا 1988 .
- نظم عشرات المؤتمرات العلمية والمهنية ورأس عشرات الندوات والحلقات العلمية بمصر والخارج.
- رئيس هيئة المستشارين بالجهاز المركزي للتنظيم والإدارة (1978 – 1984).
- مستشار لوزراء المالية ، والتنمية الأدارية ، والاقتصاد ، والسياحة ، والتموين ، والصناعة ، و لمركز معلومات مجلس الوزراء لفترات مختــــــــــــــلفة بين ( 1977 – 1985).
- مستشار الجامعة الأمريكية بالقاهرة ،(مركز الشرق الأوسط للدراسات الأدارية 1986).
- نظم أول معرض دولي للصادرات المصرية بالخليج العربي في دولة البحرين عام 1992 و افتتحه رئيس وزراء مصر و جلالة ملك البحرين و نحو عشرين وزيراً من البلدين  .


                  ''',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff2B262D),
          ),
          trimLines: 2,
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
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        child: Text(
          '''الانشطه''',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              color: Color(0xff2B262D),
              fontWeight: FontWeight.bold),
        ),
      ),
      children: [
        ReadMoreText(
          ''' 
    - درع عظماء التربويين من الولايات المتحدة الأمريكية مرتين في عامي 1996 ، 1997 .
    - نوط رواد التعليم من وزارة التربية والتعليم مرتين في عامي 1992 ، 1995 .
    - مؤسس و رئيس أول جمعية حماية المستهلك في مصر .
    - ميدالية التميز الادارى من جامعة المنوفية و ميدالية الانجاز من نقابة التجاريين .
    - ميدالية التميز من الجمعية الأمريكية للمثقفين العالميين .
    - زميل الجمعية الملكية للصناعة و التجارة و الآداب بإنجلترا .
    - حاصل على عدد كبير من الميداليات والأنواط من جهات مصرية و دولية .
    - مسجل في الموسوعة القومية للشخصيات المصرية البارزة 
    - مسجل في الموسوعة الدولية للشخصيات البارزة (1990 – 1991).
    - عين أستاذاً فخرياً بالجامعة الدولية في فيينا 2008 .
    - له نشاط كبير في مجال الخدمة العامة و الأعمال الخيرية لمساعدة المحتاجين في كثير من المحافظات 
                  ''',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff2B262D),
          ),
          trimLines: 2,
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

Widget fourText(BuildContext context) => ExpansionTile(
      childrenPadding: EdgeInsets.all(16).copyWith(top: 1),
      title: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
        child: Text(
          '''المؤلفات''',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 24,
              color: Color(0xff2B262D),
              fontWeight: FontWeight.bold),
        ),
      ),
      children: [
        ReadMoreText(
          ''' 
- كتاب تنظيم الدولة و إدارة الاقتصاد القومي .
- كتاب السلوك التنظيمي و البيروقراطية المصرية .
- كتاب أصول الإدارة العلمية .
- كتاب استراتيجية التخصيصية لإصلاح الاقتصاد المصري .
- كتاب التفاوض الفعال في الحياة و الأعمال ( أول كتاب في المكتبة العربية ) .
- كتاب تسويق البترول ( أول كتاب في المكتبة العربية ) .
- كتاب التسويق الدولي ( أول كتاب في المكتبة العربية ) .
- كتاب التربية الخلقية في المدرسة المصرية ( أول كتاب في المكتبة العربية ) .
- كتاب ” أخلاق المهنة لدى أستاذ الجامعة ” ( أول كتاب في المكتبة العربية ) .
                  ''',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xff2B262D),
          ),
          trimLines: 2,
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
