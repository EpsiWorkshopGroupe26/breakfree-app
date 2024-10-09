import 'package:breakfree/helpers/extensions/build_context_extension.dart';
import 'package:breakfree/pages/navigation_bar.dart';
import 'package:breakfree/pages/tabs/home.dart';
import 'package:breakfree/pages/tabs/user_profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TabScreen extends StatefulWidget {
  final int? page;
  const TabScreen({super.key, this.page});

  @override
  _CustomNavigationBarDemoState createState() =>
      _CustomNavigationBarDemoState();
}

class _CustomNavigationBarDemoState extends State<TabScreen> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.page ?? 0;
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: context.colorScheme.surface,
    ));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          const HomePage(),
          Container(),
          Container(),
          UserProfilView(),
        ],
      ),
      bottomNavigationBar: BreakFreeNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
