return {
  settings = {
    ["harper-ls"] = {
      userDictPath = vim.fs.joinpath(vim.fn.stdpath "config", "/.harper.txt"),
      fileDictPath = vim.fs.joinpath(vim.fn.stdpath "config", "/.harper/"),
      linters = {
        spell_check = true,
        spelled_numbers = false,
        an_a = true,
        sentence_capitalization = false,
        unclosed_quotes = true,
        wrong_quotes = false,
        long_sentences = true,
        repeated_words = true,
        spaces = true,
        matcher = true,
        correct_number_suffix = true,
        number_suffix_capitalization = true,
        multiple_sequential_pronouns = true,
        linking_verbs = false,
        avoid_curses = true,
        terminating_conjunctions = true,
      },
    },
  },
}
