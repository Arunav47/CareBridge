import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  void onInit() {
    getData = getUserData();
    super.onInit();
  }

  var isLoading = false.obs;
  var currentUser = FirebaseAuth.instance.currentUser;
  var username = ''.obs;
  var email = ''.obs;
  Future? getData;

  getUserData() async{
    DocumentSnapshot<Map<String,dynamic>> user = await FirebaseFirestore.instance.collection('users').doc(currentUser!.uid).get();
    var userData = user.data();
    username.value = userData!['fullName'] ?? "";
    email.value = currentUser!.email ?? '';
  }
}