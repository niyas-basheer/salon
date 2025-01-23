class ChatsList {
  ChatsList._();

  static const List<dynamic> list = [
    {
      "image": "assets/img/avatars/avatar1.jpg",
      "name": "Sophia Johnson",
      "message": "Hi there! How can we assist you today?",
      "unread_messages": 1,
      "last_message": "2024-02-09T11:45:00",
    },
    {
      "image": "assets/img/avatars/avatar2.jpg",
      "name": "Michaela Rodriguez",
      "message": "Hello! We have a special offer on manicures this week.",
      "unread_messages": 0,
      "last_message": "2024-02-08T16:20:00",
    },
    {
      "image": "assets/img/avatars/avatar5.jpg",
      "name": "David Thompson",
      "message":
          "Good morning! Don't forget to book your appointment for next week.",
      "unread_messages": 3,
      "last_message": "2024-02-07T09:15:00",
    },
    {
      "image": "assets/img/avatars/avatar3.jpg",
      "name": "Samantha White",
      "message": "We have a new massage therapy package. Interested?",
      "unread_messages": 2,
      "last_message": "2024-02-09T14:30:00",
    },
    {
      "image": "",
      "name": "Christopher Lee",
      "message":
          "Hey! Your preferred stylist is available this Friday. Want to book?",
      "unread_messages": 0,
      "last_message": "2024-02-09T10:05:00",
    },
    {
      "image": "",
      "name": "Emma Garcia",
      "message":
          "Special discounts on color treatments this month! Don't miss out.",
      "unread_messages": 0,
      "last_message": "2024-02-08T19:45:00",
    },
    {
      "image": "",
      "name": "Liam Martinez",
      "message":
          "Good evening! We have a new skincare product line. Interested?",
      "unread_messages": 0,
      "last_message": "2024-02-08T21:10:00",
    },
    {
      "image": "",
      "name": "Olivia Brown",
      "message": "Hello! Your favorite barber is in till 7 PM today.",
      "unread_messages": 0,
      "last_message": "2024-02-09T13:15:00",
    },
    {
      "image": "",
      "name": "Ethan Taylor",
      "message":
          "Good afternoon! Book your nail appointment and get a free pedicure.",
      "unread_messages": 0,
      "last_message": "2024-02-09T12:30:00",
    },
    {
      "image": "",
      "name": "Isabella Martinez",
      "message":
          "Hi! Exclusive haircare products now available. Check them out!",
      "unread_messages": 0,
      "last_message": "2024-02-09T15:20:00",
    },
  ];
}

class ConversationData {
  ConversationData._();

  static const List<dynamic> list = [
    {
      "message": "Hi there! How can we assist you today?",
      "incomingMessage": true,
      "last_message": "2024-02-09T11:45:00",
    },
    {
      "message": "Hello! I'd like to schedule a haircut appointment, please.",
      "incomingMessage": false,
      "last_message": "2024-02-09T11:47:00",
    },
    {
      "message": "Of course! When would you like to come in?",
      "incomingMessage": true,
      "last_message": "2024-02-09T11:48:00",
    },
    {
      "message": "I'm available on Friday afternoon. Do you have any openings?",
      "incomingMessage": false,
      "last_message": "2024-02-09T11:50:00",
    },
    {
      "message":
          "Let me check our schedule... Yes, we have a slot available at 3:00 PM on Friday. Would that work for you?",
      "incomingMessage": true,
      "last_message": "2024-02-09T11:52:00",
    },
    {
      "message":
          "That sounds perfect! Please book me in for 3:00 PM on Friday.",
      "incomingMessage": false,
      "last_message": "2024-02-09T11:55:00",
    },
    {
      "message":
          "Great! Your appointment is confirmed for 3:00 PM on Friday. Is there anything else I can assist you with?",
      "incomingMessage": true,
      "last_message": "2024-02-09T11:57:00",
    },
    {
      "message": "No, that will be all. Thank you!",
      "incomingMessage": false,
      "last_message": "2024-02-09T11:58:00",
    },
    {
      "message": "You're welcome! Have a wonderful day!",
      "incomingMessage": true,
      "last_message": "2024-02-09T12:00:00",
    },
  ];
}
