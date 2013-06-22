

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-max-directory-size 1000000)
(setq ido-default-buffer-method 'selected-window)

(setq ido-save-directory-list-file "~/.emacs.d/tmp/ido.last")

(require 'ido-ubiquitous)
(ido-ubiquitous-mode t)


;; save smex here
(setq smex-save-file "~/.emacs.d/tmp/smex.save") 
(require 'smex)                                                  
(smex-initialize) 

(global-set-key [(meta x)] (lambda ()
                             (interactive)
                             (or (boundp 'smex-cache)
                                 (smex-initialize))
                             (global-set-key [(meta x)] 'smex)
                             (smex)))

(global-set-key [(shift meta x)] (lambda ()
                                   (interactive)
                                   (or (boundp 'smex-cache)
                                       (smex-initialize))
                                   (global-set-key [(shift meta x)] 'smex-major-mode-commands)
                                   (smex-major-mode-commands)))

;; Make old M-x available
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)


(provide 'setup-ido)
