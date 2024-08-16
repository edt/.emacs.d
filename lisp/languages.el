

;; used for jenkins
(use-package groovy-mode
  :ensure t
  :defer t
  :mode ("\\.g\\(?:ant\\|roovy\\|radle\\)\\'\\|Jenkinsfile\\'" . groovy-mode))



(use-package cmake-mode
  :ensure t
  :mode
  (("\\.cmake\\'" . cmake-mode)
   ("\\CMakeLists.txt\\'" . cmake-mode)))

(use-package dockerfile-mode
  :ensure t
  :mode "\\.docker\\'")


(use-package markdown-mode
  :mode
  (("\\.text\\'" . markdown-mode)
   ("\\.markdown\\'" . markdown-mode)
   ("\\.md\\'" . markdown-mode)
   ("\\README\\'" . markdown-mode)))


(use-package shell-script-mode
  :mode
  (
   ("bashrc\\'" . shell-script-mode)
   ("bash_aliases\\'" . shell-script-mode)
   ("*.sh\\'" . shell-script-mode)
   )
  )

(use-package editorconfig
  :ensure t
  :mode (("\\.editorconfig\\'" . editorconfig-conf-mode)))

(provide 'languages)
