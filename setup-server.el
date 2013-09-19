
(require 'server)

;; start server when not running
(if (and (fboundp 'server-running-p) 
         (not (server-running-p)))
    (server-start))

;; In server mode, C-x C-c delete frame
(when (or (daemonp)
          server-mode)
  (global-set-key "\C-x\C-c" 'delete-frame))

;; Shortcut to kill emacs and server/deamon
(global-set-key (kbd "C-c C-q") (lambda ()
                                  (interactive)
                                  (when (y-or-n-p "Quit Emacs?")
                                    (save-buffers-kill-emacs))))

(provide 'setup-server)
