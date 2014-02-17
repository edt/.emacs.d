
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
        magit
        elpy
        highlight-symbol
        smartparens
        markdown-mode
        diff-hl
        rainbow-mode
        expand-region
        multi-term
        multiple-cursors
        ace-jump-mode
        revive-plus
        buffer-move
        ack-and-a-half
        keyfreq
		browse-kill-ring
        ))


(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/"))

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

(provide 'setup-packages)
