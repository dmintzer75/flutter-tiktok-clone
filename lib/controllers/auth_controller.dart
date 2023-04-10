import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok_clone/shared/constants.dart';
import 'package:tiktok_clone/views/screens/auth/login_screen.dart';
import 'package:tiktok_clone/views/screens/home_screen.dart';
import '../models/user.dart' as model;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<User?> _user;

  @override
  void onReady() {
    // Get called after widget is rendered on the screen
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges()); //listens to changes in auth state
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => HomeScreen());
    }
  }

  // pick image
  Rx<File?>? _pickedImage;
  File? get profilePhoto => _pickedImage?.value;

  void pickImage() async {
    final pickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar('Profile picture', 'You have succesfully selected your profile picture!');
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  // upload to storage
  Future<String> _uploadToStorage(File image) async {
    Reference ref = firebaseStorage.ref().child('profilePics').child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // registering the user
  void registerUser(String username, String email, String password, File? image) async {
    try {
      if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty && image != null) {
        // save user to our auth and firebase firestore
        UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        String downloadUrl = await _uploadToStorage(image);

        model.User user = model.User(
          name: username,
          email: email,
          uid: userCredential.user!.uid,
          profilePhoto: downloadUrl,
        );

        await firebaseFirestore.collection('users').doc(userCredential.user!.uid).set(user.toJson());
        Get.snackbar('Welcome!', 'Account created successfully!');
      } else {
        Get.snackbar('Error creating account', 'Please enter all the fields');
      }
    } catch (e) {
      Get.snackbar('Error creating account', e.toString());
    }
  }

  // Login user
  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        print('Log in Successful');
      } else {
        Get.snackbar('Error logging in', 'Please enter all the fields');
      }
    } catch (e) {
      Get.snackbar('Error logging in', e.toString());
    }
  }
}
