
(setq gdb-many-windows t)
(setq gud-tooltip-mode t)

(defun my-gdb-other-frame ()
  (interactive)
  (select-frame (make-frame))
  (call-interactively 'gdb))

;; Make up/down behave as in terminal
;; source http://cbbp.thep.lu.se/~karlf/emacs.html
;; 
(add-hook 'gud-mode-hook
          '(lambda ()
             (local-set-key [home] ; move to beginning of line, after prompt
                            'comint-bol)
             (local-set-key [up] ; cycle backward through command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                   (comint-previous-input 1)
                                 (previous-line 1))))
             (local-set-key [down] ; cycle forward through command history
                            '(lambda () (interactive)
                               (if (comint-after-pmark-p)
                                   (comint-next-input 1)
                                 (forward-line 1))))
             )
          (setq gdb-many-windows t))

;; (defun gdb-setup-windows ()
;;   "Layout the window pattern for `gdb-many-windows'."
;;   (gdb-display-locals-buffer)
;;   (gdb-display-stack-buffer)
;;   (delete-other-windows)
;;   (gdb-display-breakpoints-buffer)
;;   (delete-other-windows)
;;   (switch-to-buffer
;;        (if gud-last-last-frame
;;        (gud-find-file (car gud-last-last-frame))
;;      (if gdb-main-file
;;          (gud-find-file gdb-main-file)
;;        ;; Put buffer list in window if we
;;        ;; can't find a source file.
;;        (list-buffers-noselect))))
;;   (setq gdb-source-window (selected-window))
;;   (split-window-horizontally)
;;   (other-window 1)
;;   (split-window nil ( / ( * (window-height) 3) 4))
;;   (split-window nil ( / (window-height) 3))
;;   (gdb-set-window-buffer (gdb-locals-buffer-name))
;;   (other-window 1)
;;   (pop-to-buffer gud-comint-buffer)
;;   (when gdb-use-separate-io-buffer
;;     (split-window-horizontally)
;;     (other-window 1)
;;     (gdb-set-window-buffer
;;      (gdb-get-buffer-create 'gdb-inferior-io)))
;;   (other-window 1)
;;   (gdb-set-window-buffer (gdb-stack-buffer-name))
;;   (split-window-horizontally)
;;   (other-window 1)
;;   (gdb-set-window-buffer (gdb-breakpoints-buffer-name))
;;   (other-window 1))


(define-derived-mode gud-gdb-colors-mode gud-mode
  (setq font-lock-defaults
		'((;; function names
		   ("\s *\\([a-zA-Z_]\\(\\sw\\|_\\|:\\)*\\) \(" 1 font-lock-function-name-face)
		   ;; line numbers
		   (":\\([0-9]*\\)" 1 font-lock-type-face)) t))
  
  (setq mode-name "gud-gdb-colors-mode")
)
