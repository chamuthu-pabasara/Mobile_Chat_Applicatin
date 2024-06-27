

import 'package:chat_bot/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<List<Map<String,dynamic>>>getUsersStream(){
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc){
        final user = doc.data();
        return user;
      }).toList();
    });
  }
  Future<void> sendMessage(String receiverID,message) async {
    //info
    final String CurrentUserID = _auth.currentUser!.uid;
    final String CurrentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

  Message newMessage = Message(
    senderID: CurrentUserID,
    senderEmail: CurrentUserEmail,
    receiverID: receiverID,
    message: message,
    timestamp: timestamp,
  );

  List<String> ids = [CurrentUserID,receiverID];
  ids.sort();
  String chatRoomID = ids.join('_');
  await _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").add(newMessage.toMap());

      }
      //gettting
      Stream<QuerySnapshot> getMessages (String userID, otherUserID){
        List<String> ids = [userID,otherUserID];
        ids.sort();
        String chatRoomID = ids.join('_');
        return _firestore.collection("chat_rooms").doc(chatRoomID).collection("messages").orderBy("timestamp", descending: false).snapshots();
      }
}