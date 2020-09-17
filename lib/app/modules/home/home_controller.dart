import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  String haveStarted3Times = '';

  @observable
  String typedOnField = '';

  @action
  Future<void> valueTyped(String newString) async {
    typedOnField = newString;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('typedOnField', typedOnField);
  }

  @action
  Future<void> stringSaved() async {
    final prefs = await SharedPreferences.getInstance();
    final startupString = prefs.getString('typedOnField');
    typedOnField = startupString;
  }

  /// Will Increment the startup number and store it then
  /// use setState to display in the UI
  @action
  Future<void> incrementStartup() async {
    final prefs = await SharedPreferences.getInstance();

    int lastStartupNumber = prefs.getInt('startupNumber');
    if (lastStartupNumber == null) {
      lastStartupNumber = 0;
    }

    int currentStartupNumber = ++lastStartupNumber;

    await prefs.setInt('startupNumber', currentStartupNumber);

    if (currentStartupNumber == 3) {
      haveStarted3Times = '$currentStartupNumber times completed';

      // Reset only if you want to
      await prefs.setInt('startupNumber', 0);
    } else {
      haveStarted3Times = '$currentStartupNumber times started the app';
    }
  }

  /// Will get the startupnumber from shared_preferences
  /// will return 0 if null
  // Future<int> _getIntFromSharedPref() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final startupNumber = prefs.getInt('startupNumber');
  //   if (startupNumber == null) {
  //     return 0;
  //   }
  //   return startupNumber;
  // }

  // /// Reset the counter in shared_preferences to 0
  // Future<void> _resetCounter() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('startupNumber', 0);
  // }
}

// @action
// Future<void> incrementStartup() async {
//   final prefs = await SharedPreferences.getInstance();

//   int lastStartupNumber = await _getIntFromSharedPref();
//   int currentStartupNumber = ++lastStartupNumber;

//   await prefs.setInt('startupNumber', currentStartupNumber);

//   if (currentStartupNumber == 3) {
//     haveStarted3Times = '$currentStartupNumber Times Completed';

//     // Reset only if you want to
//     await _resetCounter();
//   } else {
//     haveStarted3Times = '$currentStartupNumber Times started the app';
//   }
// }
