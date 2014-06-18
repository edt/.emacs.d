
(eval-after-load "multi-term"
  '(progn
     (setq multi-term-program "/bin/bash")

     ;; tab completion should not be prevented
     (add-hook 'term-mode-hook (lambda ()
                                 (setq yas-dont-activate t)))
     )
  )

(provide 'setup-terminal)
