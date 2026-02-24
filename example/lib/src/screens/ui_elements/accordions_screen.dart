import 'package:flutter/material.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

class AccordionsScreen extends StatelessWidget {
  const AccordionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Accordions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        const SizedBox(height: SentinelsSpacing.xl),
        const SentinelsCard(
          title: 'Accordion Examples',
          child: Column(
            children: [
              SentinelsAccordion(
                title: 'Collapsible Group Item #1',
                initiallyExpanded: true,
                content: Text(
                    'Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod.'),
              ),
              SizedBox(height: SentinelsSpacing.md),
              SentinelsAccordion(
                title: 'Collapsible Group Item #2',
                content: Text(
                    'Sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.'),
              ),
              SizedBox(height: SentinelsSpacing.md),
              SentinelsAccordion(
                title: 'Collapsible Group Item #3',
                content: Text(
                    'Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table, raw denim aesthetic synth nesciunt you probably haven\'t heard of them accusamus labore sustainable VHS.'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
