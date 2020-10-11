

import 'package:cloud_firestore/cloud_firestore.dart';

class Transfer {
  final String senderId, receiverId, transferName;
  final double transferAmount;
  final Timestamp timestamp;

  Transfer({this.senderId, this.receiverId, this.transferAmount, this.transferName, this.timestamp});
}