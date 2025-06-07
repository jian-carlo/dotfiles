;; ~/.config/nvim/after/queries/markdown/highlights.scm
;; Extends the default markdown highlight queries to capture #tags.

;; This query targets a 'word' node and uses a predicate to
;; check if its text content starts with '#' followed by word characters.
;; The captured group is named @MarkdownTags.

(
  (inline) @MarkdownTags
  (#match? @MarkdownTags "^#\\w+")
)

;; If you found that '#tag' is parsed as 'text_mode' or another generic text node,
;; you might use this instead or in addition:
;; (
;;   (text_mode) @MarkdownTags
;;   (#match? @MarkdownTags "^#\\w+")
;; )

;; If your tags can appear within inline code spans and you specifically want to capture them there:
;; (
;;   (inline_code_span content: (word) @MarkdownTags)
;;   (#match? @MarkdownTags "^#\\w+")
;; )
