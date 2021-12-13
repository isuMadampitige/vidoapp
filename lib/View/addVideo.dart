import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:tiktok/main.dart';
import 'package:draggable_widget/draggable_widget.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({Key key}) : super(key: key);

  @override
  _AddVideoState createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  CameraController _cameraController =
      CameraController(cameras.first, ResolutionPreset.medium);
  final dragController = DragController();
  bool visible = false;

  @override
  void initState() {
    super.initState();
    _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Container(
            //   color: Colors.red,
            // ),
            if (_cameraController.value.isInitialized) _buildCamraPreview(),
            // Spacer(),
            // Container(
            //   color: Colors.red,
            //   height: 90,
            //   child: _buildCameraTemplateSector(),
            // )
          ],
        ),
      ),
    );
  }

  // Widget _buildCameraTemplateSector() {
  //   final List<String> postTypes = ["Camera"];
  //   return Stack(
  //     alignment: Alignment.topCenter,
  //     children: [
  //       Container(
  //           height: 45,
  //           child: PageView.builder(
  //             itemBuilder: (context, index) {
  //               return Container(
  //                 width: MediaQuery.of(context).size.width,
  //                 height: MediaQuery.of(context).size.height,
  //                 child: Text(postTypes[index]),
  //               );
  //             },
  //           ))
  //     ],
  //   );
  // }

  Widget _buildCamraPreview() {
    var style = TextStyle(fontSize: 16, color: Colors.white);
    return Container(
      height: MediaQuery.of(context).size.height - 60,
      color: Colors.red,
      child: CameraPreview(
        _cameraController,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Align(
                          //   alignment: Alignment.topLeft,
                          //   child: GestureDetector(
                          //     onTap: () {},
                          //     child: Icon(
                          //       Icons.close,
                          //       color: Colors.white,
                          //     ),
                          //   ),
                          // ),
                          Container(
                            child: Column(
                              children: [
                                _buildIconTextWidget(
                                    'Sound',
                                    Icon(Icons.music_note,
                                        color: Colors.white, size: 32),
                                    style),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      visible = true;
                                    });
                                  },
                                  child: _buildIconTextWidget(
                                      'Text',
                                      Icon(Icons.text_fields,
                                          color: Colors.white, size: 32),
                                      style),
                                ),
                                GestureDetector(
                                  child: _buildIconTextWidget(
                                      'Edit',
                                      Icon(Icons.edit,
                                          color: Colors.white, size: 32),
                                      style),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton(
                        onPressed: () {},
                        color: Colors.blueAccent,
                        child: Text(
                          'NEXT',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 4),
                            borderRadius: BorderRadius.circular(50)),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 30,
                          child: Icon(
                            Icons.pause,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Visibility(visible: visible, child: _dragble())
          ],
        ),
      ),
    );
  }

  Widget _buildIconTextWidget(String lable, Icon icon, TextStyle style) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: icon,
        ),
        SizedBox(),
        Text(
          lable,
          style: style,
        )
      ],
    );
  }

  Widget _dragble() {
    return DraggableWidget(
      bottomMargin: 80,
      topMargin: 80,
      intialVisibility: true,
      horizontalSpace: 20,
      shadowBorderRadius: 50,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.yellow,
            // border: Border.all(color: Colors.yellow, width: 4),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(width: 200, child: TextField()),
        ),
      ),
      initialPosition: AnchoringPosition.center,
      dragController: dragController,
    );
  }
}
