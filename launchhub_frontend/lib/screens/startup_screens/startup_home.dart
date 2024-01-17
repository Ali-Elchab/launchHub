import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launchhub_frontend/data/static_data.dart';
import 'package:launchhub_frontend/providers/startup_profile_provider.dart';
import 'package:launchhub_frontend/screens/auth_screens/start_screen.dart';
import 'package:launchhub_frontend/screens/startup_screens/advisors.dart';
import 'package:launchhub_frontend/screens/startup_screens/hire_talent.dart';
import 'package:launchhub_frontend/screens/startup_screens/hiring_guides.dart';
import 'package:launchhub_frontend/screens/startup_screens/job_board.dart';
import 'package:launchhub_frontend/screens/startup_screens/articles_and_templates.dart';
import 'package:launchhub_frontend/widgets/profiles_shared/bottom_bar.dart';
import 'package:launchhub_frontend/widgets/profiles_shared/feature_card.dart';
import 'package:launchhub_frontend/widgets/profiles_shared/header.dart';
import 'package:launchhub_frontend/widgets/profiles_shared/section_title.dart';
import 'package:launchhub_frontend/widgets/profiles_shared/welcome_card.dart';

class StartupHome extends ConsumerStatefulWidget {
  const StartupHome({super.key});

  @override
  ConsumerState<StartupHome> createState() => _StartupHomeState();
}

class _StartupHomeState extends ConsumerState<StartupHome> {
  @override
  void initState() {
    try {
      ref.read(startupProfileProvider).fetchStartupProfile();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(180),
          child: Consumer(
            builder: (context, ref, child) {
              final startupProfile = ref.read(startupProfileProvider);
              return Header(
                text: startupProfile.companyDescription,
                title: startupProfile.companyName,
                showBackButton: false,
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Center(
            child: SizedBox(
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 45),
                  Column(
                    children: [
                      const WelcomeCard(
                          imageUrl: 'assets/images/startup_home_main.png',
                          text:
                              'Welcome to Startup Assistance Hub – your go-to resource for hiring, marketing, legal, and finance success. Explore tailored features to elevate your startup journey.'),
                      const SizedBox(height: 25),
                      const SectionTitle(title: 'Hiring'),
                      FeatureCard(
                        title: 'Job Board',
                        description:
                            'Empower Your Team\'s Growth: Effortlessly Add, View, and Manage Job Listings to Connect with Top Talent and Shape Your Company\'s Future.',
                        imagePath: 'assets/images/job_board.png',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const JobBoard();
                          }));
                        },
                      ),
                      FeatureCard(
                        title: 'Hire Talent',
                        description:
                            'Discover Talent Diversity: Explore Exceptional Job Seekers Tailored for Startups on Our Hiring Page',
                        imagePath: 'assets/images/hire_talent.png',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HireTalent();
                          }));
                        },
                      ),
                      FeatureCard(
                        title: 'Guides And Templates',
                        description:
                            'Build Your Dream Team: Comprehensive Guides and Templates for Crafting Effective Job Descriptions and Conducting Successful Interviews.',
                        imagePath: 'assets/images/guides.png',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HiringGuides(
                              niche: 'networking',
                            );
                          }));
                        },
                      ),
                      const SectionTitle(title: 'Marketing'),
                      FeatureCard(
                        title: 'Marketing Guides',
                        description:
                            'Craft and Elevate Your Brand: Resources for Creating and Maintaining a Strong Brand Identity for Your Startup.',
                        imagePath: 'assets/images/marketing_guides.png',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ArticlesAndTemplates(
                              templates: marketingTemplates,
                              query: 'marketing startup business',
                              title: 'Marketing Guides',
                              text:
                                  'Empower your startup\'s brand identity with essential resources on our Branding page, offering insightful articles and practical templates. Craft and elevate your brand with ease.',
                            );
                          }));
                        },
                      ),
                      FeatureCard(
                        title: 'Content Creators',
                        description:
                            'Discover Talent Diversity: Explore Exceptional Job Seekers Tailored for Startups on Our Hiring Page',
                        imagePath: 'assets/images/content_creators.png',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const Advisors(
                                category: 'marketing',
                                title: 'Content Creators',
                                text:
                                    "Explore our Content Creators Page—a hub connecting startups with talented content professionals. Elevate your brand with engaging content and strategic marketing. Find the perfect creator to bring your vision to life.");
                          }));
                        },
                      ),
                      FeatureCard(
                        title: 'Digital Marketing',
                        description:
                            'Unlock Content Success: Dive into Expert Guides for Crafting Valuable Content that Resonates with Your Online Audience.',
                        imagePath: 'assets/images/digital_marketing.png',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const StartScreen();
                          }));
                        },
                      ),
                      const SectionTitle(title: 'Finance'),
                      FeatureCard(
                        title: 'Financial Planning',
                        description:
                            'Financial Mastery Hub: Tools for Budgeting, Forecasting, and Financial Analysis to Empower Your Startup\'s Fiscal Planning.',
                        imagePath: 'assets/images/financial_planning.png',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ArticlesAndTemplates(
                              title: 'Financial Planning',
                              text:
                                  'Access essential articles and templates covering diverse legal aspects to guide your startup through various challenges, ensuring a secure and compliant business journey.',
                              templates: financeTemplates,
                              query: 'startup financial planning',
                            );
                          }));
                        },
                      ),
                      FeatureCard(
                        title: 'Financial Advisors',
                        description:
                            'Navigate Financial Success: Connect with Expert Financial Advisors Tailored for Startups to Drive Strategic Growth.',
                        imagePath: 'assets/images/financial_advisors.png',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const StartScreen();
                          }));
                        },
                      ),
                      const SectionTitle(title: 'Legal'),
                      FeatureCard(
                        title: 'Legal Guides',
                        description:
                            'Legal Wisdom Hub: Dive into Articles and Resources Covering Crucial Legal Issues Tailored for Startups.',
                        imagePath: 'assets/images/legal_guides.png',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ArticlesAndTemplates(
                              title: 'Legal Guides',
                              text:
                                  'Explore our Financial Planning page for budgeting, forecasting, and financial analysis tools. Empower your startup\'s fiscal planning with streamlined templates and checklists.',
                              templates: legalTemplates,
                              query: 'legal for business',
                            );
                          }));
                        },
                      ),
                      FeatureCard(
                        title: 'Legal Advisors',
                        description:
                            'Startup Legal Expertise: Connect with Specialized Legal Advisors to Safeguard and Propel Your Startup\'s Success.',
                        imagePath: 'assets/images/legal_advisors.png',
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const StartScreen();
                          }));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: const CustomBottomNavigationBar());
  }
}
