import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_app/views/app_views/pages/add_page/pages/add_page.dart';
import 'package:social_app/views/app_views/pages/home_page/pages/home_page.dart';
import 'package:social_app/views/app_views/pages/profile_page.dart';
import 'package:social_app/views/app_views/pages/search_page/pages/search_page.dart';

final FirebaseAuth kUserAuth = FirebaseAuth.instance;

final CollectionReference kUserCollection =
    FirebaseFirestore.instance.collection('users');
final CollectionReference kPostCollection =
    FirebaseFirestore.instance.collection('posts');

final List<Widget> kPagesList = [
  const HomePage(),
  const SearchPage(),
  const AddPage(),
  const ProfilePage()
];
