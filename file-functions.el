;; functions related to actual files and not just buffers

(defun show-file-name ()
  "Show the full path file name in the minibuffer."
  (interactive)
  (message (buffer-file-name)))


(defun make-file-executable ()
  "Make the current file loaded in the buffer executable"
  (interactive)
  (if (buffer-file-name)
      (start-file-process "Make Executable" nil "/bin/bash" "-c"
                          (concat "chmod u+x " (file-name-nondirectory buffer-file-name)))
    (message "Buffer has no filename.")))


(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))


;; ;; https://sites.google.com/site/steveyegge2/my-dot-emacs-file
;; ;;
;; ;; Never understood why Emacs doesn't have this function.
;; (defun rename-file-and-buffer (new-name)
;;  "Renames both current buffer and file it's visiting to NEW-NAME." (interactive "sNew name: ")
;;  (let ((name (buffer-name))
;; 	(filename (buffer-file-name)))
;;  (if (not filename)
;; 	(message "Buffer '%s' is not visiting a file!" name)
;;  (if (get-buffer new-name)
;; 	 (message "A buffer named '%s' already exists!" new-name)
;; 	(progn 	 (rename-file name new-name 1)
;;                  (rename-buffer new-name)
;;                  (set-visited-file-name new-name)
;;                  (set-buffer-modified-p nil)))))) ;;

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(global-set-key (kbd "C-c r")  'rename-file-and-buffer)


;; Never understood why Emacs doesn't have this function, either.
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
     (progn
       (copy-file filename newname 1)
       (delete-file filename)
       (set-visited-file-name newname)
       (set-buffer-modified-p nil) t))))


(defun open-file-at-cursor ()
  "Open the file path under cursor.
If there is text selection, uses the text selection for path.
If the path is starts with “http://”, open the URL in browser.
Input path can be {relative, full path, URL}.
This command is similar to `find-file-at-point' but without prompting for confirmation."
  (interactive)
  (let ( (path (if (region-active-p)
                   (buffer-substring-no-properties (region-beginning) (region-end))
                 (thing-at-point 'filename) ) ))
    (if (string-match-p "\\`https?://" path)
        (browse-url path)
      (progn ; not starting “http://”
        (if (file-exists-p path)
            (find-file path)
          (if (file-exists-p (concat path ".el"))
              (find-file (concat path ".el"))
            (when (y-or-n-p (format "file doesn't exist: 「%s」. Create?" path) )
              (find-file path ))))))))

(provide 'file-functions)
