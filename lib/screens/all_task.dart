import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todoflutterandgo/Controllers/data_controler.dart';
import 'package:todoflutterandgo/colors/app_colors.dart';
import 'package:todoflutterandgo/screens/add_task.dart';
import 'package:todoflutterandgo/screens/homeScreen.dart';
import 'package:todoflutterandgo/widgets/buttons.dart';
import 'package:todoflutterandgo/widgets/taskwidget.dart';

class AllTask extends StatefulWidget {
  const AllTask({Key? key}) : super(key: key);

  @override
  _AllTaskState createState() => _AllTaskState();
}

class _AllTaskState extends State<AllTask> {
  final DataControler dataController = Get.find<DataControler>();
  late Future<void> _fetchDataFuture;
  List<String> myData = [];

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = fetchData();
  }

  Future<void> fetchData() async {
    await dataController.getData();
    List<dynamic> m1 = dataController.myData;
    for (var item in m1) {
      myData.add(item['Taskname'].toString());
    }
    print('Fetched data: $myData');
  }

  @override
  Widget build(BuildContext context) {
    print('Building AllTask widget');
    final leftEditIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      color: Color(0xFF2e3253),
      child: Icon(Icons.edit, color: Colors.white),
      alignment: Alignment.centerLeft,
    );

    final rightDeleteIcon = Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Icon(Icons.delete, color: Colors.white),
      color: Colors.redAccent,
      alignment: Alignment.centerRight,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 20),
            alignment: Alignment.topLeft,
            child: InkWell(
              onTap: () {
                Get.to(
                  HomeScreen(),
                  transition: Transition.fade,
                );
              },
              child: Icon(Icons.arrow_back),
            ),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/header1.jpg"),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              children: [
                Icon(Icons.home, color: AppColors.secondaryColor),
                SizedBox(width: 20),
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.5),
                    color: Colors.black54,
                  ),
                  child: InkWell(
                    onTap: () {
                      Get.to(
                        Addtask(),
                        transition: Transition.fade,
                        duration: Duration(seconds: 1),
                      );
                    },
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
                Expanded(child: Container()),
                Icon(Icons.calendar_month_sharp, color: AppColors.secondaryColor),
                SizedBox(width: 10),
                Text(
                  "2",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.secondaryColor,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: _fetchDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  if (myData.isEmpty) {
                    return Center(child: Text('No data available'));
                  }
                  return ListView.builder(
                    itemCount: myData.length,
                    itemBuilder: (context, index) {
                      print('Building item $index');
                      return Dismissible(
                        background: leftEditIcon,
                        secondaryBackground: rightDeleteIcon,
                        key: ObjectKey(index),
                        onDismissed: (DismissDirection direction) {
                          print("after dismissed");
                        },
                        confirmDismiss: (DismissDirection direction) async {
                          if (direction == DismissDirection.startToEnd) {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.transparent,
                              context: context,
                              builder: (_) {
                                return Container(
                                  height: 550,
                                  decoration: BoxDecoration(
                                    color: Color(0xFF2e3253).withOpacity(0.4),
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            //Get.to(),
                                          },
                                          child: ButtonWIdget(
                                            backgroundcolor: AppColors.mainColor,
                                            text: "View",
                                            textColor: Colors.white,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        ButtonWIdget(
                                          backgroundcolor: AppColors.mainColor,
                                          text: "edit",
                                          textColor: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                            return false;
                          } else {
                            return Future.delayed(Duration(seconds: 1), () => direction == DismissDirection.endToStart);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 20, top: 10, right: 20),
                          child: TaskWidget(text: myData[index], color: Colors.blueGrey),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
