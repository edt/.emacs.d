;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  KEYBINDINGS.EL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x p") 'pop-to-mark-command)
(setq set-mark-command-repeat-pop t)

(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; define meta-shift-t as a reverse transpose to switch words backwards
(global-set-key (kbd "M-T") (lambda () (interactive) (transpose-words -1)))

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; copy line or region
(global-unset-key (kbd "C-z"))
(define-prefix-command 'user-shortcut-map)
(global-set-key (kbd "C-z") 'user-shortcut-map)
(global-set-key (kbd "C-z d") 'duplicate-line-or-region)

;; Keybinding to allow fullscreen operations
(global-set-key [f11] 'fullscreen)

;;make delete button actually delete
(global-set-key [delete] 'delete-char)

;; Move between windows with META - direction

(global-set-key (kbd "M-<left>")  'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>")    'windmove-up)
(global-set-key (kbd "M-<down>")  'windmove-down)


;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(provide 'keybindings)
