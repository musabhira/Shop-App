import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopapp/core/constants/home_constants/home_constants.dart';
import 'package:shopapp/core/themes/app_theme.dart';
import 'package:shopapp/features/home/presentation/widgets/circlur_image_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/green_arrow_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/horizontal_scroll_widget.dart';
import 'package:shopapp/features/home/presentation/widgets/text_with_arrow_widget.dart';

class HomePage extends ConsumerWidget {
  static const routePath = '/home';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final constants = ref.watch(homeConstantsProvider);
    final theme = AppTheme.of(context);
    return Scaffold(
      backgroundColor: theme.colors.textSubtle,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(
                    '406, Skyline Park Date, MM Road...',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: theme.colors.primary,
              ),
              const Spacer(),
              Container(
                padding: EdgeInsets.all(theme.spaces.space_100),
                decoration: BoxDecoration(
                    color: theme.colors.textInverse,
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Icon(
                  Icons.shopping_cart,
                  color: theme.colors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: theme.spaces.space_100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    'https://media.gettyimages.com/id/1704221597/vector/green-energy-banner-design-vector-illustration-environment-renewable-energy-clean-energy.jpg?s=612x612&w=gi&k=20&c=rWUhYIUQfsvOgNLCZr55gMtcmDx2MZ3OH-8bwsepugo=',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: theme.spaces.space_200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: theme.spaces.space_100 * 6.25,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(theme.spaces.space_100),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: theme.spaces.space_100,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: constants.searchhinttxt,
                          hintStyle: TextStyle(color: theme.colors.textSubtle),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: theme.spaces.space_100),
                      padding: EdgeInsets.all(theme.spaces.space_100),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(theme.spaces.space_100),
                          gradient: theme.colors.secondary),
                      child:
                          Icon(Icons.search, color: theme.colors.textInverse),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: theme.spaces.space_200,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: theme.spaces.space_300),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(theme.spaces.space_100),
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: theme.spaces.space_200,
                        vertical: theme.spaces.space_200),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          constants.availableServicetxt,
                          style: theme.typography.h700,
                        ),
                        SizedBox(height: theme.spaces.space_100),
                        const Row(
                          children: [
                            CircularImageWidget(),
                            Spacer(),
                            CircularImageWidget(),
                            Spacer(),
                            CircularImageWidget(),
                            Spacer(),
                            CircularImageWidget(),
                          ],
                        ),
                        SizedBox(
                          height: theme.spaces.space_200,
                        ),
                        const Row(
                          children: [
                            CircularImageWidget(),
                            Spacer(),
                            CircularImageWidget(),
                            Spacer(),
                            CircularImageWidget(),
                            Spacer(),
                            GreenArrowWidget()
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            TextWithArrowWidget(
                leftText: constants.cleanServicestxt,
                rightText: constants.seeAlltxt,
                icon: Icons.arrow_forward_ios_outlined),
            const HorizontalScrollWidget(),
            SizedBox(
              height: theme.spaces.space_900 * 2,
            )
          ],
        ),
      ),
    );
  }
}
