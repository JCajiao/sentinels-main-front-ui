import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

import 'sentinels_card.dart';

class SentinelsDataTable extends StatelessWidget {
  const SentinelsDataTable({
    super.key,
    required this.columns,
    required this.source,
    this.title,
    this.actions,
    this.header,
    this.rowsPerPage = PaginatedDataTable.defaultRowsPerPage,
    this.sortColumnIndex,
    this.sortAscending = true,
    this.onSelectAll,
    this.showCheckboxColumn = true,
  });

  final List<DataColumn> columns;
  final DataTableSource source;
  final String? title;
  final List<Widget>? actions;
  final Widget? header;
  final int rowsPerPage;
  final int? sortColumnIndex;
  final bool sortAscending;
  final ValueSetter<bool?>? onSelectAll;
  final bool showCheckboxColumn;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final adminTheme = theme.sentinelsAdminTheme;

    return SentinelsCard(
      padding: EdgeInsets.zero,
      child: Theme(
        data: theme.copyWith(
          cardTheme: const CardThemeData(
            elevation: 0,
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
              side: BorderSide.none,
            ),
            color: Colors.transparent,
          ),
          dataTableTheme: DataTableThemeData(
            headingRowColor: WidgetStateProperty.all(
              adminTheme.borderColor.withValues(alpha: 0.1),
            ),
            dataRowColor: WidgetStateProperty.resolveWith((states) {
              if (states.contains(WidgetState.selected)) {
                return Theme.of(context).primaryColor.withValues(alpha: 0.05);
              }
              return Colors.transparent;
            }),
            dividerThickness: 1,
            headingTextStyle: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: adminTheme.contentOnBackground,
            ),
            dataTextStyle: theme.textTheme.bodyMedium?.copyWith(
              color: adminTheme.contentOnBackground,
            ),
          ),
        ),
        child: PaginatedDataTable(
          header: header ??
              (title != null
                  ? Text(
                      title!,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : null),
          actions: actions,
          columns: columns,
          source: source,
          rowsPerPage: rowsPerPage,
          sortColumnIndex: sortColumnIndex,
          sortAscending: sortAscending,
          onSelectAll: onSelectAll,
          showCheckboxColumn: showCheckboxColumn,
          showFirstLastButtons: true,
          checkboxHorizontalMargin: SentinelsSpacing.lg,
          columnSpacing: SentinelsSpacing.xxl,
          horizontalMargin: SentinelsSpacing.xl,
        ),
      ),
    );
  }
}
