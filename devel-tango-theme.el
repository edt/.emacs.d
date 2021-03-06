(deftheme devel-tango
  "Personal theme based on the tango palette")

(custom-theme-set-faces
 'devel-tango
 '(cursor ((t (:background "#fce94f"))))
 '(company-scrollbar-bg ((t (:inherit company-tooltip :background "black"))))
 '(company-scrollbar-fg ((t (:background "dim gray"))))
 '(company-tooltip ((t (:background "gray40" :foreground "black"))))
 '(cperl-array-face ((t (:foreground "yellow" :weight bold))) t)
 '(cperl-hash-face ((t (:foreground "Red" :slant italic :weight bold))) t)
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((((background dark))
                  (:foreground "cyan"))
                 (((type pc))
                  (:foreground "magenta"))
                 (t (:foreground "brown"))))
 '(minibuffer-prompt ((t (:weight bold :foreground "#729fcf"))))
 '(highlight ((((class color)
                (min-colors 88)
                (background light))
               (:background "DarkSeaGreen2"))
              (((class color)
                (min-colors 88)
                (background dark))
               (:background "DarkOliveGreen"))
              (((class color)
                (min-colors 16)
                (background light))
               (:background "DarkSeaGreen2"))
              (((class color)
                (min-colors 16)
                (background dark))
               (:background "DarkOliveGreen"))
              (((class color)
                (min-colors 8))
               (:foreground "black" :background "green"))
              (t (:inverse-video t))))
 '(region ((t (:background "#555753"))))
 '(shadow ((((class color grayscale)
             (min-colors 88)
             (background light))
            (:foreground "grey50"))
           (((class color grayscale)
             (min-colors 88)
             (background dark))
            (:foreground "grey70"))
           (((class color)
             (min-colors 8)
             (background light))
            (:foreground "green"))
           (((class color)
             (min-colors 8)
             (background dark))
            (:foreground "yellow"))))
 '(secondary-selection ((((class color)
                          (min-colors 88)
                          (background light))
                         (:background "yellow1"))
                        (((class color)
                          (min-colors 88)
                          (background dark))
                         (:background "SkyBlue4"))
                        (((class color)
                          (min-colors 16)
                          (background light))
                         (:background "yellow"))
                        (((class color)
                          (min-colors 16)
                          (background dark))
                         (:background "SkyBlue4"))
                        (((class color)
                          (min-colors 8))
                         (:foreground "black" :background "cyan"))
                        (t (:inverse-video t))))
 '(trailing-whitespace ((((class color)
                          (background light))
                         (:background "red1"))
                        (((class color)
                          (background dark))
                         (:background "red1"))
                        (t (:inverse-video t))))
 '(font-lock-builtin-face ((t (:foreground "#729fcf"))))
 '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#888a85"))))
 '(font-lock-constant-face ((t (:foreground "#8ae234"))))
 '(font-lock-doc-face ((t (:foreground "#888a85"))))
 '(font-lock-function-name-face ((t (:slant italic :weight bold :foreground "#edd400"))))
 '(font-lock-keyword-face ((t (:weight bold :foreground "#729fcf"))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((t (:slant italic :foreground "#ad7fa8"))))
 '(font-lock-type-face ((t (:weight bold :foreground "#8ae234"))))
 '(font-lock-variable-name-face ((t (:foreground "#eeeeec"))))
 '(font-lock-warning-face ((t (:weight bold :foreground "#f57900"))))
 '(font-lock-fic-author-face ((t (:background "gray20" :foreground "orangered" :underline t))))
 '(font-lock-fic-face ((t (:background "gray20" :foreground "red" :weight bold))))
 '(button ((t (:inherit (link)))))
 '(link ((((class color)
           (min-colors 88)
           (background light))
          (:underline (:color foreground-color :style line) :foreground "RoyalBlue3"))
         (((class color)
           (background light)) (:underline (:color foreground-color :style line) :foreground "blue"))
         (((class color)
           (min-colors 88)
           (background dark))
          (:underline (:color foreground-color :style line) :foreground "cyan1"))
         (((class color)
           (background dark))
          (:underline (:color foreground-color :style line) :foreground "cyan"))
         (t (:inherit (underline)))))
 '(link-visited ((default (:inherit (link)))
                 (((class color)
                   (background light))
                  (:foreground "magenta4"))
                 (((class color)
                   (background dark))
                  (:foreground "violet"))))
 '(fringe ((t (:background "grey10"))))
 '(header-line ((default (:inherit (mode-line)))
                (((type tty))
                 (:underline (:color foreground-color :style line) :inverse-video nil))
                (((class color grayscale)
                  (background light))
                 (:box nil :foreground "grey20" :background "grey90"))
                (((class color grayscale)
                  (background dark))
                 (:box nil :foreground "grey90" :background "grey20"))
                (((class mono)
                  (background light))
                 (:underline (:color foreground-color :style line)
                  :box nil
                  :inverse-video nil
                  :foreground "black"
                  :background "white"))
                (((class mono)
                  (background dark))
                 (:underline (:color foreground-color :style line)
                  :box nil
                  :inverse-video nil
                  :foreground "white"
                  :background "black"))))
 '(tooltip ((((class color))
             (:inherit (variable-pitch) :foreground "black" :background "LightYellow"))
            (t (:inherit (variable-pitch)))))
 '(mode-line ((t (:background "#555753" :foreground "#eeeeec"))))
 '(mode-line-buffer-id ((t (:foreground "SteelBlue3" :weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color)
                          (min-colors 88))
                         (:box (:line-width 2 :color "grey40" :style released-button)))
                        (t (:inherit (highlight)))))
 '(mode-line-inactive ((default (:inherit (mode-line)))
                       (((class color)
                         (min-colors 88)
                         (background light))
                        (:background "grey90"
                         :foreground "grey20"
                         :box (:line-width -1 :color "grey75" :style nil) :weight light))
                       (((class color)
                         (min-colors 88)
                         (background dark))
                        (:background "grey30"
                         :foreground "grey80"
                         :box (:line-width -1 :color "grey40" :style nil) :weight light))))
 '(isearch ((t (:foreground "#2e3436" :background "#f57900"))))
 '(isearch-fail ((((class color)
                   (min-colors 88)
                   (background light))
                  (:background "RosyBrown1"))
                 (((class color)
                   (min-colors 88)
                   (background dark))
                  (:background "red4"))
                 (((class color)
                   (min-colors 16))
                  (:background "red"))
                 (((class color)
                   (min-colors 8))
                  (:background "red"))
                 (((class color grayscale))
                  (:foreground "grey"))
                 (t (:inverse-video t))))
 '(lazy-highlight ((t (:foreground "#2e3436" :background "#e9b96e"))))
 '(org-level-2 ((t (:inherit outline-2 :foreground "cyan1"))))
 '(term-color-black ((t (:foreground "black" :background "black"))))
 '(term-color-blue ((t (:foreground "#6d85ba" :background "#6d85ba" ))))
 '(term-color-cyan ((t (:foreground "cyan3" :background "cyan3"))))
 '(term-color-green ((t (:foreground "green3" :background "green3"))))
 '(term-color-magenta ((t (:foreground "magenta3" :background "magenta3"))))
 '(term-color-red ((t (:foreground "red3" :background "red3"))))
 '(term-color-white ((t (:foreground "white" :background "white"))))
 '(term-color-yellow ((t (:foreground "yellow3" :background "yellow3"))))
 '(term-default-fg-color ((t (:inherit term-color-white))))
 '(term-default-bg-color ((t (:inherit term-color-black))))
 '(compilation-error ((t (:inherit error :foreground "IndianRed1"))))
 '(match ((((class color)
            (min-colors 88)
            (background light))
           (:background "yellow1"))
          (((class color)
            (min-colors 88)
            (background dark))
           (:background "RoyalBlue3"))
          (((class color)
            (min-colors 8)
            (background light))
           (:foreground "black" :background "yellow"))
          (((class color)
            (min-colors 8)
            (background dark))
           (:foreground "white" :background "blue"))
          (((type tty)
            (class mono))
           (:inverse-video t))
          (t (:background "gray"))))
 '(next-error ((t (:inherit region))))
 '(query-replace ((t (:inherit (isearch)))))
 '(default ((t (:inherit nil
                :stipple nil
                :background "gray20"
                :foreground "#FFFFFF"
                :inverse-video nil
                :box nil
                :strike-through nil
                :overline nil
                :underline nil
                :slant normal
                :weight normal
                :height 99
                :width normal
                :foundry "unknown"
                :family "DejaVu Sans Mono")))))

(provide-theme 'devel-tango)
