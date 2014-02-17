
(require 'multi-term)


(setq multi-term-program "/bin/bash")

;; tab completion should not be prevented
(add-hook 'term-mode-hook (lambda ()
                            (setq yas-dont-activate t)))


(defface term-color-blue '((t (:background "DodgerBlue2" :foreground "#6d85ba"))) "Blue color")

;; ansi-term colors
(setq ansi-term-color-vector
      [term term-color-black term-color-red term-color-green term-color-yellow 
            term-color-blue term-color-magenta term-color-cyan term-color-white])


(provide 'setup-terminal)
