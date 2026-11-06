import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const HistoryQuizApp());

class QuizQuestion {
  final String text;
  final List<String> options;
  final int answer;
  final String explanation;
  final String level; // سهل، متوسط، صعب
  final bool trueFalse;

  const QuizQuestion({
    required this.text,
    required this.options,
    required this.answer,
    required this.explanation,
    required this.level,
    this.trueFalse = false,
  });
}

QuizQuestion mc(String text, List<String> options, int answer, String explanation,
    [String level = 'متوسط']) =>
    QuizQuestion(text: text, options: options, answer: answer,
        explanation: explanation, level: level);

QuizQuestion tf(String text, bool answer, String explanation,
    [String level = 'سهل']) =>
    QuizQuestion(text: text, options: const ['صح', 'خطأ'],
        answer: answer ? 0 : 1, explanation: explanation,
        level: level, trueFalse: true);

class HistoryLesson {
  final String title;
  final String unit;
  final List<QuizQuestion> questions;
  const HistoryLesson(this.title, this.unit, this.questions);
}

// أسئلة تدريبية أصلية مبنية على موضوعات المذكرة المرفوعة، وليست نسخًا حرفيًا منها.
final List<HistoryLesson> lessons = [
  HistoryLesson('الحضارة والتاريخ', 'الوحدة الأولى', [
    mc('ما النشاط الذي ساعد الإنسان على الانتقال من التنقل إلى الاستقرار؟',
      ['الزراعة واستئناس الحيوانات', 'صناعة النقود', 'اكتشاف الطباعة', 'بناء السفن'], 0,
      'أدى اكتشاف الزراعة واستئناس الحيوانات إلى الاستقرار حول ضفاف الأنهار.', 'سهل'),
    tf('ظهرت العصور التاريخية بعد معرفة الإنسان الكتابة والتدوين.', true,
      'تربط المذكرة بداية العصور التاريخية بمعرفة الكتابة وتسجيل الأحداث.', 'سهل'),
    mc('أي مما يلي يمثل جانبًا ماديًا من جوانب الحضارة؟',
      ['الأفكار والآداب', 'العلوم والفنون', 'المعابد والمقابر', 'القيم والتقاليد'], 2,
      'المعابد والمقابر من المظاهر المادية الملموسة للحضارة.', 'سهل'),
    mc('ركز ول ديورانت في مفهومه للحضارة على أنها نظام اجتماعي يساعد الإنسان على زيادة إنتاجه:',
      ['العسكري', 'الثقافي', 'الزراعي فقط', 'التجاري فقط'], 1,
      'يركز تعريف ديورانت على النظام الاجتماعي والإنتاج الثقافي والعلاقات الإنسانية.', 'متوسط'),
    tf('العلاقة بين استقرار الأمن وقيام الحضارات علاقة عكسية وفقًا لرأي ديورانت.', false,
      'العلاقة طردية؛ فالأمن والاستقرار يساعدان على الإبداع والعمران.', 'متوسط'),
    mc('أي وسيلة من الوسائل التالية ساهمت في انتقال الحضارات بين الشعوب؟',
      ['الهجرة والتجارة', 'العزلة التامة', 'منع الاتصال', 'ثبات السكان في مكان واحد'], 0,
      'انتقلت الحضارات عبر الهجرة والتجارة والمؤلفات والحروب والاحتلال.', 'متوسط'),
  ]),
  HistoryLesson('مصادر دراسة الحضارات', 'الوحدة الأولى', [
    mc('ما المقصود بالمصدر الأولي لدراسة الحضارات؟',
      ['مؤلف كُتب بعد الحدث بقرون', 'شيء كُتب أو نُقش في زمن وقوع الحدث', 'قصة خيالية', 'رأي حديث لا يستند إلى دليل'], 1,
      'المصدر الأولي يرتبط بزمن وقوع الحدث، مثل النقوش والآثار والوثائق المعاصرة.', 'سهل'),
    mc('أي مما يلي يُعد مصدرًا ثانويًا؟',
      ['عملة أثرية', 'نقش معاصر للحدث', 'كتابات الفلاسفة اللاحقة', 'بردية من زمن الحدث'], 2,
      'تُعد كتابات الفلاسفة والشعراء والأساطير من المصادر الثانوية وفق المذكرة.', 'سهل'),
    tf('المصادر الأولية لا يشترط أن تكون قديمة جدًا؛ المهم ارتباطها بزمن الحدث.', true,
      'قد يكون الكاتب معاصرًا لحدث حديث، فيكون ما كتبه مصدرًا أوليًا.', 'متوسط'),
    mc('من مميزات المصادر الثانوية أنها:',
      ['لا يمكن الحصول عليها', 'بديل عند فقد بعض المصادر الأولية', 'تخلو دائمًا من الخيال', 'تُكتب وقت وقوع الحدث فقط'], 1,
      'توضح المذكرة أن المراجع الثانوية متاحة ويسهل الحصول عليها وقد تعوض المصادر الأولية المفقودة.', 'متوسط'),
    mc('أي مصدر يساعد على دراسة النقود والمسكوكات بوصفها دليلًا تاريخيًا؟',
      ['العملات المعدنية القديمة', 'الحكايات الخرافية وحدها', 'الأغاني الحديثة', 'القصص المتخيلة'], 0,
      'العملات والمسكوكات من المصادر الأولية التي تساعد في دراسة أحوال الحضارات.', 'سهل'),
    tf('تتفق المصادر الأولية والثانوية في أنها من إنتاج الإنسان وتساعد على توثيق الأحداث.', true,
      'تشترك المصادر بنوعيها في توثيق المعلومات والأحداث التاريخية.', 'صعب'),
  ]),
  HistoryLesson('عوامل قيام الحضارات', 'الوحدة الأولى', [
    mc('ما العامل الطبيعي الرئيس الذي ساعد على قيام الزراعة والاستقرار في مصر القديمة؟',
      ['نهر النيل', 'المحيط الأطلسي', 'الغابات الكثيفة', 'الجبال الجليدية'], 0,
      'توضح المذكرة أن نهر النيل هو العامل الطبيعي الرئيس لقيام الزراعة والاستقرار في مصر.', 'سهل'),
    mc('ارتبط قيام الحضارات في بلاد العراق القديم بوجود نهري:',
      ['النيل والفرات', 'دجلة والفرات', 'الأردن والنيل', 'دجلة والنيل'], 1,
      'قامت حضارة بلاد العراق القديم في منطقة نهري دجلة والفرات.', 'سهل'),
    tf('اعتدال المناخ وملاءمته للنشاط البشري من عوامل قيام الحضارات.', true,
      'يساعد المناخ المعتدل الإنسان على العمل والإنتاج وممارسة أنشطته.', 'سهل'),
    mc('ما أثر عدم وجود حواجز طبيعية بين أجزاء العالم القديم؟',
      ['زيادة عزلة الشعوب', 'تعطيل التجارة', 'تعزيز التواصل بين الشعوب', 'منع انتقال الخبرات'], 2,
      'ساعد غياب الحواجز الطبيعية على الاتصال والتواصل الحضاري.', 'متوسط'),
    mc('أي حضارة ارتبطت بطابع بحري وتجاري وفقًا للمذكرة؟',
      ['الحضارة الفينيقية', 'الحضارة المصرية القديمة', 'حضارة بلاد فارس', 'حضارة وادي النيل'], 0,
      'تذكر المذكرة أن الحضارة الفينيقية حضارة بحرية تجارية.', 'متوسط'),
    tf('كان كفاح الإنسان وتفاعله مع البيئة من العوامل المرتبطة بقيام الحضارات.', true,
      'تؤكد المذكرة دور الإنسان والبيئة والموارد والموقع في نشأة الحضارات.', 'صعب'),
  ]),
  HistoryLesson('ملامح من تاريخ مصر القديمة (الفرعونية)', 'الوحدة الثانية', [
    mc('من هو الملك الذي ارتبط بتوحيد القطرين عام 3200 ق.م؟',
      ['نعرمر (مينا)', 'أحمس', 'رمسيس الثاني', 'تحتمس الثالث'], 0,
      'تنسب المذكرة الوحدة التاريخية الثانية إلى الملك مينا أو نعرمر عام 3200 ق.م.', 'سهل'),
    mc('لماذا أنشأ الملك مينا مدينة منف؟',
      ['لتكون عاصمة موحدة للبلاد', 'لتكون ميناءً على البحر الأحمر', 'لتكون مقبرة للملوك', 'لتكون مركزًا للتعدين فقط'], 0,
      'كان إنشاء منف هدفًا سياسيًا للسيطرة على البلاد وربط الشمال بالجنوب.', 'متوسط'),
    tf('قسم مانيتون تاريخ مصر الفرعوني إلى ثلاثين أسرة حاكمة.', true,
      'تذكر المذكرة أن مانيتون قسم التاريخ الفرعوني إلى 30 أسرة.', 'سهل'),
    mc('أي العصور التالية عُدّ أطول عصور القوة في التقسيم الوارد بالمذكرة؟',
      ['الدولة القديمة', 'الانتقال الأول', 'الانتقال الثاني', 'العصر المتأخر'], 0,
      'تصف المذكرة الدولة القديمة بأنها أطول عصور القوة وشباب مصر.', 'متوسط'),
    mc('ما العاصمة التي ارتبطت بمملكة الشمال قبل الوحدة التاريخية؟',
      ['بوتو', 'نخب', 'طيبة', 'منف'], 0,
      'تذكر المذكرة أن عاصمة مملكة الشمال كانت بوتو، وعاصمة مملكة الجنوب نخب.', 'صعب'),
    tf('ساعدت المصاهرة وازدواج الألقاب والاهتمام بالأعياد الدينية على توطيد الروابط بين الشمال والجنوب.', true,
      'استخدم ملوك العصر العتيق روابط اجتماعية ودينية لدعم الوحدة السياسية.', 'صعب'),
  ]),
  HistoryLesson('الحياة الاقتصادية', 'الوحدة الثانية', [
    mc('ما النشاط الذي عُدّ أساس رخاء البلاد وثروتها في مصر القديمة؟',
      ['الزراعة', 'الصيد البحري فقط', 'صناعة الأسلحة فقط', 'الرعي فقط'], 0,
      'ارتبط المصري القديم بالزراعة لأنها من أهم مصادر الدخل وأساس رخاء البلاد.', 'سهل'),
    mc('أي محصول ارتبط بصناعة النسيج في مصر القديمة؟',
      ['الكتان', 'القمح', 'العدس', 'البلح'], 0,
      'تذكر المذكرة نبات الكتان ضمن نباتات الألياف المستخدمة في صناعة النسيج.', 'سهل'),
    tf('ساعد تنوع المحاصيل الزراعية في مصر القديمة على تحقيق الاكتفاء الذاتي في الظروف المعتادة.', true,
      'تذكر المذكرة أن مصر كانت تحقق الاكتفاء الذاتي من المحاصيل ما عدا فترات الكوارث وقلة الفيضان.', 'متوسط'),
    mc('ما الغرض من إنشاء الصوامع في مصر القديمة؟',
      ['تخزين الغلال ومواجهة أوقات قلة الفيضان', 'حفظ الأسلحة', 'إقامة الشعائر الدينية', 'صناعة الأدوات المعدنية'], 0,
      'ساعدت الصوامع على تخزين الغلال والاستعداد للكوارث ونقص المحصول.', 'متوسط'),
    mc('ما العامل الذي ساعد على جعل مصر مركزًا تجاريًا وحضاريًا؟',
      ['الموقع الجغرافي المتميز والسواحل البحرية', 'بعدها عن طرق التجارة', 'قلة الموارد', 'انعدام الأنهار'], 0,
      'تربط المذكرة التجارة بالموقع الجغرافي المتميز والسواحل البحرية.', 'متوسط'),
    tf('وفرت الزراعة مواد خام لبعض الصناعات مثل الكتان المستخدم في صناعة النسيج.', true,
      'توضح المذكرة التكامل بين الزراعة والصناعة من خلال توفير المواد الخام.', 'صعب'),
  ]),
  HistoryLesson('الحياة السياسية والإدارية', 'الوحدة الثانية', [
    mc('ما الهدف الذي أدرك المصري القديم أهميته لبناء دولة قوية ومتقدمة؟',
      ['الوحدة السياسية', 'تعدد الحكومات المتنافسة', 'إلغاء الإدارة', 'الانعزال عن الأقاليم'], 0,
      'تؤكد المذكرة أن أمن البلاد وبناء دولة قوية يرتبطان بالوحدة السياسية.', 'سهل'),
    mc('من الذي ارتبط بالوحدة التاريخية الثانية لمصر عام 3200 ق.م؟',
      ['مينا (نعرمر)', 'حور محب', 'أمنحتب الرابع', 'سنوسرت الثالث'], 0,
      'ارتبطت الوحدة التاريخية الثانية بالملك مينا أو نعرمر.', 'سهل'),
    tf('كان الوزير من عناصر الحكم في مصر الفرعونية.', true,
      'تذكر المذكرة الفرعون والوزير والإدارة المركزية ضمن عناصر الحكم.', 'سهل'),
    mc('ما عاصمة مملكة الجنوب قبل الوحدة؟',
      ['نخب', 'بوتو', 'منف', 'أخيتاتون'], 0,
      'كانت نخب عاصمة مملكة الجنوب، بينما كانت بوتو عاصمة مملكة الشمال.', 'متوسط'),
    mc('أي جهاز ارتبط بالمحافظة على الأمن الداخلي؟',
      ['الشرطة', 'المكتبات', 'المعابد فقط', 'الأسطول التجاري'], 0,
      'توضح المذكرة وجود شرطة للمحافظة على الأمن الداخلي إلى جانب الجيش لحماية الحدود.', 'متوسط'),
    tf('ساعد نهر النيل وانبساط أرض الوادي وخصوبة التربة على تحقيق الوحدة السياسية.', true,
      'تورد المذكرة هذه العوامل ضمن أسباب توحيد البلاد.', 'صعب'),
  ]),
  HistoryLesson('الحياة الاجتماعية', 'الوحدة الثانية', [
    mc('ما التحول الذي حدث في حياة المصري القديم خلال العصر الحجري الحديث؟',
      ['الاستقرار في الوادي ومعرفة الزراعة', 'العودة إلى التنقل الدائم', 'ترك التجمعات البشرية', 'الاعتماد على الصناعة الحديثة'], 0,
      'ارتبط العصر الحجري الحديث بالاستقرار في الوادي بعد معرفة الزراعة.', 'سهل'),
    mc('أي الفئات التالية مثلت الطبقة العليا في المجتمع المصري القديم؟',
      ['الفرعون وأسرته', 'عمال الزراعة', 'الحرفيون', 'الرعاة والخدم'], 0,
      'تضع المذكرة الفرعون وأسرته في قمة طبقات المجتمع.', 'سهل'),
    tf('كان الموظفون والفنانون والحرفيون المهرة ضمن الطبقة الوسطى.', true,
      'تذكر المذكرة هذه الفئات ضمن الطبقة الوسطى ذات الإسهام الحضاري.', 'متوسط'),
    mc('ما المقصود بالتمييز الطبقي وفقًا للمذكرة؟',
      ['منح فئة مزايا تُحرم منها بقية الفئات', 'تقسيم المجتمع حسب الوظائف فقط', 'تساوي جميع المزايا', 'تحديد واجبات كل فرد دون حقوق'], 0,
      'التمييز الطبقي هو تمييز فئة بمزايا حُرمت منها بقية فئات المجتمع.', 'متوسط'),
    mc('بماذا ارتبط اسم الإلهة ماعت في المجتمع المصري القديم؟',
      ['العدل والصدق', 'الحرب والانتصار', 'التجارة والبحر', 'الزراعة والفيضان'], 0,
      'اتخذت ماعت رمزًا للعدل والصدق وشعارًا للمحاكم المصرية.', 'متوسط'),
    tf('تمتعت المرأة في مصر الفرعونية بأدوار اجتماعية ودينية وسياسية وعسكرية.', true,
      'تذكر المذكرة أدوار المرأة كأم، ومشاركتها السياسية والعسكرية والدينية.', 'صعب'),
  ]),
  HistoryLesson('الحياة الدينية', 'الوحدة الثانية', [
    mc('أي من التالي عُدّ من خصائص الحياة الدينية عند المصري القديم؟',
      ['الإيمان بالبعث والخلود', 'رفض فكرة الحساب بعد الموت', 'عبادة معبود واحد طوال العصور', 'غياب الطقوس الدينية'], 0,
      'تعدد المعبودات والإيمان بالحساب والبعث والخلود من خصائص الحياة الدينية المذكورة.', 'سهل'),
    mc('ما اسم الإله الذي ارتبط بالموت في المعتقدات المصرية القديمة؟',
      ['أوزوريس', 'رع', 'آتون', 'حتحور'], 0,
      'تذكر المذكرة أوزوريس بوصفه إله الموت.', 'سهل'),
    tf('انقسمت المعبودات المصرية القديمة إلى معبودات محلية ومعبودات عامة.', true,
      'توضح المذكرة هذا التقسيم بين معبودات محلية وأخرى انتشرت عبادتها في أرجاء مصر.', 'متوسط'),
    mc('من الملك الذي قاد الثورة الدينية ودعا إلى عبادة آتون؟',
      ['أمنحتب الرابع (أخناتون)', 'مينا', 'سنفرو', 'رمسيس الثالث'], 0,
      'قام أمنحتب الرابع بتغيير اسمه إلى أخناتون ودعا إلى عبادة آتون.', 'سهل'),
    mc('لماذا نقل أخناتون العاصمة إلى أخيتاتون؟',
      ['للبعد عن معارضيه', 'للاقتراب من البحر الأحمر', 'لإنشاء ميناء تجاري', 'لإقامة مقبرة ملكية'], 0,
      'تذكر المذكرة أن نقل العاصمة كان للابتعاد عن معارضي الثورة الدينية.', 'متوسط'),
    tf('ارتبطت فكرة وزن القلب أمام ريشة ماعت بمعتقد الحساب بعد الموت.', true,
      'تصف المذكرة محكمة المتوفى والميزان الذي يرمز إلى العدالة.', 'صعب'),
  ]),
  HistoryLesson('الحياة الثقافية والفكرية', 'الوحدة الثانية', [
    mc('في أي عام تذكر المذكرة أن المصري القديم اخترع الكتابة؟',
      ['3350 ق.م', '3200 ق.م', '1453 م', '476 م'], 0,
      'تذكر المذكرة أن اختراع الكتابة كان عام 3350 ق.م قبل عصر الأسرات.', 'سهل'),
    mc('ما المادة التي صُنعت منها القراطيس المصرية القديمة؟',
      ['ورق البردي', 'الحرير', 'القطن', 'الجلد الصناعي'], 0,
      'كانت القراطيس لفائف مصنوعة من ورق البردي.', 'سهل'),
    tf('انتقل استخدام ورق البردي من مصر إلى مناطق في غرب آسيا وحوض البحر المتوسط وأوروبا.', true,
      'تذكر المذكرة انتقال استخدام البردي إلى حضارات ومناطق مجاورة.', 'متوسط'),
    mc('ما الاسم الذي أُطلق على مراكز البحث العلمي في مصر القديمة؟',
      ['بيوت الحياة', 'بيوت التجارة', 'قصور الحكم', 'مخازن الغلال'], 0,
      'كانت مراكز البحث العلمي تُعرف ببيوت الحياة، ومن أشهرها مركز أون.', 'سهل'),
    mc('أي مدينة اشتهرت بوصفها مركزًا مبكرًا للبحث العلمي؟',
      ['أون', 'بوتو', 'نخب', 'منف فقط'], 0,
      'تذكر المذكرة أن جامعة أون كانت من أهم وأول مراكز البحث العلمي.', 'متوسط'),
    tf('ارتبط تطور الطب والتحنيط عند المصري القديم بالمعتقدات الدينية وبالتقدم العلمي.', true,
      'توضح المذكرة أثر الاعتقاد بالبعث والخلود في التحنيط، وتقدم المصريين في الطب والكيمياء.', 'صعب'),
  ]),
];


class HistoryQuizApp extends StatefulWidget {
  const HistoryQuizApp({super.key});

  @override
  State<HistoryQuizApp> createState() => _HistoryQuizAppState();
}

class _HistoryQuizAppState extends State<HistoryQuizApp> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF285AAD);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'تحدي التاريخ',
      themeMode: darkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        scaffoldBackgroundColor: const Color(0xFFF4F7FC),
        fontFamily: 'Arial',
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: seed,
          brightness: Brightness.dark,
        ),
        fontFamily: 'Arial',
      ),
      builder: (context, child) => Directionality(
        textDirection: TextDirection.rtl,
        child: child ?? const SizedBox.shrink(),
      ),
      home: HomePage(
        darkMode: darkMode,
        onThemeChanged: (value) => setState(() => darkMode = value),
      ),
    );
  }
}

const Color navy = Color(0xFF142B4D);
const Color blue = Color(0xFF285AAD);
const Color cyan = Color(0xFF22B8CF);
const Color gold = Color(0xFFFFC857);

class HomePage extends StatefulWidget {
  final bool darkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    super.key,
    required this.darkMode,
    required this.onThemeChanged,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int lessonIndex = 0;
  String level = 'الكل';
  int questionCount = 5;
  bool twoPlayers = false;
  final TextEditingController playerOne = TextEditingController(text: 'اللاعب الأول');
  final TextEditingController playerTwo = TextEditingController(text: 'اللاعب الثاني');

  @override
  void dispose() {
    playerOne.dispose();
    playerTwo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lesson = lessons[lessonIndex];
    final available = lesson.questions
        .where((q) => level == 'الكل' || q.level == level)
        .length;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('تحدي التاريخ', style: TextStyle(fontWeight: FontWeight.w900)),
        centerTitle: true,
        actions: [
          IconButton(
            tooltip: 'تغيير المظهر',
            onPressed: () => widget.onThemeChanged(!widget.darkMode),
            icon: Icon(widget.darkMode ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 28),
        children: [
          _HeroPanel(),
          const SizedBox(height: 18),
          Row(
            children: [
              const Icon(Icons.tune_rounded, color: blue),
              const SizedBox(width: 8),
              Text('جهّز التحدي', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)),
            ],
          ),
          const SizedBox(height: 12),
          _Panel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _FieldTitle(icon: Icons.people_alt_rounded, title: 'طريقة اللعب'),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: _ModeTile(
                        title: 'لاعب واحد',
                        subtitle: 'اختبر معلوماتك',
                        icon: Icons.person_rounded,
                        selected: !twoPlayers,
                        onTap: () => setState(() => twoPlayers = false),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _ModeTile(
                        title: 'لاعبان',
                        subtitle: 'تحدٍّ بين صديقين',
                        icon: Icons.people_alt_rounded,
                        selected: twoPlayers,
                        onTap: () => setState(() => twoPlayers = true),
                      ),
                    ),
                  ],
                ),
                if (twoPlayers) ...[
                  const SizedBox(height: 14),
                  _NameInput(label: 'اسم اللاعب الأول', controller: playerOne, icon: Icons.person_outline),
                  const SizedBox(height: 10),
                  _NameInput(label: 'اسم اللاعب الثاني', controller: playerTwo, icon: Icons.person_outline),
                  const SizedBox(height: 8),
                  Text(
                    'سيلعب الصديقان على نفس الجهاز بالتناوب، ويجيب كل لاعب عن السؤال نفسه دون إظهار الإجابة الصحيحة قبل انتهاء الدورين.',
                    style: TextStyle(color: colors.onSurfaceVariant, height: 1.5, fontSize: 12),
                  ),
                ],
                const SizedBox(height: 18),
                const _FieldTitle(icon: Icons.menu_book_rounded, title: 'اختر الدرس'),
                const SizedBox(height: 9),
                DropdownButtonFormField<int>(
                  value: lessonIndex,
                  isExpanded: true,
                  decoration: const InputDecoration(
                    filled: true,
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(14))),
                    contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 13),
                  ),
                  items: List.generate(lessons.length, (i) => DropdownMenuItem(
                    value: i,
                    child: Text('${i + 1}. ${lessons[i].title}', overflow: TextOverflow.ellipsis),
                  )),
                  onChanged: (v) => setState(() => lessonIndex = v ?? 0),
                ),
                const SizedBox(height: 16),
                const _FieldTitle(icon: Icons.signal_cellular_alt_rounded, title: 'مستوى الصعوبة'),
                const SizedBox(height: 9),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: ['الكل', 'سهل', 'متوسط', 'صعب'].map((item) {
                    final active = level == item;
                    return ChoiceChip(
                      label: Text(item),
                      selected: active,
                      onSelected: (_) => setState(() => level = item),
                      selectedColor: blue.withOpacity(.16),
                      labelStyle: TextStyle(
                        color: active ? blue : colors.onSurface,
                        fontWeight: FontWeight.w700,
                      ),
                      side: BorderSide(color: active ? blue : colors.outlineVariant),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const _FieldTitle(icon: Icons.format_list_numbered_rounded, title: 'عدد الأسئلة'),
                const SizedBox(height: 9),
                Wrap(
                  spacing: 8,
                  children: [
                    _CountChip(value: 3, selected: questionCount == 3, onTap: () => setState(() => questionCount = 3)),
                    _CountChip(value: 5, selected: questionCount == 5, onTap: () => setState(() => questionCount = 5)),
                    _CountChip(value: 0, selected: questionCount == 0, onTap: () => setState(() => questionCount = 0)),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'المتاح في هذا الاختيار: $available سؤال',
                  style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 58,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
              ),
              onPressed: available == 0 ? null : () {
                final amount = questionCount == 0 ? available : min(questionCount, available).toInt();
                final name1 = playerOne.text.trim().isEmpty ? 'اللاعب الأول' : playerOne.text.trim();
                final name2 = playerTwo.text.trim().isEmpty ? 'اللاعب الثاني' : playerTwo.text.trim();
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => GamePage(
                    lesson: lesson,
                    level: level,
                    count: amount,
                    twoPlayers: twoPlayers,
                    playerOneName: name1,
                    playerTwoName: name2,
                  ),
                ));
              },
              icon: const Icon(Icons.play_arrow_rounded, size: 28),
              label: const Text('ابدأ التحدي الآن', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900)),
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: const [
              Expanded(child: _MiniFeature(icon: Icons.check_circle_rounded, text: 'تصحيح فوري')),
              SizedBox(width: 8),
              Expanded(child: _MiniFeature(icon: Icons.emoji_events_rounded, text: 'نتيجة وتقييم')),
              SizedBox(width: 8),
              Expanded(child: _MiniFeature(icon: Icons.shuffle_rounded, text: 'أسئلة متنوعة')),
            ],
          ),
          const SizedBox(height: 18),
          Text(
            'المحتوى التدريبي: 9 دروس • 54 سؤالًا',
            textAlign: TextAlign.center,
            style: TextStyle(color: colors.onSurfaceVariant, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _HeroPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        gradient: const LinearGradient(
          colors: [Color(0xFF142B4D), Color(0xFF285AAD), Color(0xFF287EAA)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        boxShadow: [
          BoxShadow(color: blue.withOpacity(.22), blurRadius: 22, offset: const Offset(0, 10)),
        ],
      ),
      child: Stack(
        children: [
          Positioned(left: -8, top: -10, child: Icon(Icons.account_balance_rounded, size: 100, color: Colors.white.withOpacity(.08))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
                decoration: BoxDecoration(color: Colors.white.withOpacity(.14), borderRadius: BorderRadius.circular(30)),
                child: const Text('الصف الأول الثانوي • الترم الأول', style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700)),
              ),
              const SizedBox(height: 17),
              const Text('هل أنت مستعد\nلتحدّي التاريخ؟', style: TextStyle(color: Colors.white, fontSize: 27, height: 1.25, fontWeight: FontWeight.w900)),
              const SizedBox(height: 9),
              const Text('اختبر معلوماتك، نافس صديقك، واجمع أكبر عدد من النقاط!', style: TextStyle(color: Colors.white70, height: 1.5)),
              const SizedBox(height: 18),
              Row(
                children: const [
                  Icon(Icons.bolt_rounded, color: gold, size: 20),
                  SizedBox(width: 5),
                  Text('ابدأ مغامرتك التعليمية', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Panel extends StatelessWidget {
  final Widget child;
  const _Panel({required this.child});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withOpacity(.45)),
      boxShadow: [BoxShadow(color: Colors.black.withOpacity(.035), blurRadius: 18, offset: const Offset(0, 6))],
    ),
    child: child,
  );
}

class _FieldTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  const _FieldTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, size: 19, color: blue),
      const SizedBox(width: 7),
      Text(title, style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 14)),
    ],
  );
}

class _ModeTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;

  const _ModeTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(16),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      decoration: BoxDecoration(
        color: selected ? blue.withOpacity(.10) : Theme.of(context).colorScheme.surface.withOpacity(.65),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: selected ? blue : Theme.of(context).colorScheme.outlineVariant, width: selected ? 1.7 : 1),
      ),
      child: Column(
        children: [
          Icon(icon, color: selected ? blue : Theme.of(context).colorScheme.onSurfaceVariant, size: 27),
          const SizedBox(height: 7),
          Text(title, style: TextStyle(fontWeight: FontWeight.w900, color: selected ? blue : null)),
          const SizedBox(height: 3),
          Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ],
      ),
    ),
  );
}

class _NameInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final IconData icon;
  const _NameInput({required this.label, required this.controller, required this.icon});

  @override
  Widget build(BuildContext context) => TextField(
    controller: controller,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: blue),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)),
      filled: true,
      isDense: true,
    ),
  );
}

class _CountChip extends StatelessWidget {
  final int value;
  final bool selected;
  final VoidCallback onTap;
  const _CountChip({required this.value, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) => ChoiceChip(
    label: Text(value == 0 ? 'كل الأسئلة' : '$value أسئلة'),
    selected: selected,
    onSelected: (_) => onTap(),
    selectedColor: blue.withOpacity(.16),
    labelStyle: TextStyle(color: selected ? blue : null, fontWeight: FontWeight.bold),
  );
}

class _MiniFeature extends StatelessWidget {
  final IconData icon;
  final String text;
  const _MiniFeature({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 5),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(13),
      border: Border.all(color: Theme.of(context).colorScheme.outlineVariant.withOpacity(.4)),
    ),
    child: Column(
      children: [
        Icon(icon, color: blue, size: 20),
        const SizedBox(height: 5),
        Text(text, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

class GamePage extends StatefulWidget {
  final HistoryLesson lesson;
  final String level;
  final int count;
  final bool twoPlayers;
  final String playerOneName;
  final String playerTwoName;

  const GamePage({
    super.key,
    required this.lesson,
    required this.level,
    required this.count,
    required this.twoPlayers,
    required this.playerOneName,
    required this.playerTwoName,
  });

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  late final List<QuizQuestion> questions;
  int questionIndex = 0;
  int activePlayer = 0;
  int scoreOne = 0;
  int scoreTwo = 0;
  int? answerOne;
  int? answerTwo;
  int? singleAnswer;
  bool singleRevealed = false;
  bool handoff = false;
  bool duelRevealed = false;

  QuizQuestion get question => questions[questionIndex];
  String get activeName => activePlayer == 0 ? widget.playerOneName : widget.playerTwoName;

  @override
  void initState() {
    super.initState();
    final pool = widget.lesson.questions
        .where((q) => widget.level == 'الكل' || q.level == widget.level)
        .toList()
      ..shuffle(Random());
    questions = pool.take(min(widget.count, pool.length).toInt()).toList();
  }

  void _selectAnswer(int value) {
    if (!widget.twoPlayers) {
      if (singleRevealed) return;
      setState(() {
        singleAnswer = value;
        singleRevealed = true;
        if (value == question.answer) scoreOne++;
      });
      return;
    }

    if (handoff || duelRevealed) return;
    setState(() {
      if (activePlayer == 0) {
        answerOne = value;
        handoff = true;
      } else {
        answerTwo = value;
        duelRevealed = true;
        if (answerOne == question.answer) scoreOne++;
        if (answerTwo == question.answer) scoreTwo++;
      }
    });
  }

  void _passToSecondPlayer() {
    setState(() {
      activePlayer = 1;
      handoff = false;
    });
  }

  void _nextQuestion() {
    if (questionIndex + 1 >= questions.length) {
      final navigator = Navigator.of(context);
      navigator.pushReplacement(MaterialPageRoute(
        builder: (_) => ResultPage(
          lesson: widget.lesson,
          questions: questions,
          twoPlayers: widget.twoPlayers,
          playerOneName: widget.playerOneName,
          playerTwoName: widget.playerTwoName,
          scoreOne: scoreOne,
          scoreTwo: scoreTwo,
          onRetry: () {
            navigator.pushReplacement(MaterialPageRoute(
              builder: (_) => GamePage(
                lesson: widget.lesson,
                level: widget.level,
                count: widget.count,
                twoPlayers: widget.twoPlayers,
                playerOneName: widget.playerOneName,
                playerTwoName: widget.playerTwoName,
              ),
            ));
          },
        ),
      ));
      return;
    }
    setState(() {
      questionIndex++;
      activePlayer = 0;
      answerOne = null;
      answerTwo = null;
      singleAnswer = null;
      singleRevealed = false;
      handoff = false;
      duelRevealed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = (questionIndex + 1) / questions.length;
    final revealed = widget.twoPlayers ? duelRevealed : singleRevealed;
    final selected = widget.twoPlayers
        ? (activePlayer == 0 ? answerOne : answerTwo)
        : singleAnswer;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lesson.title, maxLines: 1, overflow: TextOverflow.ellipsis),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          if (widget.twoPlayers) ...[
            Row(
              children: [
                Expanded(child: _ScorePill(name: widget.playerOneName, score: scoreOne, active: activePlayer == 0 && !duelRevealed)),
                const SizedBox(width: 8),
                Expanded(child: _ScorePill(name: widget.playerTwoName, score: scoreTwo, active: activePlayer == 1 && !duelRevealed)),
              ],
            ),
            const SizedBox(height: 14),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('السؤال ${questionIndex + 1} / ${questions.length}', style: const TextStyle(fontWeight: FontWeight.w900)),
              Chip(
                avatar: const Icon(Icons.signal_cellular_alt_rounded, size: 16),
                label: Text(question.level),
              ),
            ],
          ),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(value: progress, minHeight: 8, backgroundColor: colors.outlineVariant.withOpacity(.25)),
          ),
          const SizedBox(height: 17),
          if (widget.twoPlayers && !duelRevealed)
            Container(
              padding: const EdgeInsets.all(13),
              decoration: BoxDecoration(color: blue.withOpacity(.09), borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  const Icon(Icons.person_pin_circle_rounded, color: blue),
                  const SizedBox(width: 8),
                  Expanded(child: Text(handoff ? 'تم تسجيل إجابة ${widget.playerOneName}. سلّم الجهاز إلى ${widget.playerTwoName}.' : 'الدور الآن: $activeName', style: const TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          const SizedBox(height: 12),
          _Panel(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(question.trueFalse ? 'صح أم خطأ؟' : 'اختر الإجابة الصحيحة', style: const TextStyle(color: blue, fontWeight: FontWeight.w900)),
                const SizedBox(height: 12),
                Text(question.text, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900, height: 1.55)),
              ],
            ),
          ),
          const SizedBox(height: 14),
          if (handoff && widget.twoPlayers) ...[
            const SizedBox(height: 8),
            const Icon(Icons.swap_horiz_rounded, size: 48, color: blue),
            const Text('مرّر الجهاز لصديقك', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
            const SizedBox(height: 5),
            const Text('لن تظهر إجابة اللاعب الأول قبل أن ينتهي اللاعب الثاني.', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _passToSecondPlayer,
              child: Text('جاهز يا ${widget.playerTwoName}؟ ابدأ دورك'),
            ),
          ] else ...[
            ...List.generate(question.options.length, (i) {
              final isCorrect = i == question.answer;
              final isSelected = selected == i;
              Color background = colors.surface;
              Color border = colors.outlineVariant;
              if (revealed && isCorrect) {
                background = Colors.green.withOpacity(.12);
                border = Colors.green;
              } else if (revealed && isSelected && !isCorrect) {
                background = Colors.red.withOpacity(.10);
                border = Colors.red;
              }
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: revealed ? null : () => _selectAnswer(i),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 160),
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: background,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: border, width: revealed && (isCorrect || isSelected) ? 1.8 : 1),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: revealed && isCorrect ? Colors.green : (revealed && isSelected ? Colors.red : blue.withOpacity(.12)),
                          child: revealed && isCorrect
                              ? const Icon(Icons.check, color: Colors.white, size: 17)
                              : revealed && isSelected
                                  ? const Icon(Icons.close, color: Colors.white, size: 17)
                                  : Text('${i + 1}', style: const TextStyle(color: blue, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(child: Text(question.options[i], style: const TextStyle(fontSize: 15, height: 1.4, fontWeight: FontWeight.w600))),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ],
          if (revealed) ...[
            const SizedBox(height: 5),
            _Panel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.twoPlayers
                        ? 'نتيجة الجولة'
                        : (singleAnswer == question.answer ? 'إجابة صحيحة!' : 'إجابة غير صحيحة'),
                    style: const TextStyle(fontWeight: FontWeight.w900, color: blue, fontSize: 17),
                  ),
                  if (widget.twoPlayers) ...[
                    const SizedBox(height: 8),
                    _PlayerRoundResult(name: widget.playerOneName, answer: answerOne, correct: question.answer),
                    _PlayerRoundResult(name: widget.playerTwoName, answer: answerTwo, correct: question.answer),
                  ],
                  const SizedBox(height: 9),
                  Text('الإجابة الصحيحة: ${question.options[question.answer]}', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(question.explanation, style: const TextStyle(height: 1.55)),
                ],
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: 52,
              child: FilledButton.icon(
                onPressed: _nextQuestion,
                icon: const Icon(Icons.arrow_back_rounded),
                label: Text(questionIndex + 1 == questions.length ? 'اعرض النتيجة النهائية' : 'السؤال التالي'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ScorePill extends StatelessWidget {
  final String name;
  final int score;
  final bool active;
  const _ScorePill({required this.name, required this.score, required this.active});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    decoration: BoxDecoration(
      color: active ? blue.withOpacity(.12) : Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(15),
      border: Border.all(color: active ? blue : Theme.of(context).colorScheme.outlineVariant),
    ),
    child: Row(
      children: [
        Icon(Icons.person_rounded, color: active ? blue : Colors.grey),
        const SizedBox(width: 6),
        Expanded(child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold))),
        Text('$score', style: const TextStyle(fontWeight: FontWeight.w900, color: blue, fontSize: 18)),
      ],
    ),
  );
}

class _PlayerRoundResult extends StatelessWidget {
  final String name;
  final int? answer;
  final int correct;
  const _PlayerRoundResult({required this.name, required this.answer, required this.correct});

  @override
  Widget build(BuildContext context) {
    final isCorrect = answer == correct;
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Icon(isCorrect ? Icons.check_circle_rounded : Icons.cancel_rounded, color: isCorrect ? Colors.green : Colors.red, size: 19),
          const SizedBox(width: 7),
          Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.bold))),
          Text(isCorrect ? 'إجابة صحيحة +1' : 'إجابة غير صحيحة', style: TextStyle(color: isCorrect ? Colors.green : Colors.red, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final HistoryLesson lesson;
  final List<QuizQuestion> questions;
  final bool twoPlayers;
  final String playerOneName;
  final String playerTwoName;
  final int scoreOne;
  final int scoreTwo;
  final VoidCallback onRetry;

  const ResultPage({
    super.key,
    required this.lesson,
    required this.questions,
    required this.twoPlayers,
    required this.playerOneName,
    required this.playerTwoName,
    required this.scoreOne,
    required this.scoreTwo,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final total = questions.length;
    final percent = total == 0 ? 0 : (scoreOne / total * 100).round();
    final winner = scoreOne == scoreTwo ? 'تعادل رائع!' : (scoreOne > scoreTwo ? 'الفائز: $playerOneName' : 'الفائز: $playerTwoName');
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('النتيجة النهائية'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(18),
        children: [
          const SizedBox(height: 12),
          Icon(Icons.emoji_events_rounded, size: 86, color: gold),
          const SizedBox(height: 12),
          Text(twoPlayers ? winner : 'أحسنت! انتهى التحدي', textAlign: TextAlign.center, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
          const SizedBox(height: 7),
          Text(lesson.title, textAlign: TextAlign.center, style: TextStyle(color: colors.onSurfaceVariant)),
          const SizedBox(height: 20),
          if (twoPlayers) ...[
            Row(
              children: [
                Expanded(child: _FinalScoreCard(name: playerOneName, score: scoreOne, total: total, isWinner: scoreOne > scoreTwo)),
                const SizedBox(width: 10),
                Expanded(child: _FinalScoreCard(name: playerTwoName, score: scoreTwo, total: total, isWinner: scoreTwo > scoreOne)),
              ],
            ),
          ] else
            _Panel(
              child: Column(
                children: [
                  Text('$percent%', style: const TextStyle(fontSize: 52, color: blue, fontWeight: FontWeight.w900)),
                  Text('$scoreOne من $total إجابات صحيحة', style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(percent >= 85 ? 'ممتاز! أداء رائع.' : percent >= 60 ? 'أحسنت، واصل المراجعة.' : 'لا بأس، حاول مرة أخرى وستتحسن.', textAlign: TextAlign.center),
                ],
              ),
            ),
          const SizedBox(height: 20),
          SizedBox(
            height: 52,
            child: FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('إعادة التحدي'),
            ),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
            icon: const Icon(Icons.home_rounded),
            label: const Text('العودة للرئيسية'),
          ),
        ],
      ),
    );
  }
}

class _FinalScoreCard extends StatelessWidget {
  final String name;
  final int score;
  final int total;
  final bool isWinner;
  const _FinalScoreCard({required this.name, required this.score, required this.total, required this.isWinner});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: isWinner ? gold.withOpacity(.16) : Theme.of(context).colorScheme.surface,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: isWinner ? gold : Theme.of(context).colorScheme.outlineVariant),
    ),
    child: Column(
      children: [
        Icon(isWinner ? Icons.workspace_premium_rounded : Icons.person_rounded, color: isWinner ? Colors.orange : blue, size: 30),
        const SizedBox(height: 7),
        Text(name, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        Text('$score', style: const TextStyle(fontSize: 34, color: blue, fontWeight: FontWeight.w900)),
        Text('من $total نقاط', style: const TextStyle(fontSize: 11, color: Colors.grey)),
        if (isWinner) const Padding(padding: EdgeInsets.only(top: 7), child: Text('الفائز 🏆', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange))),
      ],
    ),
  );
}
