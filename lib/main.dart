import 'package:ecommerce/API/repository.dart';
import 'package:ecommerce/features/cart/bloc/control_cart_bloc/control_cart_bloc.dart';
import 'package:ecommerce/features/home/bloc/home_bloc.dart';
import 'package:ecommerce/utils/appTheme.dart';
import 'package:ecommerce/features/home/home.dart';
import 'package:ecommerce/utils/network.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiBlocProvider(
        providers: [
          
          BlocProvider(create: (context) => ControlCartBloc()),
          BlocProvider(
              create: (context) => HomeBloc(
                  Repository(NetworkInfoImpl(InternetConnectionChecker())))..add(HomeInitalEvent())),
        ],
        // 
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              scaffoldBackgroundColor: const Color.fromARGB(255, 239, 239, 239),
              primarySwatch: Colors.blue,
              backgroundColor: AppUtils().white,
              textTheme:
                  GoogleFonts.latoTextTheme(Theme.of(context).textTheme)),
          home:
              RepositoryProvider(
                create:(context) =>
                Repository(NetworkInfoImpl(InternetConnectionChecker())),
                child: const MyHomePage(),
          ),
        ),
      );
    });
  }
}
