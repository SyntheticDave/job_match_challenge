# Coding Challenge: Job Match Recommendation Engine

Your task is to develop a feature for a Job Match web application. The application is a Rails-based system that matches jobseekers to jobs based on their skills. The existing system already has the following models: Jobseeker, Job, and Skill, with Jobseeker and Job having a many-to-many relationship with Skill through join tables.

## Part 1: Jobseeker Matches

Develop a feature that allows a user to view a Jobseeker profile, and see a ranked list of Job they are suitable for. This list should be ranked based on the percentage of skills that match the required skills for each job.

For example, if a job requires skills A, B, and C, and a jobseeker has skills A and B, the match percentage would be 66.67%.

This should be visible on the Jobseeker's Show Page

## Part 2: Job Matches

Similarly, develop a feature that allows a user to view a Job profile and see a ranked list of suitable Jobseeker candidates. This list should be ranked based on the percentage of required skills that each jobseeker possesses.

This should be visible on the Job's Show Page

Evaluation Criteria
We will evaluate your work based on:

* Functionality: Does the feature work as requested?
* Code Quality: Is the code clean, well-organized, and professional? Are there any code smells or redundant code?
* Testing: Have you written tests for the functionality? How thorough are they?
* Performance: How does your solution perform? Have you considered scalability?
* Design: How well is your solution designed? Is it straightforward and easy to understand, or overly complex?
