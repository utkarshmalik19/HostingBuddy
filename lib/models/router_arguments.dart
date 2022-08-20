import 'package:scaffold/models/inquiry_model.dart';

class InquiryDetailArguments {
  final InquiryModels list;
  final int initalSelectedIndex;
  InquiryDetailArguments(
      {required this.list, required this.initalSelectedIndex});
}
