import 'package:doa2k/feature/how_to_use/presentation/widget/custom_text.dart';
import 'package:flutter/material.dart';

class HowToUseBody extends StatelessWidget {
  const HowToUseBody({super.key});
  static const List<String> steps = [
    'أضغط علي علامة الزائد لأضافة الدواء',
    'قم بأدخال اسم الدواء في أول خانة',
    'قم بأدخال ملاحظات الدواء في ثاني خانة مثل قبل أم بعد الأكل',
    'أختر عدد أيام تناول الدواء',
    'أختر عدد مرات تناول الدواء في اليوم الواحد',
    'حدد الوقت الذي ستأخذ فيه الدواء لأول مره',
    'حدد التاريخ اللذي ستأخذ فيه الدواء لأول مره',
    'قم بالضغط علي زر إضافة',
    'سيقوم التطبيق بعد هذه الخطوات بأضافة باقي مواعيد الأدوية بشكل تلقائي في الأيام المحددة و جميع الأوقات اللتي يجب أخذ الدواء فيها بعد تحديد موعد أول جرعة فقط',
    'سيقوم التطبيق بأرسال أشعار اليك و تنبيهك لتذكيرك بموعد الدواء',
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => CustomTextWidget(text: steps[index],index: index,),
      itemCount: steps.length,
    );
  }
}
