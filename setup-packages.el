
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
        highlight-symbol
        multiple-cursors
        ace-jump-mode
        yasnippet))

;; Initialisiere alles und so...
(el-get 'sync my-packages)

(provide 'setup-packages)
