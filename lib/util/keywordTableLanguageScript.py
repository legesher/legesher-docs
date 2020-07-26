import sys
import fileinput

LANGUAGE = "LANGUAGE: "
FIRST_WRITE_LINE = 5


def populateLanguageColumn():
    if len(sys.argv) is not 3:
        print("Two parameters are required. [sourceTemplate] [targetTemplate]")

    language_word_dict = readLanguageWords(sys.argv[1])
    writeLanguageColumn(sys.argv[2], language_word_dict)


# Returns a dict of word to set of languages
def readLanguageWords(source_file):
    lang_dict = dict()
    f = open(source_file, "r")
    language = ""
    for line in f:
        if line.startswith("#") and LANGUAGE in line:
            # If the line is the beginning of a language block, read in the language name
            language = line.split(LANGUAGE)[1].replace("|", "").strip().lower()

        # If line is not a comment, and not empty, and language is set, then read in keyword and link it to the language
        elif line.strip() and language.strip() and not line.startswith("#"):

            keyword = (line.split(":")[0].strip().upper()
                       )  # Grab they keyword, before the definition
            # If first instance of keyword found
            if keyword not in lang_dict:
                lang_dict[keyword] = set()
            lang_dict[keyword].add(language)

    return lang_dict


def writeLanguageColumn(target_file, lang_dict):
    line_number = 1
    for line in fileinput.input(target_file, inplace=True):
        if line_number < FIRST_WRITE_LINE:
            line_number = line_number + 1
            print(line, end="")
            continue
        # Every line from this point should be written to. Get the keyword, find it's languages in the dict, and write them to column if they exist
        cols = line.split("|")
        keyword = cols[1].strip().upper()
        if keyword in lang_dict and len(lang_dict[keyword]) > 0:
            cols[3] = " " + (", ").join(lang_dict[keyword]) + " "
        print("|".join(cols), end="")  # Write line to file


if __name__ == "__main__":
    populateLanguageColumn()
