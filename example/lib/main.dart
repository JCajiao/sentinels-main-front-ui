import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sentinels_main_front_ui/sentinels_main_front_ui.dart';

import 'src/screens/screens.dart';
import 'src/widgets/theme_customizer.dart';

void main() {
  runApp(const SentinelsDemoApp());
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const _LoginScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return _AppShell(currentRoute: state.uri.path, child: child);
      },
      routes: [
        GoRoute(path: '/', builder: (_, __) => const DashboardScreen()),
        GoRoute(
            path: '/apps/calendar', builder: (_, __) => const CalendarScreen()),
        GoRoute(path: '/apps/chat', builder: (_, __) => const ChatScreen()),
        GoRoute(path: '/apps/email', builder: (_, __) => const EmailScreen()),
        GoRoute(
            path: '/ui/accordions',
            builder: (_, __) => const AccordionsScreen()),
        GoRoute(path: '/ui/alerts', builder: (_, __) => const AlertsScreen()),
        GoRoute(path: '/ui/avatar', builder: (_, __) => const AvatarScreen()),
        GoRoute(path: '/ui/badges', builder: (_, __) => const BadgesScreen()),
        GoRoute(
            path: '/ui/breadcrumb',
            builder: (_, __) => const BreadcrumbScreen()),
        GoRoute(path: '/ui/buttons', builder: (_, __) => const ButtonsScreen()),
        GoRoute(path: '/ui/cards', builder: (_, __) => const CardsScreen()),
        GoRoute(path: '/ui/modals', builder: (_, __) => const ModalsScreen()),
        GoRoute(
            path: '/forms/basic',
            builder: (_, __) => const BasicElementsScreen()),
        GoRoute(
            path: '/forms/validation',
            builder: (_, __) => const FormValidationScreen()),
        GoRoute(
            path: '/forms/wizard',
            builder: (_, __) => const FormWizardScreen()),
        GoRoute(path: '/charts/apex', builder: (_, __) => const ApexScreen()),
        GoRoute(
            path: '/tables/datatable',
            builder: (_, __) => const DataTableScreen()),
        GoRoute(
            path: '/maps/google', builder: (_, __) => const GoogleMapsScreen()),
        GoRoute(
            path: '/pages/timeline',
            builder: (_, __) => const TimelineScreen()),
        GoRoute(path: '/pages/faq', builder: (_, __) => const FaqScreen()),
        GoRoute(
            path: '/pages/pricing', builder: (_, __) => const PricingScreen()),
        GoRoute(
            path: '/pages/invoice', builder: (_, __) => const InvoiceScreen()),
      ],
    ),
  ],
);

class SentinelsDemoApp extends StatefulWidget {
  const SentinelsDemoApp({super.key});

  @override
  State<SentinelsDemoApp> createState() => _SentinelsDemoAppState();
}

class _SentinelsDemoAppState extends State<SentinelsDemoApp> {
  final SentinelsThemeController controller = SentinelsThemeController();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Sentinels Commercial Demo',
          theme: SentinelsTheme.light(palette: controller.palette),
          darkTheme: SentinelsTheme.dark(palette: controller.palette),
          themeMode: controller.themeMode,
          routerConfig: _router,
          builder: (context, child) {
            return Provider(
              controller: controller,
              child: child!,
            );
          },
        );
      },
    );
  }
}

class Provider extends InheritedWidget {
  const Provider({super.key, required this.controller, required super.child});

  final SentinelsThemeController controller;

  static SentinelsThemeController of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Provider>()!.controller;
  }

  @override
  bool updateShouldNotify(Provider oldWidget) =>
      controller != oldWidget.controller;
}

class _AppShell extends StatelessWidget {
  const _AppShell({required this.child, required this.currentRoute});

  final Widget child;
  final String currentRoute;

  @override
  Widget build(BuildContext context) {
    return SentinelsAdminScaffold(
      title: 'Sentinels Demo',
      currentRoute: currentRoute,
      endDrawer: const ThemeCustomizer(),
      onSidebarItemTapped: (route) {
        context.go(route);
      },
      sidebarItems: const [
        SentinelsSidebarItem(title: 'MAIN', isSectionTitle: true),
        SentinelsSidebarItem(
            title: 'Dashboard', icon: Icons.dashboard, route: '/'),
        SentinelsSidebarItem(title: 'APPS', isSectionTitle: true),
        SentinelsSidebarItem(title: 'Apps', icon: Icons.apps, subItems: [
          SentinelsSidebarItem(title: 'Calendar', route: '/apps/calendar'),
          SentinelsSidebarItem(title: 'Chat', route: '/apps/chat'),
          SentinelsSidebarItem(title: 'Email', route: '/apps/email'),
        ]),
        SentinelsSidebarItem(title: 'COMPONENTS', isSectionTitle: true),
        SentinelsSidebarItem(title: 'Base UI', icon: Icons.layers, subItems: [
          SentinelsSidebarItem(title: 'Accordions', route: '/ui/accordions'),
          SentinelsSidebarItem(title: 'Alerts', route: '/ui/alerts'),
          SentinelsSidebarItem(title: 'Avatars', route: '/ui/avatar'),
          SentinelsSidebarItem(title: 'Badges', route: '/ui/badges'),
          SentinelsSidebarItem(title: 'Breadcrumb', route: '/ui/breadcrumb'),
          SentinelsSidebarItem(title: 'Buttons', route: '/ui/buttons'),
          SentinelsSidebarItem(title: 'Cards', route: '/ui/cards'),
          SentinelsSidebarItem(title: 'Modals', route: '/ui/modals'),
        ]),
        SentinelsSidebarItem(title: 'Forms', icon: Icons.check_box, subItems: [
          SentinelsSidebarItem(title: 'Basic Elements', route: '/forms/basic'),
          SentinelsSidebarItem(
              title: 'Form Validation', route: '/forms/validation'),
          SentinelsSidebarItem(title: 'Form Wizard', route: '/forms/wizard'),
        ]),
        SentinelsSidebarItem(title: 'Charts', icon: Icons.bar_chart, subItems: [
          SentinelsSidebarItem(title: 'Apex Charts', route: '/charts/apex'),
        ]),
        SentinelsSidebarItem(
            title: 'Tables',
            icon: Icons.table_chart,
            subItems: [
              SentinelsSidebarItem(
                  title: 'Data Tables', route: '/tables/datatable'),
            ]),
        SentinelsSidebarItem(title: 'Maps', icon: Icons.map, subItems: [
          SentinelsSidebarItem(title: 'Google Maps', route: '/maps/google'),
        ]),
        SentinelsSidebarItem(title: 'PAGES', isSectionTitle: true),
        SentinelsSidebarItem(
            title: 'Authentication',
            icon: Icons.account_circle_outlined,
            subItems: [
              SentinelsSidebarItem(title: 'Sign In', route: '/login'),
            ]),
        SentinelsSidebarItem(
            title: 'Utility',
            icon: Icons.format_paint,
            subItems: [
              SentinelsSidebarItem(title: 'Timeline', route: '/pages/timeline'),
              SentinelsSidebarItem(title: 'FAQs', route: '/pages/faq'),
              SentinelsSidebarItem(title: 'Pricing', route: '/pages/pricing'),
              SentinelsSidebarItem(title: 'Invoice', route: '/pages/invoice'),
            ]),
      ],
      sidebarProfileHeader: Row(
        children: [
          const SentinelsAvatar(initials: 'AD', radius: 20),
          const SizedBox(width: SentinelsSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Admin User',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .sentinelsAdminTheme
                        .leftBarOnBackground,
                  ),
                ),
                Text(
                  'Administrator',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context)
                        .sentinelsAdminTheme
                        .leftBarOnBackground
                        .withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      topbarActions: [
        SentinelsLanguageSelector(
          currentLanguage: 'EN',
          languages: const ['EN', 'ES', 'FR', 'DE'],
          onLanguageChanged: (v) {},
        ),
        SentinelsNotificationBell(
          itemCount: 3,
          onTap: () {},
        ),
        Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
          );
        }),
        const SizedBox(width: SentinelsSpacing.sm),
        const SentinelsAvatar(
          initials: 'AD',
          radius: 16,
          backgroundColor: SentinelsColors.primary,
          foregroundColor: Colors.white,
        ),
      ],
      body: child,
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen();

  @override
  Widget build(BuildContext context) {
    return SentinelsAuthLayout(
      title: 'Welcome Back',
      subtitle: 'Sign in to access your admin dashboard.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SentinelsTextField(
            label: 'Email Address',
            hintText: 'admin@sentinels.com',
            prefixIcon: Icon(Icons.email_outlined),
          ),
          const SizedBox(height: SentinelsSpacing.lg),
          const SentinelsTextField(
            label: 'Password',
            hintText: 'Enter your password',
            obscureText: true,
            prefixIcon: Icon(Icons.lock_outline),
          ),
          const SizedBox(height: SentinelsSpacing.md),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (_) {}),
                  const Text('Remember me'),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Forgot password?'),
              ),
            ],
          ),
          const SizedBox(height: SentinelsSpacing.xl),
          SentinelsButton(
            label: 'Log In',
            isFullWidth: true,
            onPressed: () => context.go('/'),
          ),
        ],
      ),
    );
  }
}
