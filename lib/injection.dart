import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '/core/services/toast_service.dart';
import '/injection.config.dart';

final sl = GetIt.instance;

@InjectableInit()
void configureInjection() {
  sl.init();
}

Future<void> restart() async {
  if (sl.currentScopeName == null) return;
  await sl.resetScope();
  configureInjection();
}

@module
abstract class UtilsInitInjection {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;

  @lazySingleton
  ToastService get toastService => ToastService();
}
