class SpellCheckConfiguration {
  final bool _spellCheckEnabled;
  dynamic spellCheckService;
  dynamic spellCheckSuggestionsToolbarBuilder;
  dynamic misspelledTextStyle;
  dynamic misspelledSelectionColor;

  SpellCheckConfiguration.disabled()
      : _spellCheckEnabled = false,
        spellCheckService = null,
        spellCheckSuggestionsToolbarBuilder = null,
        misspelledTextStyle = null,
        misspelledSelectionColor = null;

  bool get spellCheckEnabled => _spellCheckEnabled;
}