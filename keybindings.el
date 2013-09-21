;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  KEYBINDINGS.EL
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; define meta-shift-t as a reverse transpose to switch words backwards
(global-set-key (kbd "M-T") (lambda () (interactive) (transpose-words -1)))

;; copy line or region
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-z") 'duplicate-line-or-region)

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

;; Switch the buffer positions itself
;;  provided by buffer-move.el

;; (global-set-key (kbd "<C-S-up>")     'buf-move-up)
;; (global-set-key (kbd "<C-S-down>")   'buf-move-down)
;; (global-set-key (kbd "<C-S-left>")   'buf-move-left)
;; (global-set-key (kbd "<C-S-right>")  'buf-move-right)

(provide 'keybindings)
