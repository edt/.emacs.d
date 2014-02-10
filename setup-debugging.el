
;; gdb default settings
(setq gdb-many-windows t)
(setq gud-tooltip-mode t)

(defun gud-options ()
  "personal gud mode hook options"
  (local-set-key [home] 'comint-bol) ; move to beginning of line, after prompt
  (local-set-key [up] 
                 '(lambda () (interactive)
                    (if (comint-after-pmark-p)
                        (comint-previous-input 1)
                      (previous-line 1)))); cycle backward through command history
  (local-set-key [down] ; cycle forward through command history
                 '(lambda () (interactive)
                    (if (comint-after-pmark-p)
                        (comint-next-input 1)
                      (forward-line 1))))
  
  (setq gdb-many-windows t))

(add-hook 'gud-mode-hook 'gud-options)


(defvar debug-tmp-file-directory 
  "~/.emacs.d/tmp/"
  "directory that will contain our temporary files")


(defun write-string-to-file (string file)
   (interactive "sEnter the string: \nFFile to save to: ")
   (with-temp-file file
     (insert string)))

(defun start-gdb-in-other-frame ()
  "starts gdb in a newly created frame"
  (interactive)
  (select-frame (make-frame))
  (call-interactively 'gdb))

(defvar debug-file
  "~/.emacs.d/tmp/gdb_tmp_conf"
  "prefix for our temporary files")

(defun create-gdb-tmp-file ()
  "creates a temporary file and fills it with given text"
  (if (file-exists-p debug-file)
      (delete-file debug-file))
  (setq pos (concat (buffer-file-name) ":" (number-to-string(line-number-at-pos))))
  (setq whole-content (concat "break " pos "\nrun"))
  (write-string-to-file  whole-content debug-file))

(defun gdb-run-to-point ()
  "sets breakpoint at cursor and runs gdb to it"
  (interactive)
  (create-gdb-tmp-file)
  (if (boundp 'gud-gdb-command-name)
      (setq a (concat gud-gdb-command-name " -x " debug-file " -e "))
    (setq a (concat "gdb -i=mi -x " debug-file " -e ")))
  (setq gud-gdb-command-name a)
  (start-gdb-in-other-frame))


(defun gdb-options ()
  "personal gdb mode hook options"
  (gud-tooltip-mode 1)
  (gdb-many-windows t)
  ;;(tabbar-mode nil)
  ;;(tool-bar-mode t)
  ;; (tool-bar-mode nil)
  ;; (toggle-tool-bar-mode-from-frame t)
  )

(add-hook 'gdb-mode-hook 'gdb-options)


(provide 'setup-debugging)
