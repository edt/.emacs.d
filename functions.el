
(defun duplicate-line-or-region ()
  (interactive)
  (if mark-active
      (duplicate-region)
    (duplicate-line)))

(defun duplicate-line ()
  "Clones the current line of text."
  (interactive)
  (save-excursion
    (copy-region-as-kill (line-beginning-position) (line-end-position))
    (end-of-line)
    (newline)
    (yank)
    (current-kill 1)))

(defun duplicate-region ()
  "Clones mark region."
  (interactive)
  (save-excursion
    (copy-region-as-kill (region-beginning) (region-end))
    (region-end)
    (newline)
    (yank)
    (current-kill 1)))
