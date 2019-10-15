# Roadmap Breakdown

Every project within the Legesher portfolio follows a similar guideline and flow. Here's the inside scoop to understand how everything works together. 👍

<!-- Add table of contents -->

---

# Issues

We rely heavily on our repository issues to inform us of minor bugs, feedback from users, and to host our roadmap. Many of the repositories relate to one another, as do the issues. Keep an eye on our public roadmap to better understand where Legesher is headed.

## Issue Labels

For issues in any repository, they follow the same conventions in terms of the labels that are available. They follow the same style guide for consistency sake across projects.

We group labels by color, according to broad categories. In most cases, each issue will assign a label from each category.

Labels are consistent across repositories, except for a few repository specific concepts. This is for the purpose of making the process of creating new issues and contributing to any repository in the Legesher portfolio easy and consistent.

### Opportunity Labels

Opportunities describe the type of contribution that the issue is requesting. This follows the `all-contributors` description of recognizing all types of contributions.

**Color**: Blue (#66CCFF)  
`💬 Opportunity: Question`: Answering Questions in Issues, Stack Overflow, Gitter, Slack, etc.  
`🐛 Opportunity: Bug`: Links to issues reported by the user on this project  
`📝 Opportunity: Blog`: Links to the blog post  
`💼 Opportunity: Business`: People who execute on the business end  
`💻 Opportunity: Code`: Links to commits by the user on this project  
`🖋 Opportunity: Content`: e.g. website copy, blog posts are separate  
`📖 Opportunity: Documentation`: Links to commits by the user on this project, Wiki, or other source of documentation  
`🎨 Opportunity: Design`: Links to the logo/iconography/visual design/etc.  
`💡 Opportunity: Example`: Links to the examples  
`📋 Opportunity: Event Organizing`: Links to event page  
`💵 Opportunity: Financial`: People or orgs who provide financial support, links to relevant page  
`🔍 Opportunity: Funding Finding`: People who help find financial support  
`🤔 Opportunity: Ideas`: People who help with ideas and planning  
`🚇 Opportunity: Infra`: Hosting, Build-Tools, etc. Links to source file (like travis.yml) in repo, if applicable  
`🚧 Opportunity: Maintenance`: People who help in maintaining the repo, links to commits by the user on this project  
`📦 Opportunity: Platform`: Porting to support a new platform  
`🔌 Opportunity: Plugin`: Links to the repo home  
`📆 Opportunity: Project Management`: Aids in the intiating, planning, controlling, and closing of a project  
`👀 Opportunity: Review`: People who review the repo  
`🛡️ Opportunity: Security`: Identify and/or reduce security threats, GDPR, Privacy, etc  
`🔧 Opportunity: Tool`: Links to the repo home  
`🌍 Opportunity: Translation`: Links to the translated content  
`⚠️ Opportunity: Test`: Links to commits by the user on this project  
`✅ Opportunity: Tutorial`: Links to the tutorial  
`📢 Opportunity: Talk`: Links to the slides/recording/repo/etc  
`📓 Opportunity: User Testing`: Links to user test notes  
`📹 Opportunity: Video`: Links to the video

### Status Labels

**Color**: Yellow (#E9FF70)  
`Status: Available`: the issue has been through sprint cleaning is available for delegation  
`Status: Accepted`: the issue has been accepted by development team to be completed in the upcoming sprint  
**Color**: Light Orange (#FFD670)  
`Status: In Progress`: the issue is currently a work in progress  
`Status: On Hold`: the issue has been placed on hold  
**Color**: Red (#FF6666)  
`Status: Blocked`: the issue has been blocked  
**Color**: Orange (#FF9770)  
`Status: Review Needed`: the issue needs further review in order to be marked complete  
`Status: Revision Needed`:the issue needs further revision before placed in review  
**Color**: Green (#70FF74)  
`Status: Completed`: the issue has been completed  
**Color**: Grey (#CFD3D7)  
`Status: Abandoned`: the issue has been abandoned, may revisit at a later time

### Type Labels

**Color**: Coral (#FF70A6)  
`Type: Bug`: this issue is a bug related fix/issue  
`Type: Epic`: this issue is a larger snapshot of a feature  
`Type: Duplicate`: this issue has already been mentioned elsewhere

### Priority Labels

**Color**: Purple (#D1A4FF)
`Priority: Critical`: this issue is at the upmost importance and needs to be completed asap  
`Priority: High`: this issue is to have top preference as the project cannot proceed without  
`Priority: Medium`: this issue's resolution has a flexible or extended deadline  
`Priority: Low`: this issue's resolution is non-immediate

### Dialect Labels

**Color**: Dark Pink (#CD5A86)
`Dialect: English`: English spoken language  
`Dialect: French`: French spoken language
`Dialect: German`: German spoken language
`Dialect: Spanish`: Spanish spoken language
`Dialect: Italian`: Italian spoken language
`Dialect: Polish`: Polish spoken language
`Dialect: Portuguese`: Portuguese spoken language
`Dialect: Russian`: Russian spoken language
`Dialect: Ukrainian`: Ukrainian spoken language

### Programming Language Labels

**Color**: Coral (#FF70A6)
`Language: Python`: Python programming language  
`Language: Javascript`: Javascript programming language
`Language: HTML/CSS`: HTML/CSS programming language
`Language: Ruby`: Ruby programming language

### Technical Experience

**Color**: Teal (#2EC4B6)
`Technical Experience: None`: Issue that does not require a technical background
`Technical Experience: Beginner`: Issue that requires a beginner technical background
`Technical Experience: Intermediate`: Issue that requires an intermediate technical background
`Technical Experience: Advanced`: Issue that requires an advanced technical background

### Universal Labels

**Color**: Grey (#E9EBF8)
`first-timers-only`: Issues that welcome first-time contributors!
`up-for-grabs`: Indicates the issue still needs an owner.
`help wanted`: Indicates we want help on an issue or pull request.
`good first issue`: Indicates the issue is great for beginners to open source / legesher

## Label Templates

In order to update or add the labels to a new project repository, navigate to `legesher-docs/guide/legesher/labels` and run the command `ruby legesher-issue-labels.rb`.

# Becoming a Part of the Flock

We love our people and we love empowering them to contribute what they know to push the project forward. We've attempted to make a simple flow for users who want to get more involved, to automate as much of the mundane process as possible.

### If you would like to contribute to the project

### If you would like to view the public roadmap

We use ZenHub for our roadmap and sprint backlog. Unfortunately, the roadmap cannot be visible without being a member of the different repositories. The best way to receive access is to contribute to the project. Outside contributors will receive access as their email is readily available through github. You can also add your [email here](http://eepurl.com/dH0reL) to request access to the roadmap.

## Github Milestones

For managing the Legesher project, sprints are described in GitHub as _milestones_. Each sprint is 2-weeks comprised of around 80 story points (as the project progresses thus number may fluctuate).

### The Sprint Syntax

The sprint syntax follows the syntax: `Sprint [START_DATE]` where the START_DATE follows the date format MM/DD/YY.

### Story Points

Each issue when it is accepted into the current sprint will be given story points. These serve as an estimate of the amount of work that it will take to complete the specific issue. As time progresses, our estimate of how long each issue will take will improve. 1 & 2 story points permit a small change that might include a waiting period, but very little work. 40 story points is a large undertaking and consuming the majority of a contributor's time.

## Epics

Epics are described as larger feature goals that are set for the project. Epics are usually comprised of multiple issues that all feed into the epic's completion. These have their own label `Epic`.

For example, one of our current epics include [Preparing for Open Source Release](https://github.com/legesher/legesher/issues/1). On Github it looks like a normal issue with another label, but within the ZenHub project management tool it contains a snapshot of all the issues that are associated with the epic, current status of all of the issues as well as their story point estimations.

This is what it might look like on ZenHub:
<img src="/lib/images/ZenHubEpicView.png" align="center"/>

## Pipelines

Within the ZenHub Project Management tool, the issues are then organized into pipelines depending on the status of the issue.

- `New Issues`: When issues are created they first reside here
- `Epic`: Where all the major Epics live
- `Incubator`: In the icebox - issues/features that are +6 months out
- `Development Backlog`: Work that is sprint-ready, but not yet accepted and planned into the upcoming Milestone
- `Sprint Backlog`: Work that has been committed to, and accepted into the upcoming Sprint
- `In Progress`: For items that are in the current sprint
- `Review/QA`: For items that are waiting approval
- `Done`: Issues that have been completed within the specific sprint.
- `Closed`: When issues are completed they go here

## Releases

Releases are the larger moments that the public are aware of. When a new version of a software is released, it is included in a "Release". Some may be a patches because a certain bug was found to full on version upgrades.

## Assignees

On each issue an individual or team of people will be assigned when it is added to a Milestone/Sprint. If you are assigned to the issue it is your responsibility to complete the assignment. As always, we are more than willing to help and involve the community as best as you can - even documenting your thought process along the way. If you would like to be assigned to the issue and help solve the issue, please comment on the issue and take the initiative. We love that!! ❤️

- We have contributor guidelines that are to ensure you're not wasting your time with mundane tasks and additionally so we maintain consistency across the project. When you have contributed to the project, we would like to honor you and thank you for your contribution. When your contribution is accepted, you will receive instructions to receive your gift. 🎁

[Take a look at our current contributors here]()
