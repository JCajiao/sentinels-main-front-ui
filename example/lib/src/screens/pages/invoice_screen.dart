import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Invoice #INV-1024',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SentinelsButton(
                label: 'Print', icon: Icons.print, onPressed: () {}),
          ],
        ),
        const SizedBox(height: SentinelsSpacing.xl),
        SentinelsCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/logos/logo-social-black.png',
                          package: 'sentinels_main_front_ui', height: 40),
                      const SizedBox(height: SentinelsSpacing.md),
                      const Text(
                          'Sentinels Inc.\n123 Corporate Blvd\nSan Francisco, CA 94103'),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Billed To:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(
                          'Acme Corp\nJohn Doe\n456 Industrial Way\nNew York, NY 10001'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: SentinelsSpacing.xxl),
              const Divider(),
              const SizedBox(height: SentinelsSpacing.xl),
              const Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text('Description',
                          style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text('Rate',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right)),
                  Expanded(
                      child: Text('Hours',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right)),
                  Expanded(
                      child: Text('Total',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right)),
                ],
              ),
              const SizedBox(height: SentinelsSpacing.md),
              const Divider(),
              _buildInvoiceRow('Frontend Development (Flutter)', '\$150', '40',
                  '\$6,000.00'),
              _buildInvoiceRow('UI/UX Design', '\$120', '20', '\$2,400.00'),
              _buildInvoiceRow('Server Setup', '\$100', '10', '\$1,000.00'),
              const Divider(),
              const SizedBox(height: SentinelsSpacing.lg),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Subtotal: \$9,400.00'),
                      Text('Tax (10%): \$940.00'),
                      SizedBox(height: SentinelsSpacing.sm),
                      Text('Total: \$10,340.00',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildInvoiceRow(
      String desc, String rate, String hours, String total) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: SentinelsSpacing.sm),
      child: Row(
        children: [
          Expanded(flex: 3, child: Text(desc)),
          Expanded(child: Text(rate, textAlign: TextAlign.right)),
          Expanded(child: Text(hours, textAlign: TextAlign.right)),
          Expanded(
              child: Text(total,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}
