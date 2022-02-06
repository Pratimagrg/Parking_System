import 'package:get/get.dart';
import 'package:parkingsystem/views/screens/account.dart';
import 'package:parkingsystem/views/screens/entry.dart';
import 'package:parkingsystem/views/screens/entrylist.dart';
import 'package:parkingsystem/views/screens/history.dart';
import 'package:parkingsystem/views/screens/home.dart';
import 'package:parkingsystem/views/screens/login.dart';
import 'package:parkingsystem/views/screens/register.dart';

class GetRoutes {
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const entry = '/entry';
  static const detail = '/detail';
  static const entryList = '/entry-list';
  static const account = '/account';
  static const history = '/history';

  static List<GetPage> routes = [
    GetPage(
      name: GetRoutes.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: GetRoutes.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: GetRoutes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: GetRoutes.entry,
      page: () => const EntryScreen(),
    ),
    GetPage(
      name: GetRoutes.entryList,
      page: () => EntryListScreen(),
    ),
    GetPage(
      name: GetRoutes.account,
      page: () => AccountScreen(),
    ),
    GetPage(
      name: GetRoutes.history,
      page: () => History(),
    ),
  ];
}
