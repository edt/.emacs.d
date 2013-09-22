
(load "el-get/emacs-w3m/w3m-load")
(require 'w3m)

(setq browse-url-browser-function 'w3m-browse-url
          browse-url-new-window-flag t)

;; Enable cookies
(setq w3m-use-cookies t)

;; Enable images within w3m
(setq w3m-default-display-inline-images t)

;; Use UTF-8
(setq w3m-coding-system 'utf-8
      w3m-file-coding-system 'utf-8
      w3m-file-name-coding-system 'utf-8
      w3m-input-coding-system 'utf-8
      w3m-output-coding-system 'utf-8
      w3m-terminal-coding-system 'utf-8)

(defun w3m-open-current-page-in-browser ()
  "Open the current URL in Mozilla Browser."
  (interactive)
  (browse-url-default-browser w3m-current-url)) ;; (1)

(defun w3m-open-link-or-image-in-browser ()
  "Open the current link or image in Browser."
  (interactive)
  (browse-url-default-browser (or (w3m-anchor) ;; (2)
                          (w3m-image)))) ;; (3)

(define-key w3m-mode-map "f" 'w3m-open-current-page-in-browser)
(define-key w3m-mode-map "F" 'wicked/w3m-open-link-or-image-in-browser)
(define-key w3m-mode-map "." 'w3m-previous-buffer)
(define-key w3m-mode-map "," 'w3m-next-buffer)
;; (eval-after-load 'w3m
;;   (progn 
;;     (define-key w3m-mode-map "f" 'w3m-open-current-page-in-browser)
;;    ; (define-key w3m-mode-map "F" 'wicked/w3m-open-link-or-image-in-browser)
;; ))

