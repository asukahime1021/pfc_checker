import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart' as Basic;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pfc/db/db.dart';
import 'package:pfc/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AchievementPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AchievementPageState();
}

class _AchievementPageState extends ConsumerState {
  
  String registerButtonText = "登録";
  final TextEditingController _pController = TextEditingController(text: "0.0");
  final TextEditingController _fController = TextEditingController(text: "0.0");
  final TextEditingController _cController = TextEditingController(text: "0.0");
  final TextEditingController _calController = TextEditingController(text: "0.0");

  List<String> _messageList = [];

  Widget messageField() {
    return Basic.Column(
      children: [
        for (var _message in _messageList)
          Text(_message, style: TextStyle(color: Colors.red),)
      ]
    );
  }

  Widget inputField(IconData icon, TextEditingController controller, String labelText, {bool? isName}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        keyboardType: isName != null && isName ? TextInputType.name : TextInputType.number,
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon)
        ),
      )
    );
  }

  Widget registerButton() {
    return ElevatedButton(
      onPressed: () async {
        var _errorList = <String>[];
        if (_pController.text.isNotEmpty && !isNumeric(_pController.text)
          || _fController.text.isNotEmpty && !isNumeric(_fController.text)
          || _cController.text.isNotEmpty && !isNumeric(_cController.text)
          || _calController.text.isNotEmpty && !isNumeric(_calController.text)
        ) {
          _errorList.add("パラメータは数字で入力してクレメンス");
          setState(() {
            _messageList = _errorList;
          });
          return;
        }
        await database
          .delete(database.achivements)
          .go();
        
        var achievement = Achivement(
          id: 0, 
          value_protein: _pController.text, 
          value_lipid: _fController.text, 
          value_carbon: _cController.text, 
          value_cal: _calController.text);

        await database
          .into(database.achivements)
          .insert(achievement);
        ref.read(achievementProvider.notifier).update((state) => achievement);
        Fluttertoast.showToast(msg: "目標設定しました");

        _pController.text = "0.0";
        _fController.text = "0.0";
        _cController.text = "0.0";
        _calController.text = "0.0";
      },
      child: Text(registerButtonText)
    );
  }

  Widget currentAchievementDisplayButton() {
    return OutlinedButton(
      onPressed: () async {
        var achivements = await database.select(database.achivements).get();
        if (achivements.isNotEmpty) {
          var achivement = achivements[0];
          _pController.text = achivement.value_protein;
          _fController.text = achivement.value_lipid;
          _cController.text = achivement.value_carbon;
          _calController.text = achivement.value_cal;
        }
      }, 
      child: const Text("現在の目標"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Basic.Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            messageField(),
            inputField(Icons.local_fire_department, _calController, "カロリー"),
            inputField(Icons.fitness_center, _pController, "タンパク質"),
            inputField(Icons.cake, _fController, "脂質"),
            inputField(Icons.rice_bowl, _cController, "炭水化物"),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                currentAchievementDisplayButton(),
                SizedBox(width: 10),
                registerButton(),
              ],
            )
          ],
        )
      )
    );
  }
}