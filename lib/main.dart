import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/features/log_in.dart';
import 'components/features/home_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  static String title = 'Notes SQLite';

  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(0, 0, 0, 0),
          elevation: 0,
        ),
      ),
      home: const Scaffold(

        body: NewWidget(),

        drawer: MyDrawer(),
      ),
    );
  }
}
class NewWidget extends StatelessWidget {
  // Declare a key parameter in your custom widget constructor
  final Key? key;

  // Assign the key parameter to the super constructor
  const NewWidget({
    this.key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoginApp();
    // You can return any widget you want here, LoginApp() is just an example
  }
}
