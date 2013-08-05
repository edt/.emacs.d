
;; set the default compilation command
(setq compile-command "make -j -k")
(setq compile-clean "make clean")
(setq compilation-window-height 20)

;; stop at first error or keep scrolling
;;(setq compilation-scroll-output t)
(setq compilation-scroll-output 'first-error)

;; (setq-default compilation-directory "/home/edt/work/aravis")

(global-set-key (kbd "<f5>") 'my-recompile)
(global-set-key (kbd "<C-f5>") 'compile-in-directory)
(global-set-key (kbd "<S-f5>") 'compile-clean)

(defun compile-in-directory ()
  "Reads a directory name (using ido), then runs
execute-extended-command with default-directory in the given
directory."
  (interactive)
  (if (get-buffer "*compilation*") ; If old compile window exists
      (progn
        (delete-windows-on (get-buffer "*compilation*")) ; Delete the compilation windows
        (kill-buffer "*compilation*") ; and kill the buffers
        ))
  (let ((default-directory 
          (ido-read-directory-name "In directory: "
                                   nil nil t)))
    (call-interactively 'my-recompile)))

;; my version
(defun my-recompile ()
  "Run compile and resize the compile window closing the old one if necessary"
  (interactive)
  (progn
    (if (get-buffer "*compilation*") ; If old compile window exists
        (progn
          (call-interactively 'recompile))
      (call-interactively 'compile))
    (enlarge-window 20)))


(defun compile-clean ()
  "Switches between compile command and clean command"
  (interactive)
(let (  (compile-command compile-clean)
        (compilation-read-command nil))
  (call-interactively 'compile)
  (enlarge-window 20)))
  

;; assure the compilation buffer is only opened once when multiple frames are open
(add-to-list
 'display-buffer-alist
 '("\\*compilation\\*" . (display-buffer-reuse-window
                          . ((reusable-frames . t)))))



;; (defun compile-clean ()
;;   "Switches between compile command and clean command"
;;   (interactive)
;;   (setq compile-command-backup compile-command)
;;   (setq compile-command compile-clean)
;;   (setq compilation-read-command nil)
;;   (call-interactively 'compile)
;;   (enlarge-window 20)
;;   (setq compilation-read-command t)
;;   (setq compile-command compile-command-backup))


  ;; (defun my-recompile ()
  ;;   "Run compile and resize the compile window closing the old one if necessary"
  ;;   (interactive)
  ;;   (progn
  ;;     (if (get-buffer "*compilation*") ; If old compile window exists
  ;;    (progn
  ;;     (delete-windows-on (get-buffer "*compilation*")) ; Delete the compilation windows
  ;;     (kill-buffer "*compilation*") ; and kill the buffers
  ;;      ))
  ;;     (call-interactively 'compile)
  ;;     (enlarge-window 20)))

  ;; (defun my-next-error ()
  ;;   "Move point to next error and highlight it"
  ;;   (interactive)
  ;;   (progn
  ;;     (next-error)
  ;;     (end-of-line-nomark)
  ;;     (beginning-of-line-mark)))

  ;; (defun my-previous-error ()
  ;;   "Move point to previous error and highlight it"
  ;;   (interactive)
  ;;   (progn
  ;;     (previous-error)
  ;;     (end-of-line-nomark)
  ;;     (beginning-of-line-mark)))

