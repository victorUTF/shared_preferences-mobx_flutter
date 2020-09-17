// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$haveStarted3TimesAtom =
      Atom(name: '_HomeControllerBase.haveStarted3Times');

  @override
  String get haveStarted3Times {
    _$haveStarted3TimesAtom.reportRead();
    return super.haveStarted3Times;
  }

  @override
  set haveStarted3Times(String value) {
    _$haveStarted3TimesAtom.reportWrite(value, super.haveStarted3Times, () {
      super.haveStarted3Times = value;
    });
  }

  final _$typedOnFieldAtom = Atom(name: '_HomeControllerBase.typedOnField');

  @override
  String get typedOnField {
    _$typedOnFieldAtom.reportRead();
    return super.typedOnField;
  }

  @override
  set typedOnField(String value) {
    _$typedOnFieldAtom.reportWrite(value, super.typedOnField, () {
      super.typedOnField = value;
    });
  }

  final _$valueTypedAsyncAction = AsyncAction('_HomeControllerBase.valueTyped');

  @override
  Future<void> valueTyped(String newString) {
    return _$valueTypedAsyncAction.run(() => super.valueTyped(newString));
  }

  final _$stringSavedAsyncAction =
      AsyncAction('_HomeControllerBase.stringSaved');

  @override
  Future<void> stringSaved() {
    return _$stringSavedAsyncAction.run(() => super.stringSaved());
  }

  final _$incrementStartupAsyncAction =
      AsyncAction('_HomeControllerBase.incrementStartup');

  @override
  Future<void> incrementStartup() {
    return _$incrementStartupAsyncAction.run(() => super.incrementStartup());
  }

  @override
  String toString() {
    return '''
haveStarted3Times: ${haveStarted3Times},
typedOnField: ${typedOnField}
    ''';
  }
}
