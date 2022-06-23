import 'package:flutter/material.dart';
import 'next_page.dart';

void main() {
  runApp(const AppGiaCam());
}

class AppGiaCam extends StatefulWidget {
  const AppGiaCam({Key? key}) : super(key: key);

  @override
  State<AppGiaCam> createState() => _AppGiaCamState();
}

class _AppGiaCamState extends State<AppGiaCam> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppGiaCamExtension(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppGiaCamExtension extends StatefulWidget {
  AppGiaCamExtension({Key? key}) : super(key: key);

  @override
  State<AppGiaCamExtension> createState() => _AppGiaCamExtensionState();
}

//Sửa lỗi Navigation not working
class _AppGiaCamExtensionState extends State<AppGiaCamExtension> {
  String buttonName = 'Start shopping!';
  int currentIndex = 0;
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SelectableText('Welcome Customers'),
        backgroundColor: const Color.fromARGB(255, 255, 115, 0),
      ),
      body: Center(
        child: currentIndex == 0
        
            ? Container(
                width: double.infinity,
                height: double.infinity,
                color: const Color.fromARGB(255, 255, 230, 0),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        onPrimary: const Color.fromARGB(255, 255, 255, 255),
                        primary: const Color.fromARGB(255, 255, 115, 0),
                      ),
                      onPressed: () {
                        setState(() {
                          buttonName = 'Start Shopping!';
                        });
                      },
                      child: Text(buttonName),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => const NextPage(),
                          ),
                        );
                      },
                      child: const Text('Next page ->'),
                    ),
                  ],
                ),
              )
            : GestureDetector(
                onTap: (() {
                  setState(() {
                    _isClicked = !_isClicked;
                  });
                }),
                child: _isClicked
                    ? Image.asset('images/MuaBanGiaCam.png')
                    : Image.asset('images/Giacam.png'),
              ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home,
                color: Colors.pink, size: 24.0, semanticLabel: 'yes please'),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(
              Icons.settings,
              color: Color.fromARGB(255, 252, 0, 0),
              size: 30.0,
            ),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}