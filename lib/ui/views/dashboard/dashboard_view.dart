import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:growsmart/state.dart';
import 'package:growsmart/ui/common/app_colors.dart';
import 'package:growsmart/ui/common/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:growsmart/ui/components/submit_button.dart';
import 'package:intl/intl.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';

import '../../../core/data/models/product.dart';
import 'dashboard_viewmodel.dart';

/// @author Amrah uthman sali
/// email: Saliamrah300@gmail.com
/// july, 2024
///

class DashboardView extends StackedView<DashboardViewModel> {
  DashboardView({Key? key}) : super(key: key);

  final PageController _pageController = PageController();

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set the height of the AppBar
        backgroundColor: Colors.white, // Set your AppBar background color
        elevation: 0, // Remove AppBar shadow
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, // Space out the children
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      // Define the action when the avatar is tapped
                    },
                    child: CircleAvatar(
                      child: Icon(Icons.person_2_outlined,
                          size: 30, color: Colors.black),
                      radius: 30,
                      backgroundColor: Colors.grey.shade200,
                    ),
                  ),
                  SizedBox(width: 16), // horizontalSpaceMedium
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back',
                        style: TextStyle(
                          color: kcMediumGrey,
                          letterSpacing: 1,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Andrew Smith',
                        style: TextStyle(
                          letterSpacing: 1,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.search, color: Colors.black),
                    onPressed: () {
                      // Define the action when the search icon is pressed
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined,
                        color: Colors.black),
                    onPressed: () {
                      // Define the action when the favorite icon is pressed
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await viewModel.refreshData();
        },
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            verticalSpaceSmall,
            SubmitButton(
                isLoading: false,
                label: "Start health assessment",
                submit: () {},
                color: kcPrimaryColor),
            verticalSpaceMedium,
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Explore categories',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      letterSpacing: 1,
                      color: kcPrimaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 15,
                      childAspectRatio: 1,
                    ),
                    itemCount:
                        8, // Set the number of items you want in the grid
                    itemBuilder: (context, index) {
                      // Define different icons or content for each container
                      String labelText;
                      String svgIconPath;
                      switch (index) {
                        case 0:
                          svgIconPath = 'assets/images/Cadiologist.svg';
                          labelText = 'Heart';
                          break;
                        case 1:
                          svgIconPath = 'assets/images/Dentists.svg';
                          labelText = 'dental';
                          break;
                        case 2:
                          svgIconPath = 'assets/images/Nephrologists.svg';
                          labelText = 'Kidney';
                          break;
                        case 3:
                          svgIconPath = 'assets/images/Gastroenterologists.svg';
                          labelText = 'Stomach';
                          break;
                        case 4:
                          svgIconPath = 'assets/images/Pulmonologists.svg';
                          labelText = 'Lung';
                          break;
                        case 5:
                          svgIconPath = 'assets/images/Neurologists.svg';
                          labelText = 'Brain';
                          break;
                        case 6:
                          svgIconPath = 'assets/images/Psychiatrists.svg';
                          labelText = 'Mental';
                          break;
                        default:
                          svgIconPath = 'assets/images/Hepatologists.svg';
                          labelText = 'Liver';
                          break;
                      }

                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius:
                              BorderRadius.circular(16), // Rounded corners
                        ), // Background color for the container
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                svgIconPath, // The SVG icon to display
                                width: 40, // Width of the SVG icon
                                height: 40, // Height of the SVG icon
                              ),
                              SizedBox(
                                  height: 8), // Space between icon and text
                              Text(
                                labelText, // The label text
                                style: TextStyle(
                                  fontSize: 14, // Font size
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ] // Siz
                            ), // Siz
                      );
                    },
                  ),
                ),
              ),
            ),
            verticalSpaceMedium,
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Find Doctors',
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      letterSpacing: 1,
                      color: kcPrimaryColor,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                  child: Column(
                    children: [
                      Row(
                
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: Colors.grey.shade200,
                                    child: Icon(
                                      Icons.person_2_outlined,
                                      size: 50,
                                      color: kcBlackColor,
                                    ),
                                  ),
                                ),
                                horizontalSpaceSmall,
                                const Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jennifer miller',
                                      style: TextStyle(
                                        color: kcBlackColor,
                                        letterSpacing: 1,
                                        fontSize: 16,
                                      ),
                                    ),
                                    verticalSpaceSmall,
                                    Text(
                                      ' Pediatrician | Mercy Hospital',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                horizontalSpaceLarge,
                                SvgPicture.asset(
                                  'assets/images/heart.svg',
                                  width: 20, // Width of the SVG icon
                                  height: 20, // Height of the SVG icon
                                ),
                
                
                
                              ],
                
                            ),
                
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '4.8',
                            style: TextStyle(
                              color: kcBlackColor,
                              letterSpacing: 1,
                              fontSize: 16,
                            ),
                          ),
                          horizontalSpaceMedium,
                          Text(
                            '10:30am - 5:30pm',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      verticalSpaceSmall,
                      Container(
                        margin: EdgeInsets.all(15), // Adds margin around the Card
                        width: 400,
                        child: ElevatedButton(
                          onPressed: () {
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kcSecondaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Button padding
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24), // Rounded corners
                            ),
                          ),
                          child: Text(
                            'Book Appointment',
                            style: TextStyle(
                              color: kcPrimaryColor,
                              fontSize: 16, // Font size
                            ),
                          ),
                        ),
                      )
                    ],
                
                  ),
                
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void onViewModelReady(DashboardViewModel viewModel) {
    viewModel.init();
    super.onViewModelReady(viewModel);
    viewModel.initialise();
    Timer.periodic(const Duration(seconds: 8), (Timer timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.round() + 1;
        if (nextPage >= viewModel.featuredRaffle.length) {
          nextPage = 0;
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void onDispose(DashboardViewModel viewModel) {
    viewModel.dispose();
  }


  @override
  DashboardViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      DashboardViewModel();
}

