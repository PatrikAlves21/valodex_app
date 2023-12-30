import 'package:app_valorant/app/app_module.dart';
import 'package:app_valorant/shared/http_service.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

class AppBloc extends BlocBase {
  bool wasInitialized = false;
  // Stream se está exibindo teclado
  final BehaviorSubject<bool> _visibleKeyboardCtrl =
      BehaviorSubject.seeded(false);
  ValueStream<bool> get isKeyboardVisibleStream => _visibleKeyboardCtrl.stream;
  void setKeyboardVisibility(bool isVisible) =>
      _visibleKeyboardCtrl.add(isVisible);

  HttpService get httpService => AppModule.to.getDependency();

  @override
  void dispose() {
    _visibleKeyboardCtrl.close();
    super.dispose();
  }
}
