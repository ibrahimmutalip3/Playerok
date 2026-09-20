enum MessageSender { me, them, system }

class ChatMessage {
  final String text;
  final String time;
  final MessageSender sender;

  const ChatMessage({
    required this.text,
    required this.time,
    required this.sender,
  });
}
