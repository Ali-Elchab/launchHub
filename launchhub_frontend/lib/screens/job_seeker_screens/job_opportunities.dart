import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:launchhub_frontend/providers/job_seeker_profile_provider.dart';
import 'package:launchhub_frontend/widgets/job_seeker_widgets/job_opportunities_list.dart';
import 'package:launchhub_frontend/widgets/profiles_shared/header.dart';
import 'package:launchhub_frontend/widgets/profiles_shared/search_filter.dart';

class JobOpportunities extends ConsumerWidget {
  const JobOpportunities({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(jobSeekerProfileProvider);
    Widget mainContent = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.search_off_rounded,
            size: 80,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          const SizedBox(height: 30),
          Text('NO JOB POSTS FOUND',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
              textAlign: TextAlign.center),
        ],
      ),
    );

    if (provider.jobPosts.isNotEmpty) {
      mainContent = JobOpportunitiesList(
        jobPosts: provider.filteredJobPosts,
      );
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(180),
        child: Header(
          title: 'Job Opportunities',
          text:
              'Explore endless career possibilities on our Job Opportunities page! Discover a diverse range of exciting job listings and find your next professional adventure.',
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.73,
          child: Column(
            children: [
              const SizedBox(height: 25),
              Text(
                'Hint: Swipe left on a job post to apply for it easily!',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary, fontSize: 11),
              ),
              SearchFilter(
                onChanged: (String query) {
                  provider.updateSearchQuery(query);
                },
                margin: 10,
              ),
              Expanded(
                child: mainContent,
              ),
              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
