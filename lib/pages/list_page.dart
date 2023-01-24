import 'package:drift/drift.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/basic.dart' as Basic;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pfc/db/db.dart';
import 'package:pfc/main.dart';


const DIGIT_COLUMN_WIDTH = 45.0;
const EDIT_COLUMN_WIDTH = 30.0;

class ItemListPage extends ConsumerStatefulWidget {

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ItemListPageState();
}

class RowState {
  RowState(this.id, this.food, this.protein, this.lipid, this.carbide, this.cal);

  final int id;
  final String food;
  final String protein;
  final String lipid;
  final String carbide;
  final String cal;
}

class _ItemListPageState extends ConsumerState {
  int? _foodValue;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _pController = TextEditingController();
  final TextEditingController _fController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  final TextEditingController _calController = TextEditingController();

  @override
  void initState() {
    super.initState();

    Future(() async {
      var foods = await (database.select(database.foods)..orderBy([(u) => OrderingTerm(expression: u.id)])).get();
      ref.read(foodProvider.notifier).update((state) => foods);
      var eateds = await database.select(database.eateds).get();
      ref.read(eatedProvider.notifier).update((state) => eateds);
    });
  }

  ///
  /// 黒の境界線
  /// 合計フッターに使用
  ///
  ///
  Widget blackDivider() {
    return const VerticalDivider(
      width: 1,
      color: Colors.black,
      thickness:1,
    );
  }

  ///
  /// 黒26の境界線
  /// ヘッダーに使用
  ///
  ///
  Widget black26Divider() {
    return const VerticalDivider(
      width: 1,
      color: Colors.black26,
      thickness:1,
    );
  }

  ///
  /// 文字が中揃いのテキスト
  /// ヘッダーとフッターで使用
  ///
  ///
  Widget centerText(String text, {bool? edit, bool? sum}) {
    var width = edit != null && edit ? EDIT_COLUMN_WIDTH : DIGIT_COLUMN_WIDTH;
    return Container(
      height: 30,
      width: width, 
      alignment: Alignment.center, 
      decoration: sum != null && sum 
        ? const BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.black), top: BorderSide(color: Colors.black))
        )
        : null,
      child: Text(
        text, 
        style: const TextStyle(fontSize: 12)),
    );
  }

  Widget headerCenterText(String text, String shortText) {
    return Container(
      height: 30,
      width: DIGIT_COLUMN_WIDTH,
      child: Basic.Column(
        children: [
          Text(text, style: TextStyle(fontSize: 9)),
          Text(shortText, style: TextStyle(fontSize: 11))
        ]
      )
    );
  }

  ///
  /// list要素の入力
  ///
  ///
  ///
  Widget listInput(String labelText, TextEditingController controller) {
    return Expanded(
      child: TextField(
        keyboardType: TextInputType.number, 
        controller: controller, 
        decoration: InputDecoration(labelText: labelText, labelStyle: const TextStyle(fontSize: 13))
      )
    );
  }

  ///
  /// 食べたボタン
  ///
  ///
  ///
  Widget eatedButton() {
    return ElevatedButton(
      child: Text("食べた！"),
      onPressed: () async {
        await database
          .into(database.eateds)
          .insert(
            EatedsCompanion.insert(
              name: _nameController.text, 
              value_protein: _pController.text, 
              value_lipid: _fController.text, 
              value_carbon: _cController.text, 
              value_cal: _calController.text
            )
          );
        
        var eateds = await database.select(database.eateds).get();
        ref.read(eatedProvider.notifier).update((state) => eateds);
      }
    );
  }

  ///
  /// リストをクリアボタン
  ///
  ///
  ///
  Widget clearButton() {
    return OutlinedButton(
      child: const Text("リストをクリア"),
      onPressed: () {
        showDialog(
          context: context, 
          builder: (context) {
            return AlertDialog(
              content: Text("リストを消去します。\nいいね？"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(), 
                  child: const Text("キャンセル")),
                TextButton(
                  onPressed: () async {
                    await database
                      .delete(database.eateds).go();
                    ref.read(eatedProvider.notifier).update((state) => []);
                    Navigator.of(context).pop();
                  }, 
                  child: const Text("OK"))
              ],
            );
          });
      }
    );
  }

  ///
  /// 入力クリアボタン
  ///
  ///
  ///
  Widget inputClearButton() {
    return ElevatedButton(
      child: const Text("入力をクリア"),
      onPressed: () {
        setState(() {
          _foodValue = null;
        });
        _nameController.text = "";
        _pController.text = "";
        _fController.text = "";
        _cController.text = "";
        _calController.text = "";
      }
    );
  }

  ///
  /// ヘッダー
  /// 食べるものだけExpanded
  ///
  ///
  Widget header() {
    return Container(
      color: Colors.black26,
      height: 30,
      child:
        Row(children: [
          const SizedBox(width: 10,),
          black26Divider(),
          Expanded(child: Container(alignment: Alignment.center, child: Text('食べたもの'))),
          black26Divider(),
          headerCenterText('タンパク質', 'P'),
          black26Divider(),
          headerCenterText('脂質', 'F'),
          black26Divider(),
          headerCenterText('炭水化物', 'C'),
          black26Divider(),
          headerCenterText('カロリー', 'cal'),
          black26Divider(),
          const SizedBox(width: 10,),
        ],)
    );
  }

  ///
  /// 食べたものの各合計値を表示する
  /// フッターの少し上、リストの下
  ///
  ///
  Widget sum_footer() {
    var eatedList = ref.watch(eatedProvider);
    String addValues(String value, String e) {
      if (value.isEmpty) {
        value = "0.0";
      }
      var tmp = e.isEmpty || !isNumeric(e) ? 0.0 : double.parse(e);
      return (double.parse(value) + tmp).toStringAsFixed(2);
    };

    var p = eatedList.isEmpty ? "0" : eatedList.map((e) => e.value_protein).reduce(addValues);
    var f = eatedList.isEmpty ? "0" : eatedList.map((e) => e.value_lipid).reduce(addValues);
    var c = eatedList.isEmpty ? "0" : eatedList.map((e) => e.value_carbon).reduce(addValues);
    var ca = eatedList.isEmpty ? "0" : eatedList.map((e) => e.value_cal).reduce(addValues);
    return Container(
      height: 30,
      child:
        Row(children: [
          const SizedBox(width: 10,),
          blackDivider(),
          Expanded(
            child: Container(
              alignment: Alignment.center, 
              child: const Text('合計'), 
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black), top: BorderSide(color: Colors.black)),
              )
            )
          ),
          blackDivider(),
          centerText(p, sum: true),
          blackDivider(),
          centerText(f, sum: true),
          blackDivider(),
          centerText(c, sum: true),
          blackDivider(),
          centerText(ca, sum: true),
          blackDivider(),
          const SizedBox(width: 10,),
        ],)
    );
  }

  ///
  /// 目標値
  /// フッターの少し上、合計の下
  ///
  ///
  Widget achievement_footer() {
    var achievement = ref.watch(achievementProvider);

    var p = achievement == null ? "0.0" : achievement.value_protein;
    var f = achievement == null ? "0.0" : achievement.value_lipid;
    var c = achievement == null ? "0.0" : achievement.value_carbon;
    var ca = achievement == null ? "0.0" : achievement.value_cal;
    return Container(
      height: 30,
      child:
        Row(children: [
          const SizedBox(width: 10,),
          blackDivider(),
          Expanded(
            child: Container(
              alignment: Alignment.center, 
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black), top: BorderSide(color: Colors.black)),
              ),
              child: const Text('目標値'), 
            )
          ),
          blackDivider(),
          centerText(p, sum: true),
          blackDivider(),
          centerText(f, sum: true),
          blackDivider(),
          centerText(c, sum: true),
          blackDivider(),
          centerText(ca, sum: true),
          blackDivider(),
          const SizedBox(width: 10,),
        ],)
    );
  }

  ///
  /// 食べたもの一覧
  ///
  ///
  ///
  Widget listItem(Eated item) {
    return Dismissible(
      key: ObjectKey(item.id),
      onDismissed: (direction) async {
        await (database.delete(database.eateds)..where((tbl) => tbl.id.equals(item.id))).go();
        ref.read(eatedProvider.notifier).update((state) => state.where((e) => e.id != item.id).toList());
      },
      child: IntrinsicHeight(
        child: Row(
          children: [
            const SizedBox(width: 10,),
            black26Divider(),
            Expanded(
              child: Text(item.name)
            ),
            black26Divider(),
            centerText(item.value_protein),
            black26Divider(),
            centerText(item.value_lipid),
            black26Divider(),
            centerText(item.value_carbon),
            black26Divider(),
            centerText(item.value_cal),
            black26Divider(),
            const SizedBox(width: 10,),
          ],
        ),
      )
    );
  }

  Widget clearButton_footer() {
    return Container(height: 20, child: clearButton()); 
  }

  ///
  /// フッター
  /// 食べたもの入力場所
  ///
  ///
  Widget footer() {
    var _list = ref.watch(foodProvider);
    var _dropDownList = _list.map((e) => DropdownMenuItem<int>(child: Text(e.name), value: e.id)).toList();
    return Container(
      height: 300,
      child: Basic.Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            children: const [
              SizedBox(width: 10),
              Text("登録したものから選ぶ")
            ]
          ),
          Row(
            children: [
              const SizedBox(width: 10),
              DropdownButton(
                menuMaxHeight: 200,
                value: _foodValue,
                items: _dropDownList, 
                onChanged: (value) {
                  setState(() {
                    _foodValue = value as int;
                  });
                  var food = ref.read(foodProvider).where((e) => e.id == _foodValue).first;
                  _nameController.text = food.name;
                  _pController.text = food.value_protein;
                  _fController.text = food.value_lipid;
                  _cController.text = food.value_carbon;
                  _calController.text = food.value_cal;
                }
              )
            ]
          ),
          Row(
            children: [
              const SizedBox(width: 5),
              Container(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: "食べるもの", labelStyle: const TextStyle(fontSize: 13))
                ),
              )
            ],
          ),
          Row(
            children: [
              SizedBox(width: 5),
              listInput("タンパク質", _pController),
              SizedBox(width: 10),
              listInput("脂質", _fController),
              SizedBox(width: 10),
              listInput("炭水化物", _cController),
              SizedBox(width: 10),
              listInput("カロリー", _calController),
              SizedBox(width: 5),
            ]
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              eatedButton(),
              SizedBox(width: 10),
              inputClearButton(),
              SizedBox(width: 10),
              clearButton()
            ],
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child:
          Basic.Column(
            children: [
              header(),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                child: ListView(children: [
                  for (var eatedItem in ref.watch(eatedProvider))
                    listItem(eatedItem)
                  ],
                )
              ),
              sum_footer(),
              achievement_footer(),
              footer(),
            ],
          )
      )
    );
  }
  
}
