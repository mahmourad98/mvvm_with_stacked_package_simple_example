import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:untitled03/user_bloc/repository/user_repository.dart';
import 'package:untitled03/user_bloc/user_bloc.dart';
import 'app.dart';

main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
      ? HydratedStorage.webStorageDirectory
      : await getTemporaryDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () => runApp(const AppRoot(),),
    storage: storage,
  );
}

class AppRoot extends StatelessWidget{
  const AppRoot({Key? key,}) : super(key: key,);

  @override
  Widget build(BuildContext context,) {
    return MultiBlocProvider(
      providers: <BlocProvider>[
        BlocProvider<UserBloc>(
          create: (_) => UserBloc(UserFakeDataRepository(),),
        ),
      ],
      child: const MyApp(),
    );
  }

}


