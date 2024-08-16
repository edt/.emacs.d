
(require 'desktop)


;; directories for .emacs.desktop and .emacs.desktop.lock files
(setq desktop-path '("~/.emacs.d/tmp"))
(setq desktop-dirname "~/.emacs.d/tmp")


;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-globals-to-save
      (append '((extended-command-history . 300)
                (file-name-history        . 1000)
                (grep-history             . 300)
                (compile-history          . 300)
                (minibuffer-history       . 500)
                (query-replace-history    . 600)
                (read-expression-history  . 600)
                (regexp-history           . 600)
                (regexp-search-ring       . 200)
                (search-ring              . 200)
                (shell-command-history    . 500)
                tags-file-name
                register-alist)))


;; Save session before quitting
(desktop-save-mode t)


(provide 'setup-session)
