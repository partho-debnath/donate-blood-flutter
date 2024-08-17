import 'dart:developer';
import 'package:blooddonate/presentation/ui/widgets/multiple_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../models/donar_model_data.dart';
import '../widgets/donar_card.dart';

class AskBloodScreen extends StatefulWidget {
  const AskBloodScreen({super.key});

  @override
  State<AskBloodScreen> createState() => _AskBloodScreenState();
}

class _AskBloodScreenState extends State<AskBloodScreen> {
  @override
  Widget build(context) {
    const SizedBox gapHeight = const SizedBox(height: 10);
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Blood'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: MultipleSelect(onSelected: (value) {
              log(
                '=========$value',
              );
            }),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              separatorBuilder: (context, index) => gapHeight,
              itemBuilder: (context, index) {
                DonarData data = DonarData(
                  1,
                  'John',
                  'Wick',
                  'abc@gmail.com',
                  'Dhaka, Mirpur-2',
                  '1999-02-04',
                  'male',
                  'A+',
                  '0143224',
                  '343.343',
                  '34355.667',
                  'https://www.shutterstock.com/image-photo/profile-picture-smiling-young-african-260nw-1873784920.jpg',
                );
                return DonarCard(
                  donarData: data,
                );
              },
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
