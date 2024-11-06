import 'package:cloud_firestore/cloud_firestore.dart';

class Firestore {
  final CollectionReference cardsRef =
      FirebaseFirestore.instance.collection('Cards');


  // Function to add a deck of flashcards to Firestore
  Future<void> addDeckToFirestore(Map<String, dynamic> deck) async {
    try {
      // Get Firestore instance
      final FirebaseFirestore firestore = FirebaseFirestore.instance;
      
      // Convert FlashCard objects to map format
      List<Map<String, String>> flashcardsData = [];
      for (var card in deck['deck']) {
        flashcardsData.add({
          'frontText': card.frontText,
          'backText': card.backText,
        });
      }
      
      // Create deck document data
      Map<String, dynamic> deckData = {
        'name': deck['name'],
        'cards': flashcardsData,
        'createdAt': FieldValue.serverTimestamp(),
      };
      
      // Add deck to Firestore
      await firestore.collection('flashcard_decks').add(deckData);
      
      print('Deck successfully added to Firestore');
    } catch (e) {
      print('Error adding deck to Firestore: $e');
      throw e;
    }
  }
  // Create new document
  // Future<void> addFavoriteFood(
  //     {required String foodName, required String cookName}) {
  //   return favFoodsRef.doc(foodName.toLowerCase()).set({
  //     'food_name': foodName,
  //     'cook_name': cookName,
  //   });
  // }
  // Future<void> addFavoriteFood(
  //     // adding using add() function
  //     {required String foodName,
  //     required String cookName}) {
  //   return cardsRef.add({
  //     'food_name': foodName,
  //     'cook_name': cookName,
  //   });
  // }

  // Read all documents
  Stream<QuerySnapshot> getFavoriteFoods() {
    return cardsRef.snapshots();
  }

  // Update a document
  Future<void> updateFavoriteFood(
      {required String foodName, required Map<String, dynamic> updatedData}) {
    return cardsRef.doc(foodName.toLowerCase()).update(updatedData);
  }

  // Delete a document
  Future<void> deleteFavoriteFood({required String foodName}) {
    return cardsRef.doc(foodName).delete();
  }
}
