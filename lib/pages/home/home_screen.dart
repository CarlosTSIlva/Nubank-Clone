import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:nubank_clone/constants/app_colors.dart';
import 'package:nubank_clone/constants/app_images.dart';
import 'package:nubank_clone/constants/mocked_values.dart';
import 'package:nubank_clone/constants/nu_icons.dart';
import 'package:nubank_clone/core/app_state.dart';
import 'package:nubank_clone/pages/charge/charge_screen.dart';
import 'package:nubank_clone/pages/deposit/deposit_screen.dart';
import 'package:nubank_clone/pages/home/cards/account_card.dart';
import 'package:nubank_clone/pages/home/cards/credit_card.dart';
import 'package:nubank_clone/pages/home/cards/follow_card.dart';
import 'package:nubank_clone/pages/home/cards/loan_card.dart';
import 'package:nubank_clone/pages/home/widgets/discover_card.dart';
import 'package:nubank_clone/pages/home/widgets/text_card.dart';
import 'package:nubank_clone/pages/loan/loan_screen.dart';
import 'package:nubank_clone/pages/payment/payment_screen.dart';
import 'package:nubank_clone/pages/pix/pix_screen.dart';
import 'package:nubank_clone/pages/recharge/recharge_screen.dart';
import 'package:nubank_clone/pages/refer/refer_screen.dart';
import 'package:nubank_clone/pages/transfer/transfer_screen.dart';
import 'package:nubank_clone/utils/extensions/router_context_extension.dart';
import 'package:nubank_clone/widgets/circle_button.dart';
import 'package:nubank_clone/widgets/filled_container.dart';
import 'package:nubank_clone/widgets/label_button.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _cards = [
    const CreditCard(),
    const LoanCard(),
    const FollowCard(),
  ];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.primary, Colors.white],
          stops: [0.5, 0.5],
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(context),
                _body(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    final state = Provider.of<AppState>(context);

    return Container(
      color: AppColors.primary,
      padding: const EdgeInsets.fromLTRB(18, 20, 16, 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleButton(BootstrapIcons.person, () {}),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      state.viewValues
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.white,
                    ),
                    onPressed: state.switchView,
                  ),
                  IconButton(
                    icon: const Icon(Icons.help_outline, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.forward_to_inbox_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () => context.showBottomSheet(
                      const ReferScreen(),
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 30),
          Text(
            'Olá, ${MockedValues.username}',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 24),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AccountCard(),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                LabelButton(
                  'Àrea Pix',
                  NuIcons.rewards_ic_empty_state_other,
                  onPressed: () => context.showBottomSheet(const PixScreen()),
                ),
                LabelButton(
                  'Pagar',
                  NuIcons.ic_savings_global_action_pay,
                  onPressed: () => context.showBottomSheet(
                    const PaymentScreen(),
                  ),
                ),
                LabelButton(
                  'Pegar emprestado',
                  NuIcons.ic_savings_global_action_transfer_out,
                  onPressed: () => context.showBottomSheet(TransferScreen()),
                ),
                LabelButton(
                  'Transferir',
                  NuIcons.ic_savings_global_action_transfer_out,
                  onPressed: () => context.showBottomSheet(TransferScreen()),
                ),
                LabelButton(
                  'Recarga de celular',
                  NuIcons.ic_savings_global_action_transfer_in,
                  onPressed: () => context.showBottomSheet(
                    const DepositScreen(),
                  ),
                ),
                LabelButton(
                  'Cobrar',
                  NuIcons.nuds_ic_personal_loan,
                  onPressed: () => context.push(
                    const LoanScreen(),
                  ),
                ),
                LabelButton(
                  'Caixinhas',
                  NuIcons.ic_phone,
                  onPressed: () => context.showBottomSheet(RechargeScreen()),
                ),
                LabelButton(
                  'Investir',
                  NuIcons.nuds_ic_request_money,
                  onPressed: () => context.showBottomSheet(ChargeScreen()),
                ),
                LabelButton(
                  'Depositar',
                  NuIcons.nuds_ic_personal_loan,
                  onPressed: () {},
                ),
                LabelButton(
                  'Transferir Internac.',
                  NuIcons.help,
                  onPressed: () {},
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const FilledContainer(
            icon: NuIcons.ic_card_nu,
            text: 'Meus cartões',
            leftIcon: false,
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                const SizedBox(width: 24),
                TextCard(
                  text: 'Pix no crédito: ',
                  highlightText: 'transfira sem usar o saldo da conta.',
                  onTap: () => context.push(
                    const LoanScreen(),
                  ),
                ),
                TextCard(
                  text: 'Meus limites Pix: ',
                  highlightText: 'proteçãp extra para suas transferências.',
                  onTap: () {},
                ),
                TextCard(
                  text: 'Convide amigos para o Nubank ',
                  highlightText: 'e desbloqueie brasões incríveis.',
                  onTap: () {},
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Divider(height: 2, thickness: 0.5),
          ..._cards,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Text(
              'Descubra mais',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                const SizedBox(width: 24),
                DiscoverCard(
                  image: AppImages.sorriso,
                  title: 'Seguro de vida',
                  content:
                      'Cuide de quem você ama de um jeito simples e que cabe n...',
                  buttonText: 'Conhecer',
                  onTap: () {},
                ),
                DiscoverCard(
                  image: AppImages.amigos,
                  title: 'Indique o Nu para amigos',
                  content: 'Espalhe como é simples estar no controle.',
                  buttonText: 'Indicar amigos',
                  onTap: () => context.showBottomSheet(const ReferScreen()),
                ),
                DiscoverCard(
                  image: AppImages.nupay,
                  title: 'WhatsApp',
                  content:
                      'Pagamentos seguros, rápidos e sem tarifa. A experiência',
                  buttonText: 'Quero conhecer',
                  onTap: () => context.showBottomSheet(const ReferScreen()),
                ),
                DiscoverCard(
                  image: AppImages.fachada,
                  title: 'Termos de uso',
                  content: 'Explicamos o que diz esse documento do Nubank',
                  buttonText: 'Conhecer',
                  onTap: () => context.showBottomSheet(const ReferScreen()),
                ),
                const SizedBox(width: 14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
