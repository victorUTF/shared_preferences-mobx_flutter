import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  final controller = HomeController();

  _textField({String labelText, onChanged}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller.incrementStartup().then((value) => controller.stringSaved());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mobx + Shared Preferences"),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 50.0,
            ),
            Observer(
              builder: (_) {
                return _textField(
                  labelText: "Random text",
                  onChanged: controller.valueTyped,
                );
              },
            ),
            Observer(
              builder: (_) {
                return Center(
                  child: Text(
                    controller.typedOnField,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
            Observer(
              builder: (_) {
                return Expanded(
                  child: Center(
                    child: Text(
                      controller.haveStarted3Times,
                      style: TextStyle(fontSize: 26),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
