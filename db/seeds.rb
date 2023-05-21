# Skills
# =============================================================================

ruby = FactoryBot.create(:skill, name: "Ruby")
javascript = FactoryBot.create(:skill, name: "JavaScript")
python = FactoryBot.create(:skill, name: "Python")
java = FactoryBot.create(:skill, name: "Java")
sql = FactoryBot.create(:skill, name: "SQL")
html_css = FactoryBot.create(:skill, name: "HTML/CSS")
react = FactoryBot.create(:skill, name: "React.js")
node_js = FactoryBot.create(:skill, name: "Node.js")
machine_learning = FactoryBot.create(:skill, name: "Machine Learning")
cloud_computing = FactoryBot.create(:skill, name: "Cloud Computing")
problem_solving = FactoryBot.create(:skill, name: "Problem Solving")
communication = FactoryBot.create(:skill, name: "Communication")
adaptability = FactoryBot.create(:skill, name: "Adaptability")
teamwork = FactoryBot.create(:skill, name: "Teamwork")
self_motivated = FactoryBot.create(:skill, name: "Self-Motivated")


# Jobs
# =============================================================================

FactoryBot.create(:job, title: "Ruby Developer", skills: [ruby, sql, problem_solving])
FactoryBot.create(:job, title: "Frontend Developer", skills: [javascript, html_css, react, teamwork])
FactoryBot.create(:job, title: "Backend Developer", skills: [java, sql, node_js, problem_solving])
FactoryBot.create(:job, title: "Fullstack Developer", skills: [javascript, html_css, node_js, ruby, sql, communication])
FactoryBot.create(:job, title: "Machine Learning Engineer", skills: [python, machine_learning, adaptability])
FactoryBot.create(:job, title: "Cloud Architect", skills: [cloud_computing, python, communication])
FactoryBot.create(:job, title: "Data Analyst", skills: [python, sql, machine_learning, adaptability])
FactoryBot.create(:job, title: "Web Developer", skills: [html_css, javascript, ruby, teamwork])
FactoryBot.create(:job, title: "Python Developer", skills: [python, sql, problem_solving, self_motivated])
FactoryBot.create(:job, title: "JavaScript Developer", skills: [javascript, react, node_js, self_motivated])

# Jobseekers
# =============================================================================
FactoryBot.create(:jobseeker, name: "Alice Seeker", skills: [ruby, sql, problem_solving])
FactoryBot.create(:jobseeker, name: "Bob Applicant", skills: [javascript, html_css, teamwork])
FactoryBot.create(:jobseeker, name: "Charlie Jobhunter", skills: [java, sql, problem_solving])
FactoryBot.create(:jobseeker, name: "Danielle Searcher", skills: [python, machine_learning, adaptability])
FactoryBot.create(:jobseeker, name: "Eddie Aspirant", skills: [cloud_computing, communication])
FactoryBot.create(:jobseeker, name: "Fiona Candidate", skills: [python, sql, adaptability])
FactoryBot.create(:jobseeker, name: "George Prospect", skills: [html_css, javascript, ruby, teamwork])
FactoryBot.create(:jobseeker, name: "Hannah Hunter", skills: [python, problem_solving])
FactoryBot.create(:jobseeker, name: "Ian Jobhunter", skills: [javascript, react, self_motivated])
FactoryBot.create(:jobseeker, name: "Jane Applicant", skills: [ruby, self_motivated])
