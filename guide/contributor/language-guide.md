# Language :loudspeaker: Guide

This is the documentation I've been following (and creating) as I've been making changes to the language repositories for the different text editors that Legesher is able to be run on.

## For Atom

After the programming language's grammar and parser has been created from the **tree-sitter** repositories, they are then able to be incorporated into the language repositories in the respective text editor. This allows for syntax highlighting and code folding to happen within the text editor, replicating the experience for a developer to code in their spoken language as they would have in English.

### `language-legesher-PROGRAMMINGLANGUAGE`

A couple of changes must be made when support for a new language is incorporated. I'll walk through the changes here:

- `package.json`: within this file, the tree-sitter grammar that Atom pulls from to parse the programming language correctly, will have to be changed to Legesher's tree-sitter counterpart.
  - This will probably mean you will have to remove the `package-lock.json` file as well as the `/node_modules` folder for a clean rebuild. Running `npm install` after such changes will create updated versions of those files.
- `grammars/*`: within the grammars folder there will be several files.

  - `tree-sitter-PROGRAMMINGLANGUAGE.cson`: This file is the necessary file in order to create the language support in Atom. Update the file name to follow the naming convention for Legesher projects: `tree-sitter-legesher-PROGRAMMINGLANGUAGE.cson`. We will have to first set up templating within the language here.

  ```cson
  name: 'Legesher Python'
  scopeName: 'source.legesher-python'
  type: 'tree-sitter'
  parser: 'tree-sitter-legesher-python'

  ---

  '"{class}"': 'storage.type.class'
  '"{def}"': 'storage.type.function'
  '"{lambda}"': 'storage.type.function'

  ---

  '"{if}"': 'keyword.control'
  '"{else}"': 'keyword.control'
  '"{elif}"': 'keyword.control'
  ```

  - `python.cson`: This will need to have more changes made. I've found the best way to start is to search for the `keyword`, `storage`, `logical`, `'\\b(` and template the text in the match.

  ```cson
  {
    'captures':
      '1':
        'name': 'keyword.control.import.python'
      '2':
        'name': 'keyword.control.import.from.python'
    'match': '\\b(?:({import})|({from}))\\b'
  }
  {
    'comment': 'keywords that delimit flow conditionals'
    'name': 'keyword.control.conditional.python'
    'match': '\\b({if}|{elif}|{else})\\b'
  }
  {
    'comment': 'keywords that delimit an exception'
    'name': 'keyword.control.exception.python'
    'match': '\\b({except}|{finally}|{try}|{raise})\\b'
  }
  {
    'comment': 'keywords that delimit loops'
    'name': 'keyword.control.repeat.python'
    'match': '\\b({for}|{while})\\b'
  }
  ```

- `settings/`: In the settings folder there should be at least one cson file that you will have to rename following the Legesher naming conventions: `language-legesher-PROGRAMMINGLANGUAGE.cson`.
  - `language-legesher-PROGRAMMINGLANGUAGE.cson`: This should be a pretty simple template for us to go through. This is an example from the python language.
  ```cson
  '.source.python':
    'editor':
      'autoIndentOnPaste': false
      'softTabs': true
      'tabLength': 4
      'commentStart': '# '
      'foldEndPattern': '^\\s*[}\\])]'
      'increaseIndentPattern': '^\\s*({class}|{def}|{elif}|{else}|{except}|{finally}|{for}|{if}|{try}|{with}|{while}|{async}\\s+({def}|{for}|{with}))\\b.*:\\s*$'
      'decreaseIndentPattern': '^\\s*({elif}|{else}|{except}|{finally})\\b.*:\\s*$'
  ```
- `snippets/`: The snippets folder can contain any number of files, but it is essentially the shortcuts for the language itself when it's being worked on within the editor. This will become more of a priority as Legesher evolves, but in the meantime, we'll keep it as it is. This more depends on the language's translation being accurate for more than just the keywords.

- `spec/`: TESTS TESTS TESTS, we all love testing and making sure everything is working correctly. Go through each of these files and make sure the proper things are templated out. Make sure to also go through the `fixtures/` folder for more tests to template out.

### Testing

Run the command `apm test` to run the language tests in Atom.

### Updating Version

This tool is available within [Atom's package listings](https://atom.io/packages/language-legesher-python) and needs to be updated within there. Here are the [instructions to follow to update this specific package](https://flight-manual.atom.io/hacking-atom/sections/publishing/).
