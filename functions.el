
(defun fullscreen ()
  "Tells Window Manager to toggle fullscreen mode"
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_FULLSCREEN" 0)))



(defun duplicate-line-or-region ()
  (interactive)
  (if mark-active
      (duplicate-region)
    (duplicate-line)))

;; taken from 
;; http://www.appdesign.com/blog/2007/04/24/clone-a-line-of-text-in-emacs/
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



;; https://sites.google.com/site/steveyegge2/my-dot-emacs-file
;;
;; Never understood why Emacs doesn't have this function.
;;
(defun rename-file-and-buffer (new-name)
 "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
 (let ((name (buffer-name))
	(filename (buffer-file-name)))
 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (if (get-buffer new-name)
	 (message "A buffer named '%s' already exists!" new-name)
	(progn 	 (rename-file name new-name 1)
                 (rename-buffer new-name)
                 (set-visited-file-name new-name)
                 (set-buffer-modified-p nil)))))) ;;

;; Never understood why Emacs doesn't have this function, either.
;;
(defun move-buffer-file (dir)
 "Moves both current buffer and file it's visiting to DIR." (interactive "DNew directory: ")
 (let* ((name (buffer-name))
	 (filename (buffer-file-name))
	 (dir
	 (if (string-match dir "\\(?:/\\|\\\\)$")
	 (substring dir 0 -1) dir))
	 (newname (concat dir "/" name)))

 (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
 (progn 	(copy-file filename newname 1)
                (delete-file filename)
                (set-visited-file-name newname)
                (set-buffer-modified-p nil) 	t))))


