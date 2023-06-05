# Coding Challenge: Job Match Recommendation Engine

Your task is to develop a feature for a Job Match web application. The application is a Rails-based system that matches jobseekers to jobs based on their skills. The existing system already has the following models: Jobseeker, Job, and Skill, with Jobseeker and Job having a many-to-many relationship with Skill through join tables.

## Part 1: Jobseeker Matches

Develop a feature that allows a user to view a Jobseeker profile, and see a ranked list of Job they are suitable for. This list should be ranked based on the percentage of skills that match the required skills for each job.

For example, if a job requires skills A, B, and C, and a jobseeker has skills A and B, the match percentage would be 66.67%.

This should be visible on the Jobseeker's Show Page

## Part 2: Job Matches

Similarly, develop a feature that allows a user to view a Job profile and see a ranked list of suitable Jobseeker candidates. This list should be ranked based on the percentage of required skills that each jobseeker possesses.

This should be visible on the Job's Show Page

## Scope

* Some controllers and views have been provided, you will need to add the remaining
* There is no need to add CRUD for any of the models. Using the existing seed data is sufficient
* There is no need to style or beautify the application
* You may add more matching criteria as a way of demonstraiting code extensibility, but this is not required

## Evaluation Criteria
We will evaluate your work based on:

* Functionality: Does the feature work as requested?
* Code Quality: Is the code clean, well-organized, and professional? Are there any code smells or redundant code?
* Extendibility: If we needed to add additional functionality, how difficult would this be?
* Testing: Have you written tests for the functionality? How thorough are they?
* Performance: How does your solution perform? Have you considered scalability?
* Design: How well is your solution designed? Is it straightforward and easy to understand, or overly complex?

## Submitting

To submit, please fork this repository, then open up a pull request in your fork with your solution.
