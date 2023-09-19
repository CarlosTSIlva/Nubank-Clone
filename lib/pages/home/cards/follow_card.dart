import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nubank_clone/pages/home/widgets/main_card.dart';
import 'package:nubank_clone/widgets/filled_container.dart';

class FollowCard extends StatelessWidget {
  const FollowCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MainCard(
      'Acompanhe também',
      const [
        FilledContainer(
          icon: Icons.car_crash_outlined,
          text: 'Assistentes de pagamento',
          isNew: true,
        ),
      ],
      onTap: () {},
      icon: MdiIcons.heartOutline,
    );
  }
}
