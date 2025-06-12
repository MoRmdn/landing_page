// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:landing_page/core/network/network_info.dart' as _i768;
import 'package:landing_page/core/services/toast_service.dart' as _i473;
import 'package:landing_page/injection.dart' as _i610;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final utilsInitInjection = _$UtilsInitInjection();
    gh.lazySingleton<_i895.Connectivity>(() => utilsInitInjection.connectivity);
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => utilsInitInjection.firebaseFirestore,
    );
    gh.lazySingleton<_i473.ToastService>(() => utilsInitInjection.toastService);
    gh.lazySingleton<_i768.NetworkInfo>(
      () => _i768.NetworkInfoImpl(connectivity: gh<_i895.Connectivity>()),
    );
    return this;
  }
}

class _$UtilsInitInjection extends _i610.UtilsInitInjection {}
