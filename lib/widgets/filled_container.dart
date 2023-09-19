import 'package:flutter/material.dart';
import 'package:nubank_clone/constants/app_colors.dart';
import 'package:nubank_clone/constants/nu_icons.dart';

class FilledContainer extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool leftIcon;
  final bool isNew;

  const FilledContainer({
    required this.icon,
    required this.text,
    this.leftIcon = true,
    this.isNew = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: AppColors.labelButton,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: AppColors.text,
                  ),
                  const SizedBox(width: 12),
                  SizedBox(
                    width: 210,
                    child: Text(
                      text,
                      softWrap: true,
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                          ),
                    ),
                  ),
                  if (leftIcon) ...[
                    const Spacer(),
                    if (!isNew)
                      const Icon(
                        NuIcons.abc_ic_go_search_api_material,
                        color: AppColors.secondaryText,
                      )
                    else
                      DecoratedBox(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          color: AppColors.primary,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            'Novo',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                          ),
                        ),
                      )
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
