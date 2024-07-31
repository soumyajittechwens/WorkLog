import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:intl/intl.dart';
import 'package:techwens_pms/controller/authentication_controller.dart';
import 'package:techwens_pms/model/ProjectIdWiseWorklogsData.dart';
import 'package:techwens_pms/ui/login_page.dart';
import 'package:techwens_pms/ui/profile_create_page.dart';
import 'package:techwens_pms/widgets/custom_image_view.dart';

import '../Utils/Shared Preference/shared_pref.dart';
import '../helper/ImageConstant.dart';
import '../helper/colorConstant.dart';
import '../model/project_list_data.dart';
import 'package:flutter/services.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isButtonClicked = false;
  AuthenticationController authenticationController =
      Get.put(AuthenticationController());
  late Stream<DateTime> timeStream;
  DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss');
  ProjectListDetailsData? initialProject;

  String date = "";

  void showSnackBar(String data, Color backgroundColor) {
    setState(() {
      if (isButtonClicked) {
        isButtonClicked = false;
      } else {
        isButtonClicked = true;
      }
    });

    authenticationController.getProjectIdWiseWorkLogDataList(
        initialProject!.id.toString(), () => showButtonData());

    Get.snackbar(
      'Success',
      data,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: Colors.white,
    );
  }

  void showButtonData() {
    if (authenticationController.projectIdWiseWorkLogsData != null) {
      if (authenticationController
          .projectIdWiseWorkLogsData!.projectIdWiseDetailsData!.isNotEmpty) {
        if (authenticationController
                .projectIdWiseWorkLogsData!.projectIdWiseDetailsData![0].endTime
                .toString() ==
            'null') {
          setState(() {
            isButtonClicked = true;
          });
        } else {
          setState(() {
            isButtonClicked = false;
          });
        }
      }
    }
  }

  @override
  void initState() {
    super.initState();
    timeStream =
        Stream.periodic(const Duration(seconds: 1), (i) => DateTime.now());
    isButtonClicked = false;
    date = formatDateWithSuffix(DateTime.now()).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: ColorConstant.themeColor,
        title: const Text("WorkLog",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              await SharedPrefUtils.setToken("");
              authenticationController.projectIdWiseWorkLogsData = null;
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            icon: const Icon(Icons.logout, color: Colors.white, size: 24),
          ),
        ],
      ),
      body: Container(
        color: ColorConstant.background_color,
        child: SafeArea(
          child: GetBuilder(
            init: authenticationController,
            initState: (c) {
              authenticationController.getProjectList();
            },
            builder: (c) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              SharedPrefUtils.getName().toString(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              date,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        authenticationController.projectListData?.response !=
                                null
                            ? Column(
                                children: [
                                  authenticationController
                                          .projectListData!.response!.isNotEmpty
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            _buildProjectListDropDownItem(
                                                authenticationController
                                                    .projectListData!
                                                    .response!),
                                          ],
                                        )
                                      : Container(),
                                  const SizedBox(height: 5),
                                ],
                              )
                            : Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      _buildProjectListDropDownItem([]),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                ],
                              ),
                        const SizedBox(height: 5),
                        if (authenticationController
                                    .projectIdWiseWorkLogsData !=
                                null &&
                            authenticationController.projectIdWiseWorkLogsData!
                                .projectIdWiseDetailsData!.isNotEmpty)
                          if (authenticationController
                                  .projectIdWiseWorkLogsData!
                                  .projectIdWiseDetailsData![0]
                                  .endTime
                                  .toString() ==
                              'null')
                            const Text(
                                textAlign: TextAlign.center,
                                "* Please complete your current project then move to another project",
                                style: TextStyle(
                                    color: ColorConstant.textSecondColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))
                          else
                            Container(),
                        const SizedBox(height: 5),
                        GestureDetector(
                          onTap: () {
                            if (initialProject == null) {
                              Get.snackbar(
                                'Error',
                                "Please choose project",
                                snackPosition: SnackPosition.TOP,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                              return;
                            }
                            HapticFeedback.vibrate();
                            authenticationController.saveWorkLog(
                                initialProject!.id.toString(),
                                "start the task successfully.",
                                context,
                                (message, color) =>
                                    showSnackBar(message, color));
                          },
                          child: Center(
                            child: Container(
                              decoration:
                                  const BoxDecoration(shape: BoxShape.circle),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: CustomImageView(
                                    imagePath: isButtonClicked
                                        ? ImageConstant.stop_image
                                        : ImageConstant.start_image,
                                    height: 130,
                                    width: 130),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Center(
                          child: authenticationController
                                      .projectIdWiseWorkLogsData !=
                                  null
                              ? Text(
                                  DateFormat("HH'H' mm'M'").format(
                                      DateFormat("HH:mm").parse(
                                          authenticationController
                                              .projectIdWiseWorkLogsData!
                                              .additional!
                                              .duration
                                              .toString())),
                                  style: const TextStyle(
                                      color: ColorConstant.textSecondColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                  textAlign: TextAlign.center,
                                )
                              : const Text(
                                  '00:00',
                                  style: TextStyle(
                                      color: ColorConstant.textSecondColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25),
                                  textAlign: TextAlign.center,
                                ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                      child: Container(
                        color: Colors.grey[200], // Differentiate color
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 12.0,
                                        top: 12.0,
                                        bottom: 12.0,
                                        right: 50.0),
                                    child: Text(
                                      "Start",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 30.0,
                                        top: 12.0,
                                        bottom: 12.0,
                                        right: 12.0),
                                    child: Text(
                                      "End",
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: Colors.black,
                                height: 5,
                              ),
                              authenticationController.projectIdWiseWorkLogsData
                                          ?.projectIdWiseDetailsData !=
                                      null
                                  ? Column(
                                      children: [
                                        authenticationController
                                                .projectIdWiseWorkLogsData!
                                                .projectIdWiseDetailsData!
                                                .isNotEmpty
                                            ? SizedBox(
                                                height: 250,
                                                child: ListView.builder(
                                                  itemCount: authenticationController
                                                      .projectIdWiseWorkLogsData
                                                      ?.projectIdWiseDetailsData!
                                                      .length,
                                                  itemBuilder:
                                                      (BuildContext context,
                                                          int index) {
                                                    return _showCheckInCheckOutView(
                                                        context,
                                                        authenticationController
                                                            .projectIdWiseWorkLogsData!
                                                            .projectIdWiseDetailsData![index]);
                                                  },
                                                ),
                                              )
                                            : Container(),
                                      ],
                                    )
                                  : const Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 24.0),
                                          child: Text(
                                            "Please choose project to show your work log",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )
                                      ],
                                    )
                              // Add more widgets here as needed
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _showCheckInCheckOutView(
      BuildContext context, ProjectIdWiseDetailsData checkInCheckOutData) {
    return GestureDetector(
      onTap: () {
        // Navigate to the new page and pass the patient data
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 60.0, top: 12.0, bottom: 12.0),
            child: Text(
              DateFormat('hh:mm a').format(
                  DateTime.parse(checkInCheckOutData.startTime.toString())
                      .toLocal()),
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 12.0, bottom: 12.0, right: 60.0),
            child: Text(
              checkInCheckOutData.endTime != null
                  ? DateFormat('hh:mm a').format(
                      DateTime.parse(checkInCheckOutData.endTime.toString())
                          .toLocal())
                  : "",
              style: const TextStyle(color: Colors.black, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectListDropDownItem(
      List<ProjectListDetailsData> projectData) {
    bool isDropdownEnabled = false;

    if (authenticationController.projectIdWiseWorkLogsData != null) {
      if (authenticationController
          .projectIdWiseWorkLogsData!.projectIdWiseDetailsData!.isNotEmpty) {
        isDropdownEnabled =
            authenticationController.projectIdWiseWorkLogsData != null &&
                authenticationController.projectIdWiseWorkLogsData!
                        .projectIdWiseDetailsData![0].endTime
                        .toString() ==
                    'null';
      }
    }

    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (initialProject != null) ...[
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 8.0),
                  child: Text(
                    initialProject!.client ?? '',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 14),
                  ),
                ),
              ],
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<ProjectListDetailsData>(
                    hint: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Select Project',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    autofocus: false,
                    value: initialProject,
                    items: projectData.map((ProjectListDetailsData type) {
                      return DropdownMenuItem<ProjectListDetailsData>(
                        value: type,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            type.name ?? '',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 18),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: isDropdownEnabled
                        ? null
                        : (ProjectListDetailsData? newValue) {
                            if (newValue != null) {
                              setState(() {
                                initialProject = newValue;
                                date = formatDateWithSuffix(DateTime.now())
                                    .toString();
                                if (initialProject != null) {
                                  print(
                                      "Id===${initialProject!.id.toString()}");
                                  authenticationController
                                      .getProjectIdWiseWorkLogDataList(
                                          initialProject!.id.toString(),
                                          () => showButtonData());
                                }
                              });
                            }
                          },
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String greetingMessage(String Name) {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 11.59) {
      return 'Good Morning..$Name';
    } else if (timeNow >= 12 && timeNow <= 16) {
      return 'Good Afternoon..$Name';
    } else if (timeNow > 16 && timeNow < 20) {
      return 'Good Evening..$Name';
    } else {
      return 'Good Night..$Name';
    }
  }

  String getDayWithSuffix(int day) {
    if (!(day >= 1 && day <= 31)) return day.toString();
    if (day >= 11 && day <= 13) return '${day}th';
    switch (day % 10) {
      case 1:
        return '${day}st';
      case 2:
        return '${day}nd';
      case 3:
        return '${day}rd';
      default:
        return '${day}th';
    }
  }

  String formatDateWithSuffix(DateTime date) {
    String month = DateFormat('MMM').format(date);
    String dayWithSuffix = getDayWithSuffix(date.day);
    return '$month, $dayWithSuffix';
  }
}
