# Tree 🌴 Sitter Guide

This is the documentation I've been following when making changes to the tree-sitter repositories.

## For Atom
At this time, Atom is our main focus for developing text editors for other spoken languages. The way Atom has set up their language recognition features (like syntax-highlighting, code folding, autocomplete and more) is through [Tree-Sitter](https://github.com/tree-sitter/tree-sitter). As Atom.io is transitioning from the original TextMate grammars (this is the grammar used by other text editors like Sublime) that use regex for text matching to the new Tree-Sitter grammars, abstract syntax trees are the power behind the curtain.

### Tree Sitter Grammars
Atom is currently in the process of transitioning all of their TextMate grammars to Tree-Sitter grammars, so Legesher _at this time_ will be focusing on the newer tree-sitter language grammars and building on top of them. Eventually, we hope to expand to VSCode (which uses their own API of sorts for AST) and Sublime (which uses TextMate).

Whether or not you're new to abstract syntax trees or tree-sitter or Legesher, [this gist](https://gist.github.com/Aerijo/df27228d70c633e088b0591b8857eeef) has been really helpful for the team to understand tree-sitter grammars and how it relates to Legesher. If you ever get lost in the fine tune details of the commands we're running, why the structure is the way it is, etc. this would be a great resource to turn to.

## For New Tree-Sitter Repositories
Here is the list of steps we'll go through in order to setup a new language's tree-sitter repositories.

### Requirements
Please refer to the [`Requirements` section in this gist](https://gist.github.com/Aerijo/df27228d70c633e088b0591b8857eeef#requirements) for the most up to date requirements for tree-sitter grammar set-up.

### Setup
**Quick Check** _(this is adapted from [@Aerijo's](https://gist.github.com/Aerijo) [tree-sitter_guide](https://gist.github.com/Aerijo/df27228d70c633e088b0591b8857eeef))_
-   Clone the new `tree-sitter-LANGUAGE` grammar repository
`git clone https://github.com/tree-sitter/tree-sitter-LANGUAGE`
    - _NOTE_: this is the normal convention of the tree-sitter grammars, but as they add more languages their might be exceptions to the naming convention.
-   Navigate to the root of this project in a terminal/command prompt
-   Run `npm install`
-   Add `./node_modules/.bin` to your PATH
    -   _NOTE_: you can check if that is added correctly to your PATH variable by running `echo $PATH`
    -   If you don't add this, prefix all tree-sitter commands with `./node_modules/.bin/`; e.g., `tree-sitter` generate becomes `./node_modules/.bin/tree-sitter generate`
    -   Windows users need to replace forwards slashes with back slashes.
-   Run `tree-sitter generate`
-   Run `node-gyp configure`
-   Run `node-gyp build`
-   Run `tree-sitter test`

### Repository Familiarity
`**corpus**`: this is where test files of how the programming language is implemented and used. Below is a list of possible files you can expect to find within this folder.
-   `declarations.txt`
-   `expressions.txt`
-   `literals.txt`
-   `statements.txt`
-   `types.txt`

`**examples**`: this is a folder of test files for checking the validity of the grammar with real use cases.

`**script**`: this is where language specific use cases are introduced and explained.

`**src**`: this is where all the magic happens. more information on this folder later.

`**grammar.js**`: key file that denotes the grammar, we'll be using this more going forward.

### Legesher Add-In
Alright, so here's where it gets fun! 🎉  This is where we will find all of the keywords / reserved words in the respective programming language and template them out. (would love for this to be abstracted out eventually)

**Getting Keyword List**
-   Navigate to the [`**Legesher**` project](https://github.com/madiedgar/legesher)
-   Within the repository, navigate to `/lib/config/locale/language-template.yml` to see all of the keywords / reserved words for each language
-   Find the programming language that matches the tree-sitter grammar you're creating
-   For every word in that list under `# << Keywords >> `, we will go through the tree-sitter grammar repo and template out. (this would be a great idea for automation)

**Templating Tree-Sitter Grammar**
The templating agent we are using looks for `**{KEYWORD}**`, so as you traverse through the following files every time you encounter a keyword (there are some exceptions) put {curly braces} around it! I'll keep note of exceptions that happen for more than one language, but the tests are a great indicator that a keyword was missed or incorrectly templated out.
-   `grammar.js`
    -   All of the necessary keywords to change _should_ happen within the `module.exports = grammar({})` section of the file. A good thing to note, is that most of the keywords you will be templating out are in `'string'` format.
    -   Some keywords are within a `seq()` function like this lambda function below:
    ```javascript
    lambda: $ => prec(PREC.lambda, seq(
      '{lambda}',
      optional($.lambda_parameters),
      ':',
      $._expression
    )),
    ```
    -   Others are simply in a `prec.left()` function:
    ```javascript
    pass_statement: $ => prec.left('{pass}'),
    ```
-   `/corpus/*.txt`
    -   For these text files, it's a little bit more complicated than a simple `cmd-f` keyword. Here's an example of the `await` and `return` keywords being templating out in the abstract syntax tree explanation of how an _await expression_ is handled.
    ``` txt
    =====================================
    Await expressions
    =====================================

    {await} i(j, 5)
    {return} {await} i(j, 5)

    ---

    (module
      (expression_statement
        (await (call
          (identifier)
          (argument_list (identifier) (integer)))))
      (return_statement
        (expression_list
          (await (call
            (identifier)
            (argument_list (identifier) (integer)))))))
    ```
-   `/examples/*`
    -   These are the test files that the grammar will run through to make sure the abstract syntax tree of the grammar is sound. Some of these files are extremely long, while others are a few lines. This is where the syntax highlighting may get a little off depending on the keyword you are templating. This is okay - rather this shows that the work you're doing is making a difference! This will give us a good test for our syntax highlighting later on as well.
    ``` python
    {def} hi():



      {print} "hi"


    {def} bye():
      {print} "bye"
    ```

**Testing Grammar Changes**
Next we'll need to test out all of the changes we've made to the grammar, to make sure the programming language is still in tact. When we've passed all of our tests, then we can continue going forward in adding this programming language to the Legesher repository.

We'll need to recompile the grammar with the changes we've made.
-   Run `tree-sitter generate`
-   Run `node-gyp configure`
-   Run `node-gyp build`

_NOTE_: Run `npm run build` to do all of the required steps in one command

We will eventually need to publish the tree-sitter parser to npm, but in the meantime for developing the package and the grammar, you can test it locally using `apm link`.
