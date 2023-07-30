import 'package:birthday_app/core/asset_path.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final PageController _pageController = PageController();
  int _activePage = 0;

  final List<_CarouselItem> _pages = [
    const _CarouselItem(AssetPath.homeCarouselOne, '25 августа\n2023'),
    const _CarouselItem(AssetPath.homeCarouselTwo, '25 августа\n2023'),
    const _CarouselItem(AssetPath.homeCarouselThree, '25 августа\n2023'),
    const _CarouselItem(AssetPath.homeCarouselFour, '25 августа\n2023'),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _activePage = index;
              });
            },
            itemCount: _pages.length,
            itemBuilder: (context, index) {
              return _pages[index % _pages.length];
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List<Widget>.generate(_pages.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: 5,
                        width: _activePage == index ? 30 : 5,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _CarouselItem extends StatelessWidget {
  const _CarouselItem(this.imagePath, this.title);

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 250.h,
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 15.h,
          left: 15.w,
          child: BirthdayText.custom(
            title,
            heading1Style.copyWith(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
