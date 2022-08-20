import 'package:flutter/material.dart';
import 'package:scaffold/utils/consts.dart';
import 'package:textfield_tags/textfield_tags.dart';
class LanguageTag extends StatefulWidget {
  @override
  _LanguageTagState createState() => _LanguageTagState();
}

class _LanguageTagState extends State<LanguageTag> {
  late double _distanceToField;
  late TextfieldTagsController _controller;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller = TextfieldTagsController();
  }

  @override
  Widget build(BuildContext context) {
     const List<String> _pickLanguage = <String>[
      'english',
      'Hindi',
      'Spanish',
      'French',
    ];
    return Column(
        children: [
          Autocomplete<String>(
            optionsViewBuilder: (context, onSelected, options) {
              return Container(
                margin:  EdgeInsets.symmetric(
                    horizontal: V_SMALL_PAD_HOR, vertical: V_SMALL_PAD_VER/5),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Material(
                    elevation: 4.0,
                    child: ConstrainedBox(
                      constraints:  BoxConstraints(maxHeight: AppConstants().height*0.23),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final dynamic option = options.elementAt(index);
                          return TextButton(
                            onPressed: () {
                              onSelected(option);
                            },
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0),
                                child: Text(
                                  '$option',
                                  textAlign: TextAlign.left,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return _pickLanguage.where((String option) {
                return option.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String selectedTag) {
              _controller.addTag = selectedTag;
            },
            fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
              return TextFieldTags(
                textEditingController: ttec,
                focusNode: tfn,
                textfieldTagsController: _controller,

                textSeparators: const [' ', ','],
                letterCase: LetterCase.normal,
                validator: (String tag) {
                  if (_controller.getTags!.contains(tag)) {
                    return 'you already entered that';
                  }
                  return null;
                },
                inputfieldBuilder:
                    (context, tec, fn, error, onChanged, onSubmitted) {
                  return ((context, sc, tags, onTagDelete) {
                    return Padding(
                      padding:  EdgeInsets.symmetric(horizontal: V_SMALL_PAD_HOR),
                      child: TextField(
                        controller: tec,
                        focusNode: fn,
                        decoration: InputDecoration(
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.black,
                                width: 3.0),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff383838383838),
                                width: 3.0),
                          ),
                          hintText: _controller.hasTags ? '' : "Enter Language...",
                          errorText: error,
                          prefixIconConstraints: BoxConstraints(
                              maxWidth: _distanceToField * 0.74),
                          prefixIcon: tags.isNotEmpty
                              ? SingleChildScrollView(
                            controller: sc,
                            scrollDirection: Axis.horizontal,
                            child: Row(
                                children: tags.map((String tag) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20.0),
                                      ),
                                      color:
                                      Color(0xff383838),
                                    ),
                                    margin:
                                     EdgeInsets.only(right: V_SMALL_PAD_VER),
                                    padding:  EdgeInsets.symmetric(
                                        horizontal: V_SMALL_PAD_HOR, vertical: SMALL_PAD_HOR/4),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          child: Text(
                                            '$tag',
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                          onTap: () {
                                            //print("$tag selected");
                                          },
                                        ),
                                        const SizedBox(width: 4.0),
                                        InkWell(
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 14.0,
                                            color: Color.fromARGB(
                                                255, 233, 233, 233),
                                          ),
                                          onTap: () {
                                            onTagDelete(tag);
                                          },
                                        )
                                      ],
                                    ),
                                  );
                                }).toList()),
                          )
                              : null,
                        ),
                        onChanged: onChanged,
                        onSubmitted: onSubmitted,
                      ),
                    );
                  });
                },
              );
            },
          ),

        ],
      );


  }
}