enum ChatKind { system, support, deal }

class ChatPreview {
  final String id;
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;
  final bool isOnline;
  final bool isPinned;
  final ChatKind kind;
  final String avatarLabel;

  const ChatPreview({
    required this.id,
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.kind,
    required this.avatarLabel,
    this.unreadCount = 0,
    this.isOnline = false,
    this.isPinned = false,
  });
}
