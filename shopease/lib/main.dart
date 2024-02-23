import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopease/pages/navigation.dart';
import 'package:shopease/pages/welcome/splash.dart';
import 'package:shopease/provider/app_provider.dart';
import 'package:shopease/themes/light_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'; // Import flutter_screenutil
import 'package:firebase_core/firebase_core.dart';
import 'firebase/firebase_options.dart';


void main() async{


  WidgetsFlutterBinding.ensureInitialized();


// ...

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);


  runApp(const ShopEase());
}

class ShopEase extends StatelessWidget {
  const ShopEase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize flutter_screenutil
    ScreenUtilInit(
      designSize: const Size(360, 640), // Provide your design size
    );

    return ChangeNotifierProvider(
      create: (context) => AppChangeNotifier(),
      child: ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
        return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ShopEase',
        home: SplashScreen(),
        theme: lightTheme,
      );
      },
    )

      
      
      
      
      
      
      
      
      
      
      
    );
  }
}
