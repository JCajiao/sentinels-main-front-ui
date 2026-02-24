import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 900;

        final sidebar = SentinelsCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(SentinelsSpacing.md),
                child: SentinelsButton(
                  label: 'Compose',
                  isFullWidth: true,
                  onPressed: () {},
                ),
              ),
              const Divider(height: 1),
              _buildFolderItem(context, Icons.inbox, 'Inbox', 12, true),
              _buildFolderItem(context, Icons.star_border, 'Starred', 0, false),
              _buildFolderItem(context, Icons.send, 'Sent', 0, false),
              _buildFolderItem(context, Icons.drafts, 'Drafts', 3, false),
              _buildFolderItem(
                  context, Icons.delete_outline, 'Trash', 0, false),
              const Padding(
                padding: EdgeInsets.all(SentinelsSpacing.md),
                child: Text('LABELS',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
              ),
              _buildLabelItem(context, 'Primary', SentinelsBadgeType.primary),
              _buildLabelItem(context, 'Social', SentinelsBadgeType.info),
              _buildLabelItem(
                  context, 'Promotions', SentinelsBadgeType.warning),
            ],
          ),
        );

        final messageList = SentinelsCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(SentinelsSpacing.md),
                child: Row(
                  children: [
                    const SentinelsCheckbox(value: false, onChanged: null),
                    IconButton(
                        icon: const Icon(Icons.refresh), onPressed: () {}),
                    IconButton(
                        icon: const Icon(Icons.more_vert), onPressed: () {}),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.separated(
                  itemCount: 15,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final isUnread = index < 3;
                    return ListTile(
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SentinelsCheckbox(
                              value: false, onChanged: null),
                          Icon(Icons.star_border,
                              color: Theme.of(context).disabledColor),
                        ],
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'Sender Name \$index',
                              style: TextStyle(
                                  fontWeight: isUnread
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              'Subject of the email goes here - And here is a short preview of the content...',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: isUnread
                                      ? FontWeight.bold
                                      : FontWeight.normal),
                            ),
                          ),
                          const SizedBox(width: SentinelsSpacing.md),
                          Text(
                            '10:30 AM',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isUnread
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );

        if (isDesktop) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(width: 260, child: sidebar),
              const SizedBox(width: SentinelsSpacing.xl),
              Expanded(child: messageList),
            ],
          );
        }

        return messageList; // Simplified for mobile
      },
    );
  }

  Widget _buildFolderItem(BuildContext context, IconData icon, String title,
      int count, bool isSelected) {
    final theme = Theme.of(context);
    final color = isSelected ? theme.primaryColor : theme.iconTheme.color;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title,
          style: TextStyle(
              color: color,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
      trailing: count > 0
          ? SentinelsBadge(
              label: count.toString(),
              type: isSelected
                  ? SentinelsBadgeType.primary
                  : SentinelsBadgeType.info)
          : null,
      selected: isSelected,
      dense: true,
    );
  }

  Widget _buildLabelItem(
      BuildContext context, String title, SentinelsBadgeType type) {
    return ListTile(
      leading: const Icon(Icons.circle,
          size: 12), // Needs real color mapping in a real app
      title: Text(title),
      dense: true,
    );
  }
}
