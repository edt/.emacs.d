

# provides buffer sessions
#
# save all open buffers to a desktop file
# and load them when needed

# based on: http://stackoverflow.com/a/849180/2328956


(defun close-all-buffers ()
  "Obviously kills all buffers"
  (mapc 'kill-buffer (buffer-list)))

(defvar my-desktop-session-dir
  (concat (getenv "HOME") "/.emacs.d/tmp/projects/")
  "*Directory to save desktop sessions in")

(defvar my-desktop-session-name-hist nil
  "Desktop session name history")

(defun my-desktop-save (&optional name)
  "Save desktop with a name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Save session as: ")))
  (make-directory (concat my-desktop-session-dir name) t)
  (desktop-save (concat my-desktop-session-dir name) t))

(defun my-desktop-read (&optional name)
  "Read desktop with a name."
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Load session: ")))
  (desktop-read (concat my-desktop-session-dir name)))

(defun my-desktop-get-session-name (prompt)
  (completing-read prompt (and (file-exists-p my-desktop-session-dir)
                               (directory-files my-desktop-session-dir))
                   nil nil nil my-desktop-session-name-hist))

(defun my-desktop-save-and-close (&optional name)
  "Saves session and closes all buffers"
  (interactive)
  (unless name
    (setq name (my-desktop-get-session-name "Save session as: ")))
  (my-desktop-save name)
  (close-all-buffers))

(defun my-desktop-switch-session (&optional name)
  "saves session and opens other session"
  (interactive)
  (my-desktop-save-and-close)
  (my-desktop-read))

(provide 'buffer-sessions)
