import 'package:flutter/material.dart';

import '../core/app_brand.dart';
import '../core/app_scope.dart';
import 'app_chrome.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = AppScope.of(context).profile;
    return Drawer(
      backgroundColor: const Color(0xFF0B0E25),
      width: 340,
      child: SafeArea(
        child: AnimatedBuilder(
          animation: viewModel,
          builder: (context, _) {
            final profile = viewModel.profile;
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Row(
                  children: [
                    const BrandLogo(size: 56),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            profile.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            profile.videoCvStatus,
                            style: const TextStyle(color: AppBrand.brightBlue),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 22),
                GlassPanel(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Editeaza profilul',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 14),
                      TextFormField(
                        initialValue: profile.headline,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Descriere pentru CV-ul clasic',
                        ),
                        onChanged: viewModel.updateHeadline,
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        initialValue: profile.city,
                        decoration: const InputDecoration(labelText: 'Oras'),
                        onChanged: viewModel.updateCity,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  'Abilitati',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (final skill in profile.skills) Pill(label: skill),
                    const Pill(label: 'Adauga', icon: Icons.add),
                  ],
                ),
                const SizedBox(height: 22),
                Text(
                  'Portofoliu',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 10),
                for (final item in profile.portfolioItems)
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.description_outlined),
                    title: Text(item),
                    trailing: const Icon(Icons.chevron_right),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
