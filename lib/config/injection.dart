import 'package:birthday_app/config/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


@InjectableInit(asExtension: true)
void configureDependencies() => getIt.init();

final getIt = GetIt.instance;
