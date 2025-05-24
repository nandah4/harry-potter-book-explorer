import 'package:flutter/material.dart';

void showFavoriteSnackbar(
    ScaffoldMessengerState? messangger, bool added, String type) {
  if (messangger == null) return;
  final message = type == "added"
      ? added
          ? "Yay, Item berhasil ditambahkan ke Favorit 🎉"
          : "Item sudah ada di Favorit 😠"
      : added
          ? "Yay, Item berhasil dihapus dari Favorit 🎉"
          : "Item gagal dihapus dari Favorit 😠";

  messangger.showSnackBar(SnackBar(
      backgroundColor: Colors.lightBlue,
      duration: Duration(milliseconds: 2000),
      elevation: 10,
      content: Center(
          child: Text(
        "$message",
        style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ))));
}

// Center(
//           child: type == "added"
//               ? Text(
//                   added
//                       ? "Yay, Item berhasil ditambahkan ke Favorit 🎉"
//                       : "Item sudah ada di Favorit 😠",
//                   style: TextStyle(
//                       fontFamily: 'OpenSans',
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500),
//                 )
//               : Text(
//                   added
//                       ? "Yay, Item berhasil dihapus dari Favorit 🎉"
//                       : "Item gagal dihapus dari Favorit 😠",
//                   style: TextStyle(
//                       fontFamily: 'OpenSans',
//                       color: Colors.white,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w500),
//                 )))
