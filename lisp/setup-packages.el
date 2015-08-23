
(setq edt-packages
      '(
        projectile
        smart-mode-line
        smex
        ido-ubiquitous
        magit
        yasnippet
        auto-complete
        browse-kill-ring
        elpy
        highlight-symbol
        smartparens
        markdown-mode
        diff-hl
        ggtags
        rainbow-mode
        expand-region
        flycheck
        multi-term
        multiple-cursors
        ace-jump-mode
        buffer-move
        ack-and-a-half
        indent-guide
        org
        use-package
        fic-ext-mode
        emms
        cmake-ide
        helm
        go-mode
        go-eldoc
        company-irony
        ))



; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")))


(package-initialize)


(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (pkg edt-packages)
  (when (and (not (package-installed-p pkg))
             (assoc pkg package-archive-contents))
    (package-install pkg)))

(defun package-list-unaccounted-packages ()
  "Like `package-list-packages', but shows only the packages that
  are installed and are not in `edt-packages'.  Useful for
  cleaning out unwanted packages."
  (interactive)
  (package-show-package-list
   (remove-if-not (lambda (x) (and (not (memq x edt-packages))
                                   (not (package-built-in-p x))
                                   (package-installed-p x)))
                  (mapcar 'car package-archive-contents))))

;; el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.
(setq el-get-sources
      '(el-get              ; el-get is self-hosting
        irony-mode
        revive-plus
        doxymacs
))

;; install new packages and init already installed packages
(el-get 'sync el-get-sources)

(provide 'setup-packages)
