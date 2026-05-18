class ChatThread {
  const ChatThread({
    required this.company,
    required this.contact,
    required this.lastMessage,
    required this.time,
    required this.unreadCount,
  });

  final String company;
  final String contact;
  final String lastMessage;
  final String time;
  final int unreadCount;
}
