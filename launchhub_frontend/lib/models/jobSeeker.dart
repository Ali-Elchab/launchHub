import 'package:launchhub_frontend/models/industry.dart';
import 'package:launchhub_frontend/models/niche.dart';

import 'jobPost.dart';
import 'socialMediaLink.dart';
import 'education.dart';
import 'experience.dart';
import 'certification.dart';
import 'hobby.dart';
import 'skill.dart';

class JobSeeker {
  final int id;
  final String firstName;
  final String lastName;
  final String? profilePic;
  final DateTime dob;
  final String phone;
  final String address;
  final String city;
  final String bio;
  final String? resume;
  final bool isAvailable;
  final Industry industryId;
  final int userId;
  final Niche specializationId;
  final List<SocialMediaLink> socialMediaLinks;
  final List<Education> educations;
  final List<Experience> experiences;
  final List<Certification> certifications;
  final List<Hobby> hobbies;
  final List<Skill> skills;
  final List<JobPost> jobPosts;
  final String proffesionalSummary;
  JobSeeker({
    required this.id,
    required this.firstName,
    required this.lastName,
    this.profilePic,
    required this.dob,
    required this.phone,
    required this.address,
    required this.city,
    required this.bio,
    required this.proffesionalSummary,
    this.resume,
    required this.isAvailable,
    required this.industryId,
    required this.userId,
    required this.specializationId,
    required this.socialMediaLinks,
    required this.educations,
    required this.experiences,
    required this.certifications,
    required this.hobbies,
    required this.skills,
    required this.jobPosts,
  });

  factory JobSeeker.fromJson(Map<String, dynamic> json) {
    return JobSeeker(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      profilePic: json['profile_pic'] as String?,
      dob: DateTime.parse(json['dob'] as String),
      phone: json['phone'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      bio: json['bio'] as String,
      proffesionalSummary: json['proffesional_summary'] as String,
      resume: json['resume'] as String?,
      isAvailable: (json['is_available'] as int) == 1,
      userId: json['user_id'] as int,
      industryId: (json['industry_id'] != null)
          ? Industry.fromJson(json['industry_id'])
          : Industry(id: 0, name: 'None'),
      specializationId: (json['specialization_id'] != null)
          ? Niche.fromJson(json['specialization_id'])
          : Niche(id: 0, name: 'None'),
      socialMediaLinks: (json['socialMediaLinks'] as List)
          .map((i) => SocialMediaLink.fromJson(i))
          .toList(),
      educations: (json['educations'] as List)
          .map((i) => Education.fromJson(i))
          .toList(),
      experiences: (json['experiences'] as List)
          .map((i) => Experience.fromJson(i))
          .toList(),
      certifications: (json['certifications'] as List)
          .map((i) => Certification.fromJson(i))
          .toList(),
      hobbies: (json['hobbies'] as List).map((i) => Hobby.fromJson(i)).toList(),
      skills: (json['skills'] as List).map((i) => Skill.fromJson(i)).toList(),
      jobPosts:
          (json['job_posts'] as List).map((i) => JobPost.fromJson(i)).toList(),
    );
  }
}