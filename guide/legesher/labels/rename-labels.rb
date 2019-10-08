require 'octokit'
require 'json'

Octokit.auto_paginate = true

# :login => '', :password => ''
client = Octokit::Client.new()

repos = [
  'legesher/legesher',
  'legesher/legesher-docs',
  'legesher/legesher-dot-io',
  'legesher/legesher-translations',
  'legesher/tree-sitter-legesher-python',
  'legesher/language-legesher-python',
]

default_labels = {
  "Opportunity: Copy" => "66CCFF",
  "Opportunity: Design" => "66CCFF",
  "Opportunity: Marketing" => "66CCFF",
  "Opportunity: User Experience" => "66CCFF",
  "Opportunity: Data" => "66CCFF",
  "Opportunity: Legal" => "66CCFF",
  "Opportunity: Technical Beginner" => "66CCFF",
  "Opportunity: Technical Intermediate" => "66CCFF",
  "Opportunity: Technical Advanced" => "66CCFF",
  "Status: Available" => "E9FF70",
  "Status: Accepted" => "E9FF70",
  "Status: In Progress" => "FFD670",
  "Status: On Hold" => "FFD670",
  "Status: Blocked" => "FF6666",
  "Status: Review Needed" => "FF9770",
  "Status: Revision Needed" => "FF9770",
  "Status: Completed" => "70FF74",
  "Status: Abandoned" => "CFD3D7",
	"Type: Bug" => "FF70A6",
  "Type: Epic" => "FF70A6",
  "Type: Duplicate" => "FF70A6",
  "Type: Enhancement" => "FF70A6",
  "Type: Translation" => "FF70A6",
  "Type: Documentation" => "FF70A6",
  "Type: Optimization" => "FF70A6",
  "Type: Maintenance" => "FF70A6",
  "Type: Question" => "FF70A6",
  "Type: Feedback & Discussion" => "FF70A6",
  "Priority: Critical" => "D1A4FF",
  "Priority: High" => "D1A4FF",
  "Priority: Medium" => "D1A4FF",
  "Priority: Low" => "D1A4FF",
  "Language: English" => "F48370",
  "Language: Spanish" => "F48370",
  "Language: Ukrainian" => "F48370",
  "Language: Python" => "F48370",
  "Language: Javascript" => "F48370",
  "Language: Ruby" => "#F48370"
  "Hacktoberfest" => "FF00AA",
  "Good First Issue" => "66CCFF"
  "first-timers-only" => "E9EBF8"
  "help wanted" => "E9EBF8"
  "up-for-grabs" => "E9EBF8"
}

all_contributors_labels = {
  "💬Opportunity: Question" => ["66CCFF", "Answering Questions in Issues, Stack Overflow, Gitter, Slack, etc."],
  "🐛 Opportunity: Bug" => ["66CCFF", "Links to issues reported by the user on this project"],
  "📝 Opportunity: Blog" => ["66CCFF", "Links to the blog post"],
  "💼 Opportunity: Business" => ["66CCFF", "People who execute on the business end"],
  "💻 Opportunity: Code" => ["66CCFF", "Links to commits by the user on this project"],
  "🖋 Opportunity: Content" => ["66CCFF", "e.g. website copy, blog posts are separate"],
  "📖 Opportunity: Doc" => ["66CCFF", "Links to commits by the user on this project, Wiki, or other source of documentation"],
  "🎨 Opportunity: Design" => ["66CCFF", "Links to the logo/iconography/visual design/etc."],
  "💡 Opportunity: Example" => ["66CCFF", "Links to the examples"],
  "📋 Opportunity: Event Organizing" => ["66CCFF", "Links to event page"],
  "💵 Opportunity: Financial" => ["66CCFF", "People or orgs who provide financial support, links to relevant page"],
  "🔍 Opportunity: Funding Finding" => ["66CCFF", "People who help find financial support"],
  "🤔 Opportunity: Ideas" => ["66CCFF", "People who help with ideas and planning"],
  "🚇 Opportunity: Infra" => ["66CCFF", "Hosting, Build-Tools, etc. Links to source file (like travis.yml) in repo, if applicable"],
  "🚧 Opportunity: Maintenance" => ["66CCFF", "People who help in maintaining the repo, links to commits by the user on this project"],
  "📦 Opportunity: Platform" => ["66CCFF", "Porting to support a new platform"],
  "🔌 Opportunity: Plugin" => ["66CCFF", "Links to the repo home"],
  "📆 Opportunity: Project Management" => ["66CCFF", "Aids in the intiating, planning, controlling, and closing of a project"],
  "👀 Opportunity: Review" => ["66CCFF", "People who review the repo"],
  "🛡️ Opportunity: Security" => ["66CCFF", "Identify and/or reduce security threats, GDPR, Privacy, etc"],
  "🔧 Opportunity: Tool" => ["66CCFF", "Links to the repo home"],
  "🌍 Opportunity: Translation" => ["66CCFF", "Links to the translated content"],
  "⚠️ Opportunity: Test" => ["66CCFF", "Links to commits by the user on this project"],
  "✅ Opportunity: Tutorial" => ["66CCFF", "Links to the tutorial"],
  "📢 Opportunity: Talk" => ["66CCFF", "Links to the slides/recording/repo/etc"],
  "📓 Opportunity: User Testing" => ["66CCFF", "Links to user test notes"],
  "📹 Opportunity: Video" => ["66CCFF", "Links to the video"]
}

rename_labels = {
	# "Epic" => "Type: Epic",
  "good first issue" => "Good First Issue"
}

remove_labels = [
  'bug',
  'enhancement',
  'critical',
	'wontfix',
	'question',
	'invalid',
	'duplicate',
	'in progress',
]

repos.each do | repo |
	puts '# Repo %s' % repo

	repo_labels = client.labels(repo)
	rename_labels.each do |from_name, to_name|
		existing_label = repo_labels.select{|k,v| k.name == from_name}.first
		if existing_label
			puts 'Renaming label from %s to %s' % [from_name, to_name]
			client.update_label(repo, from_name, {:name => to_name})
		end
	end

	# Fetch labels again because they might've been renamed
	repo_labels = client.labels(repo)
	default_labels.each do |name, color|
		existing_label = repo_labels.select{|k,v| k.name == name}.first
		if existing_label
			puts 'Updating label %s' % (name)
			client.update_label(repo, name, {:color => color})
		else
			puts 'Adding label %s' % (name)
			client.add_label(repo, name, color)
		end
  end

  # iterates over all_contributors_labels hash to update or add a label
  all_contributors_labels.each do |name, value_arr|
    existing_label = repo_labels.select{|k,v| k.name == name}.first

    # sets variables for color and description according to hash value order
    color = value_arr[0]
    description = value_arr[1]

		if existing_label
			puts 'Updating label %s' % (name)
			client.update_label(repo, name, {:color => color}, {:description => description})
		else
			puts 'Adding label %s' % (name)
			client.add_label(repo, name, {:color => color}, {:description => description})
		end
	end

	remove_labels.each do |name|
		puts 'Removing label %s' % (name)
		client.delete_label!(repo, name)
	end

end
