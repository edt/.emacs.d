

;; source https://github.com/milkypostman/dotemacs/blob/master/init.el
(defun duplicate-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated."
  (interactive "p")
  (save-excursion
    (if (region-active-p)
        (duplicate-region arg)
      (duplicate-current-line arg))))


(defun duplicate-region (num &optional start end)
  "Duplicates the region bounded by START and END NUM times.
If no START and END is provided, the current region-beginning and
region-end is used."
  (interactive "p")
  (let* ((start (or start (region-beginning)))
         (end (or end (region-end)))
         (region (buffer-substring start end)))
    (goto-char start)
    (dotimes (i num)
      (insert region))))


(defun duplicate-current-line (num)
  "Duplicate the current line NUM times."
  (interactive "p")
  (when (eq (point-at-eol) (point-max))
    (goto-char (point-max))
    (newline)
    (forward-char -1))
  (duplicate-region num (point-at-bol) (1+ (point-at-eol))))


;; source http://ergoemacs.org/emacs/modernization_mark-word.html
(defun select-current-line ()
  "Select the current line"
  (interactive)
  (end-of-line) ; move to end of line
  (set-mark (line-beginning-position)))

(global-set-key (kbd "C-=") 'select-current-line)


(defun copy-current-line-or-region (&optional arg)
  ""
  (interactive)
  (if (region-active-p)
      (call-interactively 'kill-ring-save)
    (kill-ring-save (line-beginning-position) (line-beginning-position 2))))

(global-set-key (kbd "M-w") 'copy-current-line-or-region)


(defun cut-current-line-or-region (&optional arg)
  "if no region is active cuts the current line"
  (interactive)
  (if (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'kill-whole-line)))

(global-set-key (kbd "C-w") 'cut-current-line-or-region)


(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
             (next-win-buffer (window-buffer (next-window)))
             (this-win-edges (window-edges (selected-window)))
             (next-win-edges (window-edges (next-window)))
             (this-win-2nd (not (and (<= (car this-win-edges)
                                         (car next-win-edges))
                                     (<= (cadr this-win-edges)
                                         (cadr next-win-edges)))))
             (splitter
              (if (= (car this-win-edges)
                     (car (window-edges (next-window))))
                  'split-window-horizontally
                'split-window-vertically)))
        (delete-other-windows)
        (let ((first-win (selected-window)))
          (funcall splitter)
          (if this-win-2nd (other-window 1))
          (set-window-buffer (selected-window) this-win-buffer)
          (set-window-buffer (next-window) next-win-buffer)
          (select-window first-win)
          (if this-win-2nd (other-window 1))))))


(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this. The function inserts linebreaks to separate tags that have
nothing but whitespace between them. It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
    (nxml-mode)
    (goto-char begin)
    (while (search-forward-regexp "\>[ \\t]*\<" nil t)
      (backward-char) (insert "\n") (setq end (1+ end)))
    (indent-region begin end))
  (message "Ah, much better!"))


;; ; current version
;; (defadvice comment-dwim (around comment-line-maybe activate)
;;   "If invoked from the beginning of a line or the beginning of
;; text on a line, comment the current line instead of appending a
;; comment to the line."
;;   (if (and (not (use-region-p))
;;     (not (eq (line-end-position)
;;          (save-excursion (back-to-indentation) (point))))
;;     (or (eq (point) (line-beginning-position))
;;         (eq (point) (save-excursion (back-to-indentation) (point)))))
;;       (comment-or-uncomment-region (line-beginning-position)
;;                 (line-end-position))
;;     ad-do-it
;;     (setq deactivate-mark nil)))

(defadvice comment-dwim (around comment-line-maybe activate)
  "If invoked from the beginning of a line or the beginning of
text on a line, comment the current line instead of appending a
comment to the line."
  (if (and (not (use-region-p))
           (not (eq (line-end-position)
                    (save-excursion (back-to-indentation) (point))))
           (or (eq (point) (line-beginning-position))
               (eq (point) (save-excursion (back-to-indentation) (point)))))
      (comment-or-uncomment-region (line-beginning-position)
                                   (line-end-position))
    ad-do-it
    ))

;; (defun comment-dwim-line (&optional arg)
;;         "Replacement for the comment-dwim command.
;;         If no region is selected and current line is not blank and we are not at the end of the line,
;;         then comment current line.
;;         Replaces default behaviour of comment-dwim, when it inserts comment at the end of the line."
;;           (interactive "*P")
;;           (comment-normalize-vars)
;;           (if (and (not (region-active-p)) (not (looking-at "[ \t]*$")))
;;               (comment-or-uncomment-region (line-beginning-position) (line-end-position))
;;             (comment-dwim arg)))

(global-set-key (kbd "<M-;>")  'comment-dwim)


(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.

Move point to the first non-whitespace character on this line.
If point is already there, move to the beginning of the line.
Effectively toggle between the first non-whitespace character and
the beginning of the line.

If ARG is not nil or 1, move forward ARG - 1 lines first.  If
point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))


;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)


(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))


(defun point-in-comment ()
  "Determine if the point is inside a comment"
  (interactive)
  (let ((face (plist-get (text-properties-at (point)) 'face)))
    (when (not (listp face)) (setq face (list face)))
    (or (memq 'font-lock-comment-face face)
        (memq 'font-lock-comment-delimiter-face face))))


(defun my-back-to-indentation ()
  (if visual-line-mode
      (cl-flet ((beginning-of-line (arg) (beginning-of-visual-line arg)))
        (back-to-indentation))
    (back-to-indentation)))


(defun my-back-to-indentation-or-beginning (&optional arg)
  "Jump back to indentation of the current line.  If already
there, jump to the beginning of current line.  If visual mode is
enabled, move according to the visual lines."
  (interactive "p")
  (if (or (/= arg 1)
          (= (point) (save-excursion
                       (my-back-to-indentation)
                       (point))))
      (progn
        (if visual-line-mode
            (beginning-of-visual-line arg)
          (move-beginning-of-line arg))
        (when (/= arg 1)
          (my-back-to-indentation)))
    (my-back-to-indentation)))


(defun my-end-of-code-or-line (&optional arg)
  "Move to the end of code.  If already there, move to the end of line,
that is after the possible comment.  If at the end of line, move
to the end of code.

Example:
  (serious |code here)1 ;; useless commend2

In the example, | is the current point, 1 is the position of
point after one invocation of this funciton, 2 is position after
repeated invocation. On subsequent calls the point jumps between
1 and 2.

Comments are recognized in any mode that sets syntax-ppss
properly."
  (interactive "p")
  (cl-flet ((end-of-line-lov () (if visual-line-mode
                                    (end-of-visual-line arg)
                                  (move-end-of-line arg)))
            (beg-of-line-lov () (if visual-line-mode
                                    (beginning-of-visual-line arg)
                                  (move-beginning-of-line arg))))
    (let ((eoc (save-excursion
                 (end-of-line-lov)
                 (while (and (point-in-comment)
                             (not (bolp)))
                   (backward-char))
                 (skip-syntax-backward " ")
                 ;; if we skipped all the way to the beginning, that
                 ;; means there's only comment on this line, so this
                 ;; should just jump to the end.
                 (if (= (point) (save-excursion
                                  (beg-of-line-lov)
                                  (point)))
                     (progn (end-of-line-lov)
                            (point))
                   (point)))))
      (if (= (point) eoc)
          (end-of-line-lov)
        (goto-char eoc)))))

(global-set-key (kbd "C-e") 'my-end-of-code-or-line)

                                        ;(key-chord-define-global "ee" 'my-end-of-code-or-line)

(defun google ()
  "Googles a query or region if any."
  (interactive)
  (browse-url
   (concat
    "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
    (if (region-active-p)
        (buffer-substring (region-beginning) (region-end))
      (read-string "Query: " nil nil (thing-at-point 'symbol))))))


;;;
;; Move to beginning of word before yanking word in isearch-mode.
;; Make C-s C-w and C-r C-w act like Vim's g* and g#, keeping Emacs'
;; C-s C-w [C-w] [C-w]... behaviour.

(require 'thingatpt)

(defun my-isearch-yank-word-or-char-from-beginning ()
  "Move to beginning of word before yanking word in isearch-mode."
  (interactive)
  ;; Making this work after a search string is entered by user
  ;; is too hard to do, so work only when search string is empty.
  (if (= 0 (length isearch-string))
      (beginning-of-thing 'word))
  (isearch-yank-word-or-char)
  ;; Revert to 'isearch-yank-word-or-char for subsequent calls
  (substitute-key-definition 'my-isearch-yank-word-or-char-from-beginning
                             'isearch-yank-word-or-char
                             isearch-mode-map))

(add-hook 'isearch-mode-hook
          (lambda ()
            "Activate my customized Isearch word yank command."
            (substitute-key-definition 'isearch-yank-word-or-char
                                       'my-isearch-yank-word-or-char-from-beginning
                                       isearch-mode-map)))

(defun rotate-windows ()
  "Rotate your windows"
  (interactive)
  (cond ((not (> (count-windows)1))
         (message "You can't rotate a single window!"))
        (t
         (setq i 1)
         (setq numWindows (count-windows))
         (while (< i numWindows)
           (let* (
                  (w1 (elt (window-list) i))
                  (w2 (elt (window-list) (+ (% i numWindows) 1)))

                  (b1 (window-buffer w1))
                  (b2 (window-buffer w2))

                  (s1 (window-start w1))
                  (s2 (window-start w2))
                  )
             (set-window-buffer w1 b2)
             (set-window-buffer w2 b1)
             (set-window-start w1 s2)
             (set-window-start w2 s1)
             (setq i (1+ i)))))))


(defun just-one-space-in-region (beg end)
  "replace all whitespace in the region with single spaces"
  (interactive "r")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (while (re-search-forward "\\s-+" nil t)
        (replace-match " ")))))

(defun untabify-buffer ()
  "Convert all tabs in buffer to spaces."
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  "Indents an entire buffer using the default intenting scheme."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(defun clean-buffer ()
  "clean buffer concerning whitespace and indentation"
  (interactive)
  (untabify-buffer)
  (just-one-space-in-region (point-min) (point-max))
  (indent-buffer))

(provide 'functions)
