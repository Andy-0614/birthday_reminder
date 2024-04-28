import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//
ThemeData darkMode = ThemeData(
  fontFamily: 'jf',
  colorScheme: ColorScheme.dark(
    primary: Color(0xFF121212),
    secondary: Color(0xFF424242),
    onSecondary: Color(0xFF607D8B),
    tertiary: Color(0xFFFFFFFF),
    onTertiary: Color(0xFFFFFFFF),
  ),
);
ThemeData lightMode = ThemeData(
  fontFamily: 'jf',
  colorScheme: ColorScheme.light(
    primary: Color(0xFFFFFFFF),
    secondary: Color(0xFFebedef),
    onSecondary: Color(0xFF8A65FF),
    tertiary: Color(0xFF424242),
    onTertiary: Color(0xFF424242),
  ),
);
class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeDate => _themeData;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme(){
    if(_themeData == lightMode){
      themeData = darkMode;
    }else{
      themeData = lightMode;
    }
  }
}
int _selectedIndex = 0;
//
void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        child: const MyApp(),
      )
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  //
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        theme: Provider.of<ThemeProvider>(context).themeDate,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        //
        home: const MainPage()
    );
  }
}
//
class MainPage extends StatefulWidget {
  const MainPage({super.key});
  //
  @override
  State<MainPage> createState() => _MainPageState();
}
class _MainPageState extends State<MainPage> {
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomePage(),
          SetPage(),
          InfoPage(),
        ],
      ),
      //
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.none,
        shape: CircularNotchedRectangle(),
        color: Theme.of(context).colorScheme.primary,
        elevation: 0,
        //
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              /* style */
              icon: ImageIcon(
                AssetImage('lib/image/home.png'),
                size: 40,
                color: _selectedIndex==0 ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.secondary
              ),
              /* function */
              onPressed:(){
                setState(() {
                  if(_selectedIndex!=0){
                    _selectedIndex = 0;
                  }
                });
              },
            ),
            IconButton(
              /* style */
              icon: Icon(Icons.person),
              iconSize: 40,
              color: _selectedIndex==1 ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.secondary,
              /* function */
              onPressed: () {
                setState(() {
                  if(_selectedIndex!=1){
                    _selectedIndex = 1;
                  }
                });
              },
            ),
            IconButton(
              /* style */
              icon: Icon(Icons.info),
              iconSize: 40,
              color: _selectedIndex==2 ? Theme.of(context).colorScheme.onSecondary : Theme.of(context).colorScheme.secondary,
              /* function */
              onPressed: () {
                setState(() {
                  if(_selectedIndex!=2){
                    _selectedIndex = 2;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
//
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  //
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
//
class SetPage extends StatefulWidget {
  const SetPage({super.key});
  //
  @override
  State<SetPage> createState() => _SetPageState();
}
class _SetPageState extends State<SetPage> {
  //
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          /* style */
          title: Text(
            '一般',
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 16, // 文本大小
            ),
          ),
        ),
        ListTile(
          /* style */
          leading: Icon(
            Provider.of<ThemeProvider>(context).themeDate==darkMode ? Icons.dark_mode : Icons.light_mode,
            color: Theme.of(context).colorScheme.tertiary
          ),
          title: Text(
            '主題',
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 24, // 文本大小
            ),
          ),
          subtitle: Text(
            Provider.of<ThemeProvider>(context).themeDate==darkMode ? "深色" : "淺色",
            style: TextStyle(
              color: Theme.of(context).colorScheme.onTertiary,
              fontSize: 18, // 文本大小
            ),
          ),
          /* function */
          onTap: (){
            Provider.of<ThemeProvider>(context,listen: false).toggleTheme();
          },
        ),
      ]
    );
  }
}
//
class InfoPage extends StatefulWidget {
  const InfoPage({super.key});
  //
  @override
  State<InfoPage> createState() => _InfoPageState();
}
class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
//