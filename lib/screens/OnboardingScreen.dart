
import 'package:annapurna/screens/LoginScreen.dart';
import 'package:annapurna/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static String id = 'onboarding';

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> with WidgetsBindingObserver {
  int _currentIndex = 0;

  final List<String> _mockImages = [
    'assets/images/1.png',
    'assets/images/2.png',
    'assets/images/3.png',
  ];


  dynamic _deviceWidth;
  dynamic _deviceHeight;

  @override
  void didChangeDependencies() {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // if (state == AppLifecycleState.resumed) {
    //   ReferInvitation().handleDynamicLink(context);
    // }
  }

  final _pageController = PageController(
    initialPage: 0,
  );

  //Function to create dots which indicate swiping feature
  Row buildDots(currentIndex) {
    Color currentColor = Colors.grey;
    final Color normalColor = Colors.grey.withOpacity(0.5);
    const List temp = [0, 1, 2];
    return Row(
      children: [
        ...temp.map((element) {
          return Container(
            margin: const EdgeInsets.only(right: 5),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: currentIndex == element ? currentColor : normalColor,
            ),
          );
        }).toList(),
      ],
    );
  }

  void swipeNextandSubmit() {
    if (_currentIndex <= 1) {
      setState(() {
        _currentIndex = _currentIndex + 1;
        _pageController.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
      });
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context){return FirebaseAuth.instance.currentUser!=null?HomePage(): LoginPage();}));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
            builder: (context, snap) {
              return Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      physics: const BouncingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (ctx, i) {
                        // Created this OnboardingPage Template in a separate widget and ran it through a PageView.builder
                        return OnBoardingItem(
                            deviceWidth: _deviceWidth,
                            deviceHeight: _deviceHeight,
                            mockImage: _mockImages[i]);
                      },
                      itemCount: 3,
                    ),
                  ),
                  Container(
                    width: _deviceWidth,
                    height: 0.09 * _deviceHeight,
                    color: kMustard,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pushNamed(
                              LoginPage.id
                            ),
                            child: Text('Skip', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                        Center(child: buildDots(_currentIndex)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextButton(
                            onPressed: swipeNextandSubmit,
                            child: SizedBox(
                              width: 0.2*_deviceWidth,
                              child: AnimatedSwitcher(
                                transitionBuilder: (child, animation) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                duration: const Duration(milliseconds: 250),
                                child: Text(_currentIndex <= 1 ? 'Next' : 'Get Started',
                                    key: ValueKey(_currentIndex <= 1 ? 'Next' : 'Get Started'),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    Key? key,
    required this.deviceWidth,
    required this.deviceHeight,
    required this.mockImage,
  }) : super(key: key);

  final double? deviceWidth;
  final double? deviceHeight;
  final String mockImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          color: kGrey,
          height: deviceHeight!*0.91,
          width: deviceWidth,
          child: Image.asset(
            mockImage,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
