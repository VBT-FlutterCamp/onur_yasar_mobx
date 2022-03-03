import 'package:flutter/material.dart';
import 'package:flutter_makeup/core/base/base_view_model.dart';
import 'package:flutter_makeup/feature/home/model/makeup_model.dart';
import 'package:flutter_makeup/feature/home/services/makeup_services.dart';
import 'package:mobx/mobx.dart';
part 'makeup_view_model.g.dart';

class MakeupViewModel = _MakeupViewModelBase with _$MakeupViewModel;

abstract class _MakeupViewModelBase with Store, BaseViewModel {
  late IMakeupService makeupService;

  @observable
  bool isLoading = false;
  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @observable
  List<MakeupModel>? makeupModel;

  @action
  Future<void> fetchMakeup() async {
    changeLoading();
    makeupModel = await makeupService.fetchMakeup();
    changeLoading();
  }

  @override
  void init() {
    makeupService = MakeupService(networkManager);
    fetchMakeup();
  }

  @override
  void setContext(BuildContext context) => this.context = context;
}
