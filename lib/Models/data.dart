import 'package:hotel_app/Models/messagingObjects.dart';
import 'package:hotel_app/Models/postingObjects.dart';
import 'package:hotel_app/Models/reviewObjects.dart';
import 'package:hotel_app/Models/userObjects.dart';

class PracticeData {
  // USER DATA
  static List<Usser> users = [];
  static List<Posting> postings = [];

  static populateFields () {
    Usser user1 = Usser(firstName: "Leonardo", lastName: "Martinez",
        email: "leonardo.mu00@gmail.com", bio: "Aca tratando de aprender a programar", city: "Bogota", country: "Colombia" );
    user1.isHost = true;

    Usser user2 = Usser(firstName: "Camilo", lastName: "Linares",
        email: "camilolv@gmail.com", bio: "my friend you are", city: "Bogota", country: "Colombia" );

    users.add(user1);
    users.add(user2);

    Review review = Review ();
    review.createReview(user2.createContactFormUser(), "Nice time hanging round with-im", 4.6, DateTime.now());
    user1.reviews.add(review);

    Conversation conversation = Conversation();

    Message message1 = Message();
    message1.createMessage(user1.createContactFormUser(), "Hey whats up, how many nights have you available next week?", DateTime.now());

    Message message2 = Message();
    message2.createMessage(user2.createContactFormUser(), "Hey thanks for writing, next week is all available", DateTime.now());

    conversation.messages.add(message1);
    conversation.messages.add(message2);

    user1.conversations.add(conversation);
    user2.conversations.add(conversation);

    Posting posting1 = Posting(
      name: "Hermosa Casa quinta",
      type: "House",
      price: 540000,
      description: "Hermosa casa quinta esquinera con patio trasero y zona de juegos",
      address: "1936 West 12 Avenue",
      city: "Vancouver",
      country: "Canada",
      host: user1.createContactFormUser(),
    );
    //posting1.setImages(["assets/images/apartamento1.jpg", "assets/images/apartamento1.jpg", "assets/images/apartamento1.jpg"]);
    posting1.amenities = ['Lavadora', 'Secadora', 'Plancha','WiFi'];
    posting1.beds = {
      'small': 0,
      'medium': 2,
      'large': 2,
    };
    posting1.bathrooms = {
      'full': 2,
      'half': 2,
    };


    Posting posting2 = Posting(
      name: "Apartamento lujoso",
      type: "Apartment",
      price: 320000,
      description: "Apartamento ubicado en zona central de la ciudad",
      address: "Carrera 10d # 25-15 sur",
      city: "Bogota",
      country: "Colombia",
      host: user2.createContactFormUser(),
    );
    //posting2.setImages(["assets/images/IMG_20180203_181727.jpg", "assets/images/apartamento1.jpg", "assets/images/apartamento1.jpg"]);
    posting2.amenities = ['Lavadora', 'Secadora', 'Plancha','WiFi'];
    posting2.beds = {
      'small': 1,
      'medium': 2,
      'large': 1,
    };
    posting2.bathrooms = {
      'full': 1,
      'half': 0,
    };
    postings.add(posting1);
    postings.add(posting2);

    Booking booking1 = Booking();
    booking1.createBooking(posting2, user1.createContactFormUser(), [DateTime(2021,08,20), DateTime(2021,09,07), DateTime(2021,11,12)],);
    Booking booking2 = Booking();
    booking2.createBooking(posting2, user1.createContactFormUser(), [DateTime(2021,04,20), DateTime(2021,05,07), DateTime(2021,05,16)],);
    posting2.bookings.add(booking1);
    posting2.bookings.add(booking2);

    Review postingReview = Review();
    postingReview.createReview(user2.createContactFormUser(), "Lugar muy acogedor, falta un poco de ventilacion", 3.9, DateTime(2021, 08, 08));
    posting1.reviews.add(postingReview);

    user1.bookings.add(booking1);
    user1.bookings.add(booking2);
    user1.myPostings.add(posting1);
    user2.myPostings.add(posting2);

    user1.savedPostings.add(posting2);
  }
}