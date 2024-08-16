

(use-package subword
  :diminish
  :config
  (global-subword-mode t))


(use-package recentf
  :config
  (setq recentf-max-saved-items 200
        recentf-max-menu-items 50)
  :init
  (recentf-mode))


(use-package restart-emacs
  :defer t
  :bind
  ("C-z r" . restart-emacs))

(use-package all-the-icons
  :ensure t
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :ensure t
  :config
  (all-the-icons-completion-mode))


  ;; :bind (:map vertico-map
  ;;             ("RET" . vertico-directory-enter)
  ;;             ("DEL" . vertico-directory-delete-char)
  ;;             ("M-DEL" . vertico-directory-delete-word))

(use-package vertico
  :ensure t
  :bind (:map vertico-map
         ("C-j" . vertico-next)
         ("C-k" . vertico-previous)
         ("C-f" . vertico-exit)
         ("RET" . vertico-directory-enter)
         ("DEL" . vertico-directory-delete-char)
         ("M-DEL" . vertico-directory-delete-word)
         :map minibuffer-local-map
         ("M-h" . backward-kill-word))
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package fussy
  :ensure t
  :config
  (push 'fussy completion-styles)
  (setq
   ;; For example, project-find-file uses 'project-files which uses
   ;; substring completion by default. Set to nil to make sure it's using
   ;; flx.
   completion-category-defaults nil
   completion-category-overrides nil))

(use-package savehist
  :init
  (savehist-mode))

;; add comments to completions
(use-package marginalia
  :after vertico
  :ensure t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))


(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))



(use-package rainbow-mode
  :ensure t
  :config
  (rainbow-mode t))


;; (use-package highlight-symbol
;;   :ensure t
;;   :defer t
;;   :diminish hs-minor-mode
;;   :bind
;;   (( "C-<f3>" . highlight-symbol-at-point)
;;    ( "<f3>" . highlight-symbol-next)
;;    ( "S-<f3>" . highlight-symbol-prev)
;;    ( "M-<f3>" . highlight-symbol-remove-all)))


;; TODO: maybe look into https://github.com/DarthFennec/highlight-indent-guides
;; as alternative
(use-package indent-guide
  :ensure t
  :diminish indent-guide-mode
  :init
  (progn
    (indent-guide-global-mode t)))


(use-package which-key
  :ensure t
  :defer t
  :diminish
  :init
  (progn
    (which-key-mode t)))

(use-package ws-butler
  :ensure t
  :diminish
  :init
  (add-hook 'prog-mode-hook #'ws-butler-mode)
  )


;; needed for magit fullframe display
(use-package fullframe
  :defer t
  :ensure t)

(use-package magit
  :ensure t
  :config
  (progn
    (add-hook 'git-commit-mode-hook 'flyspell-mode)
    (setq magit-restore-window-configuration t) ; that's the default actually
    (setq magit-status-buffer-switch-function
          (lambda (buffer) ; there might already be an Emacs function which does this
            (pop-to-buffer buffer)
            (delete-other-windows)))

    (defun magit-toggle-whitespace ()
      (interactive)
      (if (member "-w" magit-diff-options)
          (magit-dont-ignore-whitespace)
        (magit-ignore-whitespace)))

    (defun magit-ignore-whitespace ()
      (interactive)
      (add-to-list 'magit-diff-options "-w")
      (magit-refresh))

    (defun magit-dont-ignore-whitespace ()
      (interactive)
      (setq magit-diff-options (remove "-w" magit-diff-options))
      (magit-refresh))

    (define-key magit-status-mode-map (kbd "W") 'magit-toggle-whitespace)

    (setq diff-switches "-u")

    ;; magit-status will take all space in frame
    (fullframe projectile-vc magit-mode-quit-window)
    (fullframe magit-status magit-mode-quit-window)

    ))

;; highlight cursor when jumping
(use-package beacon
  :ensure t
  :defer t
  :diminish
  :init
  (beacon-mode t)
)



(use-package projectile
  :ensure t
  :diminish projectile-mode
  :init
  (progn
    (setq projectile-cache-file (expand-file-name "projectile.cache" user-cache-directory))
    (setq projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" user-cache-directory))
    (setq projectile-enable-caching t)

    ;; (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    )
  ;; :bind ("C-c p" . projectile-command-map)
  :config
  (progn
    (projectile-mode t)
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    )

  )

(use-package goto-line-preview
  :ensure t
  :config
  (global-set-key [remap goto-line] 'goto-line-preview))



(use-package smartparens-mode
  :ensure smartparens  ;; install the package
  :hook (prog-mode text-mode markdown-mode) ;; add `smartparens-mode` to these hooks
  :diminish smartparens
  :config
  ;; load default config
  (require 'smartparens-config))

(use-package expand-region
  :ensure t
  :defer t
  :bind
  (("C-'" . er/expand-region)
   ("C-;" . er/contract-region)))

(use-package diff-hl
  :ensure t
  :defer t
  :config
  (global-diff-hl-mode)
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)

  ;; make diff-hl visible in tangotango theme
  (custom-set-faces
 '(diff-hl-change ((t (:background "royal blue" :foreground "royal blue"))))
 '(diff-hl-delete ((t (:inherit diff-removed :background "red3" :foreground "red3"))))
 '(diff-hl-insert ((t (:inherit diff-added :background "green4" :foreground "green4")))))

  )

(setq read-process-output-max (* 2024 2024)) ;; 4mb

(use-package lsp-mode
  :ensure t
  :commands lsp
  :init
  (progn
    (setq lsp-keymap-prefix "C-c l")
    (setq lsp-clients-clangd-args '("-j=8" "-background-index" "-log=error")))
  :hook ((rust-mode . lsp)
         (c-mode . lsp)
         (c++-mode . lsp)
         (python-mode . lsp)
         ;(emacs-lisp-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration)))


(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.3)
  (setq company-selection-wrap-around t)
  (setq company-tooltip-align-annotations t))


(use-package smart-mode-line
  :ensure t
  :init
  (progn
    (setq sml/no-confirm-load-theme t)
    (setq sml/name-width 30)
    (setq sml/mode-width 20)
    (setq sml/shorten-directory t)
    (setq sml/shorten-modes t)
    (setq sml/mode-width 'full)
    (sml/setup)))


(add-hook 'prog-mode
          (lambda()
            (flyspell-prog-mode t)))

(add-hook 'find-file-hooks 'goto-address-prog-mode)

(defun my-c-mode-common-hook ()
  "my customizations for all of c-mode, c++-mode, objc-mode, java-mode"
  (c-set-offset 'substatement-open 0)
  (c-set-offset 'innamespace 0)
  (c-set-offset 'case-label '+)
  ;; other customizations can go here

  (local-set-key  (kbd "C-c o") 'ff-find-other-file)
  (local-set-key  (kbd "RET") 'newline-and-indent)
  ;; (local-set-key  (kbd "RET") 'reindent-then-newline-and-indent)

  (c-toggle-electric-state 1)
  (setq c++-tab-always-indent t))

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(provide 'modes)

;; (getenv "PATH")
