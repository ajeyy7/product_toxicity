import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toxic_products/view/pages/auth_page/signup_page.dart';
import 'package:toxic_products/view/pages/home_page/components/imageupload_button.dart';
import 'package:toxic_products/view/pages/home_page/components/home_search.dart';
import 'package:toxic_products/view/pages/home_page/components/search_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchcontroller = TextEditingController();
  String _sideEffects = "";
  File? _image;
  late SharedPreferences preferences;

  final picker = ImagePicker();

  void initPreferences() async {
    preferences = await SharedPreferences.getInstance();
  }


  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  ///'http://10.0.2.2:8000/api/image/'

  Future<String> uploadImage() async {
    var apiUrl = Uri.parse('http://10.0.2.2:8000/api/image/');
    if (_image != null) {
      // Create a multipart request
      var request = http.MultipartRequest('POST', apiUrl);

      // Add the image file to the request
      var image = await http.MultipartFile.fromPath('file', _image!.path);
      request.files.add(image);

      try {
        // Send the request
        var response = await request.send();

        // Check the status code of the response
        if (response.statusCode == 200) {
          // Request successful, do something with the response
          print('Image uploaded successfully!');
          final Map<String, dynamic> responseData =
          json.decode(await response.stream.bytesToString());
          print('Response Data: $responseData');
          setState(() {
            _sideEffects = responseData['side_effects'];
          });
          return responseData['side_effects'];
          // Read response
          // var responseBody = await response.stream.bytesToString();
          // Do something with responseBody
        } else {
          // Request failed
          print('Failed to upload image. Status code: ${response.statusCode}');
        }
      } catch (e) {
        // Error occurred during the request
        print('Error uploading image: $e');
      }
    }
    return '';
  }

  Future<String> _fetchSideEffects() async {
    String apiUrl = "http://10.0.2.2:8000/api/text/";

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        body: {'product': searchcontroller.text.trim()},
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        setState(() {
          _sideEffects = responseData['side_effects'];
        });
      } else {
        // Handle error
        print("Error: ${response.statusCode}");
      }
    } catch (error) {
      // Handle exception
      print("Fetching side effects...noo");

      print("Error: $error");
    }
    return "";
  }

  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    initPreferences();
    _imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            Padding(
                padding: const EdgeInsets.only(top: 10, right: 20),
                child: IconButton(onPressed: () {
                  preferences.setBool("newuser", true);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
                },
                    icon: Icon(Icons.logout),
                    color: Colors.grey.shade50)
            )
          ],
        ),
        backgroundColor: Colors.teal.shade800,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Row(
                  children: [
                    Text(
                      "Search For Toxic \n Incredients \n In Your Product",
                      style: GoogleFonts.josefinSans(
                          fontWeight: FontWeight.w500,
                          fontSize: 40,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(32),
                    topLeft: Radius.circular(32)),
                child: Container(
                  color: Colors.grey.shade50,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.9,
                  width: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(18.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: MyTextField(
                                    icons: Icons.search_rounded,
                                    txt: "Search",
                                    controller: searchcontroller,
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Custom_Button(
                                        txt: "Upload Image",
                                        icons: Icons.cloud_upload_outlined,
                                        ontap: getImage),
                                    // Custom_Button(
                                    //     txt: "Upload Image",
                                    //     icons: Icons.file_present_outlined,
                                    //     ontap: uploadImage),

                                    Search_Button(
                                        txt: "Search",
                                        icons: Icons.search_rounded,
                                        ontap: () {
                                          _fetchSideEffects();
                                          uploadImage();
                                        })
                                  ],
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 550,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.teal.shade100),
                                  child: ListView(children: [
                                    Column(children: [
                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Toxic Ingredients",
                                            style: GoogleFonts.josefinSans(
                                                fontSize: 29,
                                                color: Colors.blueGrey),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(18.0),
                                        child: Text(
                                          '$_sideEffects',
                                          style: GoogleFonts.josefinSans(
                                              fontSize: 22,
                                              color: Colors.blueGrey.shade900),
                                        ),
                                      ),
                                    ]),
                                  ]),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
