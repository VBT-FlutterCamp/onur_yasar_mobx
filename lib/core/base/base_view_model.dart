import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';

abstract class BaseViewModel {
  INetworkManager get networkManager => NetworkManager(options: BaseOptions());
  late BuildContext context;

  void setContext(BuildContext context);
  void init();
}
