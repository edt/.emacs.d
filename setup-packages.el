
;;------------------------------------------------------------------------------
;; el-get
;;------------------------------------------------------------------------------

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; Wenn el-get nicht geladen werden kann, lädt er die aktuelle (development)
;; Version herunter und installiert es.
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
       (lambda (s)
         (let (el-get-master-branch)
           (goto-char (point-max))
           (eval-print-last-sexp))))))

;; Hier die packages hinzufügen
;; Namen kann man im el-get repository nachschauen (recipes ordner)
;; Alternativ auch halt eigene recipes schreiben
(setq my-packages
      '(el-get
        color-theme
        ido-ubiquitous
        smex
        projectile
        auto-complete
        browse-kill-ring
        highlight-symbol
        expand-region
        multiple-cursors
        ace-jump-mode
        revive-plus
        buffer-move
        yasnippet))

;; Initialisiere alles und so...
(el-get 'sync my-packages)


; list the packages you want
(setq package-list '(highlight-indentation
                     elpy
                     markdown-mode
                     rainbow-mode
                     ack-and-a-half
                     diff-hl
                     keyfreq))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(when (not package-archive-contents)
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (when (not (package-installed-p package))
    (package-install package)))


(provide 'setup-packages)
