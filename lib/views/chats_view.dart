import 'package:flutter/material.dart';

import '../core/app_brand.dart';
import '../core/app_scope.dart';
import '../widgets/app_chrome.dart';

class ChatsView extends StatelessWidget {
  const ChatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = AppScope.of(context).chats;
    return Scaffold(
      body: GradientBackground(
        colors: const [Color(0xFF07111F), Color(0xFF101722), Color(0xFF092A52)],
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20, 18, 20, 120),
            children: [
              AppTopBar(
                title: 'Chat',
                trailing: [
                  IconButton.filledTonal(
                    tooltip: 'Editeaza profilul',
                    onPressed: () => Scaffold.of(context).openEndDrawer(),
                    icon: const Icon(Icons.account_circle_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              GlassPanel(
                child: Row(
                  children: [
                    const Icon(
                      Icons.verified_user_outlined,
                      color: AppBrand.brightBlue,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Inbox pentru interviuri, cereri de CV si actualizari despre aplicari.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              for (final thread in viewModel.threads) ...[
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 4,
                    vertical: 8,
                  ),
                  leading: CircleAvatar(
                    backgroundColor: const Color(
                      0xFF0D56B3,
                    ).withValues(alpha: 0.72),
                    child: Text(thread.company.substring(0, 1)),
                  ),
                  title: Text(
                    thread.company,
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  subtitle: Text(
                    '${thread.contact}\n${thread.lastMessage}',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        thread.time,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                      ),
                      if (thread.unreadCount > 0) ...[
                        const SizedBox(height: 8),
                        Badge(label: Text('${thread.unreadCount}')),
                      ],
                    ],
                  ),
                ),
                Divider(color: Colors.white.withValues(alpha: 0.08)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
