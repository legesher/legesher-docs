# Legesher Translation Guide

Within the [`legesher-translations`](https://github.com/legesher/legesher-translations) repository, the different language translations are hosted for use. Below are instructions to add a new written language to the Legesher Translations.

## Adding a new written language ✏️

This may just be the most exciting part of the entire project (shhh :no_mouth:). Being able to translate code into your written language is a beautiful innovation in the world of technology!

### 1️⃣ Confirm language abbreviation

First, we need to confirm the language abbreviation associated with the written language you are trying to translate so we can maintain consistency across the platform. Navigate over to the dialect list `legesher-translations/locale/dialect-list.yml` to confirm the language extension to use.

### 2️⃣ Create keyword template file

Create a duplicate of the `legesher-translations/locale/language-keyword-template.yml` file and rename the copy to be the language abbreviation (like uk.yml for Ukrainian).

As we navigate through the templated file you just renamed, you'll need to add the language abbreviation in line 8 >> `language-abbreviation: ""`

### 3️⃣ Translate!!

Begin the translation fun in the `.yml` you've been working on! We're adding programming languages one by one so stay updated in the [README](https://github.com/legesher/legesher-translations/blob/master/README.md) & [Issues](https://github.com/legesher/legesher-translations/issues) which programming language keywords are a priority. Please reference the [keyword table](https://github.com/legesher/legesher-docs/blob/master/guide/contributor/keyword-table.md) and [glossary](https://github.com/legesher/legesher-docs/blob/master/guide/contributor/glossary.md) for the keyword definition to refer to while translating. If there is a word that could have multiple translations, please add other options in a comment after the word.

### 4️⃣ Review translations

This part is crucial in creating an inclusive and representative translation for the language. Before a translation can be included into the Legesher project, it must be reviewed and approved by 3 additional native speakers.

📓If you are creating the translations for a language, feel free to @mention peers / colleagues who may be able to help review your translation.

### 5️⃣ Update database

Once the translation has been approved and accepted, we will enter the translation into our database to be used by the Legesher project. Super exciting things happen after this as we begin our efforts to help teach new developers who natively speak your newly translated language!
