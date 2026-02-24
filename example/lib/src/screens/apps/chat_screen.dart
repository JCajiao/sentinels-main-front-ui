import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 800;

        final contactList = SentinelsCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(SentinelsSpacing.md),
                child: SentinelsTextField(
                  hintText: 'Search contacts...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: SentinelsAvatar(initials: 'U\$index'),
                      title: Text('User \$index'),
                      subtitle: Text('Last message from user \$index...'),
                      trailing: index == 0
                          ? const SentinelsBadge(label: 'New')
                          : null,
                    );
                  },
                ),
              ),
            ],
          ),
        );

        final chatArea = SentinelsCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(SentinelsSpacing.md),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color:
                            Theme.of(context).sentinelsAdminTheme.borderColor),
                  ),
                ),
                child: const Row(
                  children: [
                    SentinelsAvatar(initials: 'U0'),
                    SizedBox(width: SentinelsSpacing.md),
                    Text('User 0',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(SentinelsSpacing.lg),
                  children: [
                    _buildMessage(context, 'Hello there!', false),
                    _buildMessage(
                        context, 'Hi! How can I help you today?', true),
                    _buildMessage(context,
                        'I need some help with the Sentinels UI kit.', false),
                    _buildMessage(
                        context,
                        'Sure, it is quite easy to use. Just copy the widgets.',
                        true),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(SentinelsSpacing.md),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color:
                            Theme.of(context).sentinelsAdminTheme.borderColor),
                  ),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: SentinelsTextField(
                        hintText: 'Type your message...',
                      ),
                    ),
                    const SizedBox(width: SentinelsSpacing.md),
                    SentinelsButton(
                      label: '',
                      icon: Icons.send,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        );

        if (isDesktop) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(width: 300, child: contactList),
              const SizedBox(width: SentinelsSpacing.xl),
              Expanded(child: chatArea),
            ],
          );
        }

        return DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const TabBar(
                tabs: [Tab(text: 'Contacts'), Tab(text: 'Chat')],
              ),
              Expanded(
                child: TabBarView(
                  children: [contactList, chatArea],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMessage(BuildContext context, String text, bool isMe) {
    final theme = Theme.of(context);
    final adminTheme = theme.sentinelsAdminTheme;

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: SentinelsSpacing.md),
        padding: const EdgeInsets.all(SentinelsSpacing.md),
        decoration: BoxDecoration(
          color: isMe ? theme.primaryColor : adminTheme.leftBarBackground,
          borderRadius: BorderRadius.circular(SentinelsRadius.md),
          border: isMe ? null : Border.all(color: adminTheme.borderColor),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isMe ? Colors.white : adminTheme.contentOnBackground,
          ),
        ),
      ),
    );
  }
}
