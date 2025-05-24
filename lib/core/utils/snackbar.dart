import 'package:flutter/material.dart';

void showFavoriteSnackbar(BuildContext context, bool added) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.lightBlue,
      duration: Duration(milliseconds: 2000),
      elevation: 10,
      content: Center(
        child: Text(
          added
              ? "Yay, Item berhasil ditambahkan ke Favorit 🎉"
              : "Item sudah ada di Favorit 😠",
          style: TextStyle(
              fontFamily: 'OpenSans',
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
      )));
}
