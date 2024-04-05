import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Prescription extends StatefulWidget {
  const Prescription({super.key});

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  File? selectedImage;
  List<Reference> uploadedFiles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUploadedFiles();
  }

  Future getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    selectedImage = File(pickedImage!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2D7A78),
        leading: Container(
          margin: EdgeInsets.only(left: 4),
          padding: EdgeInsets.all(4),
          child: CircleAvatar(
            radius: 10,
            child: Image(image: AssetImage("assets/logo.png")),
          ),
        ),
        title: Text("CareBridge", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopify, color: Colors.cyan,))
        ],
      ),
      body: _buildUI(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          getImage();
          if (selectedImage != null) {
            bool success = await uploadFileForUser(selectedImage!);
            if (success) {
              getUploadedFiles();
            }
          }
        },
        child: Icon(Icons.upload),
      ),
    );
  }

  Widget _buildUI() {
    if (uploadedFiles.isEmpty) {
      return const Center(
        child: Text("No files uploaded yet."),
      );
    }
    return ListView.builder(
        itemCount: uploadedFiles.length,
        itemBuilder: (context, index) {
          Reference ref = uploadedFiles[index];
          return FutureBuilder(
              future: ref.getDownloadURL(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListTile(
                    leading: Image.network(snapshot.data!),
                    title: Text(ref.name),
                  );
                }
                return Container();
              });
        });
  }

  void getUploadedFiles() async {
    List<Reference>? result = await getUsersUploadedFiles();
    if (result != null) {
      setState(() {
        uploadedFiles = result;
      });
    }
  }
}

Future<bool> uploadFileForUser(File file) async {
  try {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final storageRef = FirebaseStorage.instance.ref();
    final fileName = file.path.split("/").last;
    final timeStamp = DateTime.now().microsecondsSinceEpoch;
    final uploadRef = storageRef.child("$userId/uploads/$timeStamp-$fileName");
    await uploadRef.putFile(file);
    return true;
  } catch (e) {}
  return false;
}

Future<List<Reference>?> getUsersUploadedFiles() async {
  try {
    final userId = FirebaseAuth.instance.currentUser!.uid;
    final storageRef = FirebaseStorage.instance.ref();
    final uploadsRefs = storageRef.child("$userId/uploads");
    final uploads = await uploadsRefs.listAll();
    return uploads.items;
  } catch (e) {
    print(e);
  }
  return null;
}
