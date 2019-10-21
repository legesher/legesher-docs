require 'octokit'
require 'json'

Octokit.auto_paginate = true

# :login => '', :password => ''
client = Octokit::Client.new()

# list of all the repositories in the legesher organization
# NOTE: please additional repositories of the legeesher organization if not found here
repos = [
  'legesher/legesher',
  'legesher/legesher-docs',
  'legesher/legesher-dot-io',
  'legesher/legesher-translations',
  'legesher/tree-sitter-legesher-python',
  'legesher/language-legesher-python',
  'legesher/legesher-pride',
]

# labels that best explain the types of issues and the content within them
default_labels = {
  "Technical Experience: None" => "2EC4B6",
  "Technical Experience: Beginner" => "2EC4B6",
  "Technical Experience: Intermediate" => "2EC4B6",
  "Technical Experience: Advanced" => "2EC4B6",
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
  "Priority: Critical" => "D1A4FF",
  "Priority: High" => "D1A4FF",
  "Priority: Medium" => "D1A4FF",
  "Priority: Low" => "D1A4FF",
  "Language: Atom" => "F48370",
  "Language: Agda" => "F48370",
  "Language: AFL" => "F48370",
  "Language: Bash" => "F48370",
  "Language: C" => "F48370", 
  "Language: C#" => "F48370",
  "Language: Fluent" => "F48370",
  "Language: Golang" => "F48370",
  "Language: Haskell" => "F48370",
  "Language: HTML/CSS" => "F48370",
  "Language: Java" => "F48370",
  "Language: JavaScript" => "F48370",
  "Language: Julia" => "F48370",
  "Language: JSDoc" => "F48370",
  "Language: JSON" => "F48370",
  "Language: Node" => "F48370",
  "Language: OCaml" => "F48370",
  "Language: PHP"  => "F48370",
  "Language: Python" => "F48370",
  "Language: Razor" => "F48370",
  "Language: RegEx" => "F48370",
  "Language: Ruby" => "F48370",
  "Language: Rust" => "F48370",
  "Language: Scala" => "F48370",
  "Language: Swift" => "F48370",
  "Language: TypeScript" => "F48370",
  "Language: Verilog"  => "F48370",
  "Dialect: Afar" => "CD5A86",
  "Dialect: Abkhazian" => "CD5A86",
  "Dialect: Afrikaans" => "CD5A86",
  "Dialect: Akan" => "CD5A86",
  "Dialect: Amharic" => "CD5A86",
  "Dialect: Aragonese" => "CD5A86",
  "Dialect: Arabic" => "CD5A86",
  "Dialect: Assamese" => "CD5A86",
  "Dialect: Avar" => "CD5A86",
  "Dialect: Aymara" => "CD5A86",
  "Dialect: Azerbaijani" => "CD5A86",
  "Dialect: Chechen" => "CD5A86",
  "Dialect: Bashkir" => "CD5A86",
  "Dialect: Belarusian" => "CD5A86",
  "Dialect: Bulgarian" => "CD5A86",
  "Dialect: Bihari" => "CD5A86",
  "Dialect: Bislama" => "CD5A86",
  "Dialect: Bambara" => "CD5A86",
  "Dialect: Bengali" => "CD5A86",
  "Dialect: Tibetan" => "CD5A86",
  "Dialect: Breton" => "CD5A86",
  "Dialect: Bosnian" => "CD5A86",
  "Dialect: Catalan" => "CD5A86",
  "Dialect: Chamorro" => "CD5A86",
  "Dialect: Corsican" => "CD5A86",
  "Dialect: Cree" => "CD5A86",
  "Dialect: Czech" => "CD5A86",
  "Dialect: Old Church Slavonic / Old Bulgarian" => "CD5A86",
  "Dialect: Chuvash" => "CD5A86",
  "Dialect: Welsh" => "CD5A86",
  "Dialect: Danish" => "CD5A86",
  "Dialect: German" => "CD5A86",
  "Dialect: Divehi" => "CD5A86",
  "Dialect: Dzongkha" => "CD5A86",
  "Dialect: Ewe" => "CD5A86",
  "Dialect: English" => "CD5A86",
  "Dialect: Esperanto" => "CD5A86",
  "Dialect: Spanish" => "CD5A86",
  "Dialect: Estonian" => "CD5A86",
  "Dialect: Basque" => "CD5A86",
  "Dialect: Peul" => "CD5A86",
  "Dialect: Finnish" => "CD5A86",
  "Dialect: Fijian" => "CD5A86",
  "Dialect: Faroese" => "CD5A86",
  "Dialect: French" => "CD5A86",
  "Dialect: West Frisian" => "CD5A86",
  "Dialect: Irish" => "CD5A86",
  "Dialect: Galician" => "CD5A86",
  "Dialect: Guarani" => "CD5A86",
  "Dialect: Manx" => "CD5A86",
  "Dialect: Hausa" => "CD5A86",
  "Dialect: Hebrew" => "CD5A86",
  "Dialect: Hindi" => "CD5A86",
  "Dialect: Hiri Motu" => "CD5A86",
  "Dialect: Haitian" => "CD5A86",
  "Dialect: Hungarian" => "CD5A86",
  "Dialect: Armenian" => "CD5A86",
  "Dialect: Croatian" => "CD5A86",
  "Dialect: Herero" => "CD5A86",
  "Dialect: Interlingua" => "CD5A86",
  "Dialect: Indonesian" => "CD5A86",
  "Dialect: Interlingue" => "CD5A86",
  "Dialect: Igbo" => "CD5A86",
  "Dialect: Sichuan Yi" => "CD5A86",
  "Dialect: Inupiak" => "CD5A86",
  "Dialect: Ido" => "CD5A86",
  "Dialect: Icelandic" => "CD5A86",
  "Dialect: Italian" => "CD5A86",
  "Dialect: Inuktitut" => "CD5A86",
  "Dialect: Japanese" => "CD5A86",
  "Dialect: Javanese" => "CD5A86",
  "Dialect: Georgian" => "CD5A86",
  "Dialect: Kongo" => "CD5A86",
  "Dialect: Kikuyu" => "CD5A86",
  "Dialect: Kuanyama" => "CD5A86",
  "Dialect: Kazakh" => "CD5A86",
  "Dialect: Greenlandic" => "CD5A86",
  "Dialect: Cambodian" => "CD5A86",
  "Dialect: Kannada" => "CD5A86",
  "Dialect: Korean" => "CD5A86",
  "Dialect: Kanuri" => "CD5A86",
  "Dialect: Kashmiri" => "CD5A86",
  "Dialect: Kurdish" => "CD5A86",
  "Dialect: Komi" => "CD5A86",
  "Dialect: Cornish" => "CD5A86",
  "Dialect: Kirghiz" => "CD5A86",
  "Dialect: Latin" => "CD5A86",
  "Dialect: Luxembourgish" => "CD5A86",
  "Dialect: Ganda" => "CD5A86",
  "Dialect: Limburgian" => "CD5A86",
  "Dialect: Lingala" => "CD5A86",
  "Dialect: Laotian" => "CD5A86",
  "Dialect: Lithuanian" => "CD5A86",
  "Dialect: Latvian" => "CD5A86",
  "Dialect: Malagasy" => "CD5A86",
  "Dialect: Marshallese" => "CD5A86",
  "Dialect: Maori" => "CD5A86",
  "Dialect: Malayalam" => "CD5A86",
  "Dialect: Mongolian" => "CD5A86",
  "Dialect: Moldovan" => "CD5A86",
  "Dialect: Marathi" => "CD5A86",
  "Dialect: Malay" => "CD5A86",
  "Dialect: Maltese" => "CD5A86",
  "Dialect: Burmese" => "CD5A86",
  "Dialect: Nauruan" => "CD5A86",
  "Dialect: North Ndebele" => "CD5A86",
  "Dialect: Nepali" => "CD5A86",
  "Dialect: Ndonga" => "CD5A86",
  "Dialect: Dutch" => "CD5A86",
  "Dialect: Norwegian Nynorsk" => "CD5A86",
  "Dialect: Norwegian" => "CD5A86",
  "Dialect: South Ndebele" => "CD5A86",
  "Dialect: Navajo" => "CD5A86",
  "Dialect: Chichewa" => "CD5A86",
  "Dialect: Occitan" => "CD5A86",
  "Dialect: Ojibwa" => "CD5A86",
  "Dialect: Oromo" => "CD5A86",
  "Dialect: Oriya" => "CD5A86",
  "Dialect: Ossetian / Ossetic" => "CD5A86",
  "Dialect: Panjabi / Punjabi" => "CD5A86",
  "Dialect: Pali" => "CD5A86",
  "Dialect: Polish" => "CD5A86",
  "Dialect: Pashto" => "CD5A86",
  "Dialect: Portuguese" => "CD5A86",
  "Dialect: Quechua" => "CD5A86",
  "Dialect: Raeto Romance" => "CD5A86",
  "Dialect: Kirundi" => "CD5A86",
  "Dialect: Romanian" => "CD5A86",
  "Dialect: Russian" => "CD5A86",
  "Dialect: Rwandi" => "CD5A86",
  "Dialect: Sanskrit" => "CD5A86",
  "Dialect: Sardinian" => "CD5A86",
  "Dialect: Sindhi" => "CD5A86",
  "Dialect: Northern Sami" => "CD5A86",
  "Dialect: Sango" => "CD5A86",
  "Dialect: Serbo-Croatian" => "CD5A86",
  "Dialect: Sinhalese" => "CD5A86",
  "Dialect: Slovak" => "CD5A86",
  "Dialect: Slovenian" => "CD5A86",
  "Dialect: Samoan" => "CD5A86",
  "Dialect: Shona" => "CD5A86",
  "Dialect: Somalia" => "CD5A86",
  "Dialect: Albanian" => "CD5A86",
  "Dialect: Serbian" => "CD5A86",
  "Dialect: Swati" => "CD5A86",
  "Dialect: Southern Sotho" => "CD5A86",
  "Dialect: Sundanese" => "CD5A86",
  "Dialect: Swedish" => "CD5A86",
  "Dialect: Swahili" => "CD5A86",
  "Dialect: Tamil" => "CD5A86",
  "Dialect: Telugu" => "CD5A86",
  "Dialect: Tajik" => "CD5A86",
  "Dialect: Thai" => "CD5A86",
  "Dialect: Tigrinya" => "CD5A86",
  "Dialect: Turkmen" => "CD5A86",
  "Dialect: Tagalog" => "CD5A86",
  "Dialect: Tswana" => "CD5A86",
  "Dialect: Tonga" => "CD5A86",
  "Dialect: Turkish" => "CD5A86",
  "Dialect: Tsonga" => "CD5A86",
  "Dialect: Tatar" => "CD5A86",
  "Dialect: Twi" => "CD5A86",
  "Dialect: Tahitian" => "CD5A86",
  "Dialect: Uyghur" => "CD5A86",
  "Dialect: Ukrainian" => "CD5A86",
  "Dialect: Urdu" => "CD5A86",
  "Dialect: Uzbek" => "CD5A86",
  "Dialect: Venda" => "CD5A86",
  "Dialect: Vietnamese" => "CD5A86",
  "Dialect: Wolof" => "CD5A86",
  "Dialect: Xhosa" => "CD5A86",
  "Dialect: Yiddish" => "CD5A86",
  "Dialect: Yoruba" => "CD5A86",
  "Dialect: Zhuang" => "CD5A86",
  "Dialect: Chinese" => "CD5A86",
  "Hacktoberfest" => "FF00AA",
  "help wanted" => "E9EBF8",
  "good first issue" => "E9EBF8",
  "first-timers-only" => "E9EBF8",
  "up-for-grabs" => "E9EBF8",
}

# new hash for all-contributors contribution labels
# value set to [] to incorporate both color and description
all_contributors_labels = {
  "💬 Opportunity: Question" => ["66CCFF", "Answering Questions in Issues, Stack Overflow, Gitter, Slack, etc."],
  "🐛 Opportunity: Bug" => ["66CCFF", "Links to issues reported by the user on this project"],
  "📝 Opportunity: Blog" => ["66CCFF", "Links to the blog post"],
  "💼 Opportunity: Business" => ["66CCFF", "People who execute on the business end"],
  "💻 Opportunity: Code" => ["66CCFF", "Links to commits by the user on this project"],
  "🖋 Opportunity: Content" => ["66CCFF", "e.g. website copy, blog posts are separate"],
  "📖 Opportunity: Documentation" => ["66CCFF", "Links to commits by the user on this project, Wiki, or other source of documentation"],
  "🎨 Opportunity: Design" => ["66CCFF", "Links to the logo/iconography/visual design/etc."],
  "💡 Opportunity: Example" => ["66CCFF", "Links to the examples"],
  "📋 Opportunity: Event Organizing" => ["66CCFF", "Links to event page"],
  "💵 Opportunity: Financial" => ["66CCFF", "People or orgs who provide financial support, links to relevant page"],
  "🔍 Opportunity: Funding Finding" => ["66CCFF", "People who help find financial support"],
  "🤔 Opportunity: Ideas" => ["66CCFF", "People who help with ideas and planning"],
  "🚇 Opportunity: Infra" => ["66CCFF", "Hosting, Build-Tools, etc. Links to source file (like travis.yml) in repo, if applicable"],
  "🚧 Opportunity: Maintenance" => ["66CCFF", "People who help in maintaining the repo, links to commits by the user on this project"],
  "💌 Opportunity: Marketing" => ["66CCFF", "People who help in marketing the repo/project"],
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

# for any labels that need to be renamed
rename_labels = {}

# delete the following default labels
# typically only applicable for a new repository
remove_labels = [
  'bug',
  "Epic",
  'enhancement',
  'critical',
	'wontfix',
	'question',
	'invalid',
	'duplicate',
  'documentation',
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
			client.update_label(repo, name, options={:color => color, :description => description})
		else
			puts 'Adding label %s' % (name)
			client.add_label(repo, name, color, options={:description => description})
		end
	end

	remove_labels.each do |name|
		puts 'Removing label %s' % (name)
		client.delete_label!(repo, name)
	end

end
