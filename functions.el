;; duplication functions taken from 
;; http://www.emacswiki.org/emacs/DuplicateStartOfLineOrRegion

(defun duplicate-line-or-region ()
  (interactive)
  (if mark-active
      (duplicate-region)
    (duplicate-line)))

(defun duplicate-line ()
  (let ((text (buffer-substring (point)
                                (beginning-of-thing 'line))))
    (forward-line)
    (push-mark)
    (insert text)
    (open-line 1)))

(defun duplicate-region ()
  (let* ((end (region-end))
         (text (buffer-substring (region-beginning)
                                 end)))
    (goto-char end)
    (insert text)
    (push-mark end)
    (setq deactivate-mark nil)
    (exchange-point-and-mark)))
