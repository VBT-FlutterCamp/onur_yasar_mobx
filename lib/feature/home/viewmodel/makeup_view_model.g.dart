// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'makeup_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MakeupViewModel on _MakeupViewModelBase, Store {
  final _$isLoadingAtom = Atom(name: '_MakeupViewModelBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$makeupModelAtom = Atom(name: '_MakeupViewModelBase.makeupModel');

  @override
  List<MakeupModel>? get makeupModel {
    _$makeupModelAtom.reportRead();
    return super.makeupModel;
  }

  @override
  set makeupModel(List<MakeupModel>? value) {
    _$makeupModelAtom.reportWrite(value, super.makeupModel, () {
      super.makeupModel = value;
    });
  }

  final _$fetchMakeupAsyncAction =
      AsyncAction('_MakeupViewModelBase.fetchMakeup');

  @override
  Future<void> fetchMakeup() {
    return _$fetchMakeupAsyncAction.run(() => super.fetchMakeup());
  }

  final _$_MakeupViewModelBaseActionController =
      ActionController(name: '_MakeupViewModelBase');

  @override
  void changeLoading() {
    final _$actionInfo = _$_MakeupViewModelBaseActionController.startAction(
        name: '_MakeupViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MakeupViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
makeupModel: ${makeupModel}
    ''';
  }
}
