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
  "💬Opportunity: Question" => "66CCFF",
  "🐛 Opportunity: Bug" => "66CCFF",
  "📝 Opportunity: Blog" => "66CCFF",
  "💼 Opportunity: Business" => "66CCFF",
  "💻 Opportunity: Code" => "66CCFF",
  "🖋 Opportunity: Content" => "66CCFF",
  "📖 Opportunity: Doc" => "66CCFF",
  "🎨 Opportunity: Design" => "66CCFF",
  "💡 Opportunity: Example" => "66CCFF",
  "📋 Opportunity: Event Organizing" => "66CCFF",
  "💵 Opportunity: Financial" => "66CCFF",
  "🔍 Opportunity: Funding Finding" => "66CCFF",
  "🤔 Opportunity: Ideas" => "66CCFF",
  "🚇 Opportunity: Infra" => "66CCFF",
  "🚧 Opportunity: Maintenance" => "66CCFF",
  "📦 Opportunity: Platform" => "66CCFF",
  "🔌 Opportunity: Plugin" => "66CCFF",
  "📆 Opportunity: Project Management" => "66CCFF",
  "👀 Opportunity: Review" => "66CCFF",
  "🛡️ Opportunity: Security" => "66CCFF",
  "🔧 Opportunity: Tool" => "66CCFF",
  "🌍 Opportunity: Translation" => "66CCFF",
  "⚠️ Opportunity: Test" => "66CCFF",
  "✅ Opportunity: Tutorial" => "66CCFF",
  "📢 Opportunity: Talk" => "66CCFF",
  "📓 Opportunity: User Testing" => "66CCFF",
  "📹 Opportunity: Video" => "66CCFF",
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

	remove_labels.each do |name|
		puts 'Removing label %s' % (name)
		client.delete_label!(repo, name)
	end

end
