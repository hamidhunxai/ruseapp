// import 'dart:async';
// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart' show CupertinoSlider;
// import 'package:image_painter/image_painter.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:flutter_material_color_picker/flutter_material_color_picker'
//     '.dart';
// import 'package:ruse/components/sliders.dart';
// import 'package:get/get.dart';
// import 'dart:ui' as ui show Image;
//
// class ImagePainterExample extends StatefulWidget {
//   static String id = "ImagePainterExample";
//   @override
//   _ImagePainterExampleState createState() => _ImagePainterExampleState();
// }
//
// class _ImagePainterExampleState extends State<ImagePainterExample> {
//   File? pickedImage;
//
//   void imagePickerOption() {
//     Get.bottomSheet(
//       SingleChildScrollView(
//         child: ClipRRect(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(10.0),
//             topRight: Radius.circular(10.0),
//           ),
//           child: Container(
//             color: Colors.white,
//             height: 250,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   const Text(
//                     "Pic Image From",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     textAlign: TextAlign.center,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       pickImage(ImageSource.camera);
//                     },
//                     icon: const Icon(Icons.camera),
//                     label: const Text("CAMERA"),
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       pickImage(ImageSource.gallery);
//                     },
//                     icon: const Icon(Icons.image),
//                     label: const Text("GALLERY"),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Get.back();
//                     },
//                     icon: const Icon(Icons.close),
//                     label: const Text("CANCEL"),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   pickImage(ImageSource imageType) async {
//     try {
//       final photo = await ImagePicker().pickImage(source: imageType);
//       if (photo == null) return;
//       final tempImage = File(photo.path);
//       setState(() {
//         pickedImage = tempImage;
//       });
//
//       Get.back();
//     } catch (error) {
//       debugPrint(error.toString());
//     }
//   }
//
//   late GlobalKey<ImagePainterState> _imageKey;
//   final _key = GlobalKey<ScaffoldState>();
//   late final ValueNotifier<Controller> _controller;
//   Map<IconData, PaintMode> options = {
//     Icons.zoom_out_map: PaintMode.None,
//     Icons.horizontal_rule: PaintMode.Line,
//     Icons.crop_free: PaintMode.Box,
//     Icons.edit: PaintMode.FreeStyle,
//     Icons.lens_outlined: PaintMode.Circle,
//     Icons.arrow_right_alt_outlined: PaintMode.Arrow,
//     Icons.power_input: PaintMode.DottedLine
//   };
//
//   @override
//   void initState() {
//     _controller = ValueNotifier<Controller>(
//         Controller(color: Colors.blue, mode: PaintMode.Line, strokeWidth: 4.0));
//     _imageKey = GlobalKey<ImagePainterState>();
//     super.initState();
//   }
//
//   void saveImage() async {
//     final image =
//         await (_imageKey.currentState!.exportImage() as FutureOr<Uint8List>);
//     final directory = (await getApplicationDocumentsDirectory()).path;
//     await Directory('$directory/sample').create(recursive: true);
//     final fullPath =
//         '$directory/sample/${DateTime.now().millisecondsSinceEpoch}.png';
//     final imgFile = File('$fullPath');
//     imgFile.writeAsBytesSync(image);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         backgroundColor: Colors.grey[700],
//         padding: const EdgeInsets.only(left: 10),
//         content: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             const Text("Image Exported successfully.",
//                 style: TextStyle(color: Colors.white)),
//             FlatButton(
//                 onPressed: () => OpenFile.open("$fullPath"),
//                 child: Text("Open", style: TextStyle(color: Colors.blue[200])))
//           ],
//         ),
//       ),
//     );
//   }
//
//   final ImagePicker _picker = ImagePicker();
//   File? _image;
//
//   _updateController(Controller controller) {
//     _controller.value = controller;
//   }
//
//   void _openMainColorPicker() async {
//     await showDialog<Color>(
//         context: context,
//         builder: (_) {
//           return ValueListenableBuilder<Controller>(
//             valueListenable: _controller,
//             builder: (_, value, __) {
//               return AlertDialog(
//                 contentPadding: const EdgeInsets.all(6.0),
//                 title: const Text("Pick a color"),
//                 content: MaterialColorPicker(
//                   shrinkWrap: true,
//                   selectedColor: value.color,
//                   allowShades: false,
//                   onMainColorChange: (color) => _updateController(
//                     value.copyWith(color: color),
//                   ),
//                 ),
//                 actions: [
//                   FlatButton(
//                       child: const Text('Done'),
//                       onPressed: () => Navigator.of(context).pop()),
//                 ],
//               );
//             },
//           );
//         });
//   }
//
//   void _openStrokeDialog() async {
//     await showDialog<double>(
//         context: context,
//         builder: (_) {
//           return ValueListenableBuilder<Controller>(
//             valueListenable: _controller,
//             builder: (_, ctrl, __) {
//               return Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AlertDialog(
//                     contentPadding: const EdgeInsets.all(6.0),
//                     title: const Text("Set StrokeWidth"),
//                     content: Column(
//                       children: [
//                         CupertinoSlider(
//                             value: ctrl.strokeWidth,
//                             min: 2.0,
//                             max: 20.0,
//                             divisions: 9,
//                             onChanged: (value) {
//                               _updateController(
//                                   ctrl.copyWith(strokeWidth: value));
//                             }),
//                         Text(
//                           "${ctrl.strokeWidth.toInt()}",
//                           style:
//                               const TextStyle(fontSize: 20, color: Colors.blue),
//                         )
//                       ],
//                     ),
//                     actions: [
//                       FlatButton(
//                         child: const Text('Done'),
//                         onPressed: () => Navigator.of(context).pop(),
//                       ),
//                     ],
//                   ),
//                 ],
//               );
//             },
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _key,
//       appBar: AppBar(
//         title: const Text("457576Object Editing Example"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.brush_sharp),
//             onPressed: _openStrokeDialog,
//           ),
//           IconButton(
//             icon: const Icon(Icons.color_lens),
//             onPressed: _openMainColorPicker,
//           ),
//           IconButton(
//             icon: const Icon(Icons.save),
//             onPressed: saveImage,
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(40),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               IconButton(
//                   icon: const Icon(Icons.reply, color: Colors.white),
//                   onPressed: () => _imageKey.currentState!.undo()),
//               IconButton(
//                 icon: const Icon(Icons.clear, color: Colors.white),
//                 onPressed: () => _imageKey.currentState!.clearAll(),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: ValueListenableBuilder<Controller>(
//         valueListenable: _controller,
//         builder: (_, ctrl, __) {
//           return Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(10),
//                 color: Colors.black54,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: options.entries.map((item) {
//                     return SelectionItems(
//                       icon: item.key,
//                       isSelected: ctrl.mode == item.value,
//                       onTap: () =>
//                           _updateController(ctrl.copyWith(mode: item.value)),
//                     );
//                   }).toList(),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 right: 5,
//                 child: IconButton(
//                   onPressed: imagePickerOption,
//                   icon: const Icon(
//                     Icons.add_a_photo_outlined,
//                     color: Colors.blue,
//                     size: 30,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: pickedImage != null
//                     ? ImagePainter.file(pickedImage!,
//                         controller: ctrl, key: _imageKey, scalable: true)
//                     : ImagePainter.network(
//                         "https://upload.wikimedia.org/wikipedia/commons/5/5f/Alberto_conversi_profile_pic.jpg",
//                         key: _imageKey,
//                         controller: ctrl,
//                         width: 200,
//                         height: 200,
//                         scalable: true),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class SelectionItems extends StatelessWidget {
//   final bool? isSelected;
//   final IconData? icon;
//   final VoidCallback? onTap;
//
//   SelectionItems({Key? key, this.isSelected, this.icon, this.onTap})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             padding: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//                 color: isSelected! ? Colors.white70 : Colors.transparent,
//                 shape: BoxShape.circle),
//             child: Icon(icon,
//                 color: isSelected! ? Colors.blue : Colors.white, size: 20),
//           ),
//         ),
//         if (isSelected!)
//           Positioned(
//             top: 0,
//             right: 0,
//             child: Container(
//               decoration: const BoxDecoration(
//                   shape: BoxShape.circle, color: Colors.green),
//               child: const Icon(Icons.check, color: Colors.white, size: 10),
//             ),
//           )
//       ],
//     );
//   }
// }
