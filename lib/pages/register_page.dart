import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart' as Basic;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pfc/db/db.dart';
import 'package:pfc/main.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends ConsumerStatefulWidget {
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState {
  
  int? _foodId;
  String registerButtonText = "登録";
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _pController = TextEditingController();
  final TextEditingController _fController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  final TextEditingController _calController = TextEditingController();

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

  Widget foodSelect() {
    var list = ref.watch(foodProvider).map((e) => DropdownMenuItem(child: Text(e.name), value: e.id,)).toList();

    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: Basic.Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [const Text("登録したものから選ぶ")]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              DropdownButton(
                value: _foodId,
                items: list, 
                onChanged: (value) {
                  var newId = value as int;
                  setState(() {
                    _foodId = newId;
                    registerButtonText = "変更";
                  });
                  var food = ref.read(foodProvider).where((e) => e.id == newId).first;
                  _foodController.text = food.name;
                  _pController.text = food.value_protein;
                  _fController.text = food.value_lipid;
                  _cController.text = food.value_carbon;
                  _calController.text = food.value_cal;
                }
              )
            ],
          )
        ],
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

        var name = _foodController.text.isNotEmpty ? _foodController.text : "";
        _foodId == null
        ? await database
          .into(database.foods)
          .insert(
            FoodsCompanion.insert(
              name: name, 
              value_protein: _pController.text, 
              value_lipid: _fController.text, 
              value_carbon: _cController.text, 
              value_cal: _calController.text
            )
          )
        : await 
          (database.update(database.foods)..where((tbl) => tbl.id.equals(_foodId!)))
          .write(
            FoodsCompanion(
              name: Value(_foodController.text),
              value_protein: Value(_pController.text),
              value_lipid: Value(_fController.text),
              value_carbon: Value(_cController.text),
              value_cal: Value(_calController.text)
            )
          );
        
        var _foodList = await database.select(database.foods).get();
        ref.read(foodProvider.notifier).update((state) => _foodList);
        Fluttertoast.showToast(msg: "$registerButtonTextしました");

        _foodController.text = "";
        _pController.text = "";
        _fController.text = "";
        _cController.text = "";
        _calController.text = "";
        setState(() {
          _foodId = null;
        });
      },
      child: Text(registerButtonText)
    );
  }

  Widget deleteButton() {
    return _foodId != null 
    ? ElevatedButton(
        child: const Text("削除"),
        onPressed: () async {
          await (database.delete(database.foods)..where((tbl) => tbl.id.equals(_foodId!))).go();
          ref.read(foodProvider.notifier).update((state) => state.where((e) => e.id != _foodId).toList());
          setState(() {
            _foodId = null;
            registerButtonText = "登録";
          });
          _foodController.text = "";
          _pController.text = "";
          _fController.text = "";
          _cController.text = "";
          _calController.text = "";
          Fluttertoast.showToast(msg: "削除しました");
        },
      )
    : const SizedBox(width: 0);
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
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Row(
                children: [foodSelect()],
                mainAxisAlignment: MainAxisAlignment.start,
              )
            ),
            inputField(Icons.restaurant, _foodController, "名前", isName: true),
            inputField(Icons.local_fire_department, _calController, "カロリー"),
            inputField(Icons.fitness_center, _pController, "タンパク質"),
            inputField(Icons.cake, _fController, "脂質"),
            inputField(Icons.rice_bowl, _cController, "炭水化物"),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                registerButton(),
                SizedBox(width: _foodId != null ? 20 : 0),
                deleteButton(),
              ],
            )
          ],
        )
      )
    );
  }
}