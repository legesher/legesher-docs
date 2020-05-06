# Translation Guide

Language shapes the way we think. The [`legesher-translations`](https://github.com/legesher/legesher-translations) repository contains all of the different written language translations \(and excited to add even more!\). 

Below are instructions to add a new written language to the Legesher Translations and how to prepare it for official use within Legesher. 

## Adding a New Written Language ✏️

This may just be the most exciting part of the entire project. Having the ability to code without ideas getting lost in translation is a powerful tool not just for developers, but for entire communities across the world to be empowered towards impactful solutions. 

### 1⃣ Confirm Language Status 

First, confirm the language is not already in active development by checking this list [here](https://github.com/legesher/legesher-translations).  If the language is already in development, skip on down to _step \#6_ for ways you can further contribute to the language. 

### 2⃣ Find Language Abbreviation

Each language has an associated language abbreviation to maintain consistency across the platform. Navigate over to the dialect list [`legesher-translations/locale/dialect-list.yml`](https://github.com/legesher/legesher-translations/blob/master/locale/dialect-list.yml) to find the language extension to use in the steps below. 

{% hint style="danger" %}
If the language is not listed in [dialect-list.yml](https://github.com/legesher/legesher-translations/blob/master/locale/dialect-list.yml), please denote it in the issue created in _step \#2_.  
{% endhint %}

### 3⃣Create "Add New Language" Issue

Submit a new issue to the [`legesher/legesher-translations`](https://github.com/legesher/legesher-translations) repository by including the necessary attributes listed in the template:

{% hint style="success" %}
There is already a premade template to add a new translation to the project. Simply, press **`New Issue`** `>` **`Get Started`** for the 🌍**`Add New Dialect`** issue template.
{% endhint %}

* Add **title** of issue: `Add New Language: LANGUAGE (PROGRAMMING_LANGUAGE)`
  * We are starting with building out Python for every language and then will move on to additional languages. Translations for additional programming languages can be included in the initial pull request, but the only initial requirement is that it contains Python keyword translations. 
* Replace the instances of `LANGUAGE` with the **name** of the new language \(found in [`dialect-list.yml`](https://github.com/legesher/legesher-translations/blob/master/locale/dialect-list.yml)\)
  * If the language abbreviation is not found in the [`dialect-list.yml`](https://github.com/legesher/legesher-translations/blob/master/locale/dialect-list.yml), check the appropriate box

Upon reviewing the issue, our team will assign you the issue \(so we can give you credit towards your contribution when your pull request is merged 🥳\) and clarify any questions. A new branch will be created in the `legesher-translations` repository titled `LANGUAGE-translation` for you to make your changes!

### 4⃣ Create Keyword Template File with Translations

1. [ ] In your new branch, create a duplicate of  [`legesher-translations/locale/language-keyword-template.yml`](https://github.com/legesher/legesher-translations/blob/master/locale/language-keyword-template.yml) , and rename the copy to be the language abbreviation \(like uk.yml for Ukrainian\) and save it in the `locale` folder.
2. [ ] In this new file, add the language abbreviation in the quotations in _line 8_  &gt;&gt;`language-abbreviation: "__"`
3. [ ] Begin translating keywords of programming languages. The only requirement for the initial pull request is for Python's keywords to be fully translated. Additional programming languages would be an added bonus \(and help with development of new programming languages for Legesher\). 

Please reference the [keyword table](https://github.com/legesher/legesher-docs/blob/master/guide/contributor/keyword-table.md) and [glossary](https://github.com/legesher/legesher-docs/blob/master/guide/contributor/glossary.md) for the keyword definition to refer to while translating. If there is a word with:

* **multiple translations**: enter the one you believe has the best fit per the keyword definition and add other options in a comment after the word
* **no direct translation**: leave a `#`❓after the word
* [ ] If the language was not listed in the [dialect-list.yml](https://github.com/legesher/legesher-translations/blob/master/locale/dialect-list.yml), update the file by adding in the entry discussed in issue from _step \#3_ maintaining the same format. 

### 5⃣ Create Pull Request

After committing your changes to your translation's branch, make a pull request to add in the language to the repo. Make sure the fork you are comparing to is Legesher's_`LANGUAGE-translation`_'s branch, not the _`master`_ branch.

A member of our team will review the pull request, give feedback, and \(hopefully\) merge the new language into the repository! You'll also be added as a contributor to the project at that time 🥳 

## Reviewing Translations for a Developing Language 📝 

### 6⃣ Create "Review Language \(Python\)" Issue

This part is _crucial_ in creating an inclusive and representative translation for the language. Use the 🌍**`Review Language`** issue template to create a new issue to begin the reviewing process for the translation.  

Before a translation can be officially included into the Legesher project, it must be reviewed and approved by **at least 5 additional native speakers**. The review issue will be the hub for all the reviewers of a certain translation and include the initial translator from the steps above.

> \*\*\*\*📢 **Pro Tip**: @mention your friends / peers / colleagues to include them in the translation review process.

As Python is the first programming language to be incorporated to the project, it is important that the Python keywords are the main focus of the review. Additional keyword translations are welcomed, but in order to close the issue, 5 additional native speakers must review Python keywords. 

🙋♀ If you are interested in reviewing a translation, comment on the issue! Our team will assign you to the issue and you can update your changes. 

### 7⃣ Review Translations

It is important to take your time and be deliberate when thinking about these translations. There are so many things that get lost in translation, we don't want ideas expressed with code to be any of them. Take time to review the [keyword table](https://github.com/legesher/legesher-docs/blob/master/guide/contributor/keyword-table.md) and [glossary](https://github.com/legesher/legesher-docs/blob/master/guide/contributor/glossary.md). Think critically about how your beautiful language can influence the way others will understand programming. 

Some translations might be a simple 1:1 exchange, while others may have many ways to describe the keyword. There may no direct translation. In those situations, we encourage you to use your native language to bring to life the fundamentals of programming. Imagine you never learned the english keyword; How would you describe the identifier or process? 

As each reviewer is going through the \(Python\) keywords in the translation's _`.yml`_ file in the `locale` folder, `# leave a comment` after each translated keyword to add your own commentary. Use the following key to review the translation:

* `#` ✅ : translation is the correct word to use as the keyword translation
* `#` ❓ : there may be a stronger translation \(please provide ideas if possible\)
* `#` 🤔: not sure if there is a translation \(please provide insights on how this concept might be understood best in your language\)

Commit your changes and submit a pull request to update the language's translation branch. Please include a reference to the review issue as well.

### 8⃣ Final Translation Review

After at least 5 additional native speakers review the translations in step \#7, the language is now ready for an official review! 🎉 

All of the previous reviewers will be included on a new issue to go over all of the translated keywords, taking in all of the additional commentary. This will be a place to discuss each variant and decide on an official translation for each keyword. 

When all of the keywords for a particular programming language are confirmed, a new pull request should be made with the official translations included in the locale folder with the comments for that particular cleaned up. This pull request will be merged into the master branch and \(with help from Legesher's other repos\) become an official language translation for the Legesher project! 🎉 

### 9⃣ Ready to Play! 🎨 

Help us improve our other projects within the Legesher portfolio by using the new language translation to code your next project in your native language! We'd love to hear how you are innovating and creating without the barrier of language in your personal projects and with your team. 



