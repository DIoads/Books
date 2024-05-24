import 'package:flutter/material.dart';

class Category {
  IconData icon;
  String title;
  int totalTasks;

  Category({
    required this.icon,
    required this.title,
    required this.totalTasks,
  });
}

List<Category> categoryList = [
  Category(
    icon: Icons.person,
    totalTasks: 1,
    title: 'PERÚ',
  ),
  Category(
    icon: Icons.person,
    totalTasks: 2,
    title: 'CHILE',
  ),
  Category(
    icon: Icons.person,
    totalTasks: 3,
    title: 'ARGENTINA',
  ),
  Category(
    icon: Icons.person,
    totalTasks: 4,
    title: 'BOLIVIA',
  ),
  Category(
    icon: Icons.person,
    totalTasks: 5,
    title: 'PARAGUAY',
  ),
  Category(
    icon: Icons.person,
    totalTasks: 6,
    title: 'BRASIL',
  ),
  Category(
    icon: Icons.person,
    totalTasks: 7,
    title: 'COLOMBIA',
  ),
  Category(
    icon: Icons.person,
    totalTasks: 8,
    title: 'ECUADOR',
  ),
  Category(
    icon: Icons.person,
    totalTasks: 9,
    title: 'VENEZUELA',
  ),
  Category(
    icon: Icons.person,
    totalTasks: 10,
    title: 'URUGUAY',
  ),
];
