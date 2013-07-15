;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                        PROGRAMMING.EL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'c-mode-common-hook
  (lambda()
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))

(defun my-c-mode-common-hook ()
  ;; my customizations for all of c-mode, c++-mode, objc-mode, java-mode
  (c-set-offset 'substatement-open 0)
  ;; other customizations can go here

  (setq c++-tab-always-indent t)
  (setq c-basic-offset 4) ;; Default is 2
  (setq c-indent-level 4) ;; Default is 2

  (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
  (setq tab-width 4)
  (setq indent-tabs-mode nil))  ; use spaces only if nil

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;indent-style
(setq c-default-style "bsd"
      c-basis-offset 4
      c-indent-level 4
      tab-width 4)

(setq c-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
(setq objc-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))
(setq c++-mode-hook
      (function (lambda ()
                  (setq indent-tabs-mode nil)
                  (setq c-indent-level 4))))

;; Perl section

;; cperl-mode is preferred to perl-mode
(defalias 'perl-mode 'cperl-mode)
