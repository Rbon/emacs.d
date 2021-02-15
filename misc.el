(evil-mode 1) ; enable evil
(setq confirm-kill-processes nil)
(global-evil-mc-mode  1) ; multiple cursors
(setq-default mini-modeline-enhance-visual nil) ; does the opposite of what I would think
(eyebrowse-mode t)
(mini-modeline-mode t)
(setq-default mode-line-format nil)
(setq mode-line-format nil) ; seems redundant, but isn't. remove this and if you manually eval this file, the mode-line will make a triumphant return
(setq-default mini-modeline-display-gui-line t)
(setq-default window-divider-default-places t) ; display divider on all sides
(setq-default window-divider-default-bottom-width 1) ; must be defined before the mode is turned on 
(setq-default window-divider-default-right-width 1) ; same
(window-divider-mode t)

(setq-default mini-modeline-r-format
      (list
      '("%e"
        mode-line-buffer-identification
        mode-line-modified) " "
       '(:eval (eyebrowse-mode-line-indicator))))

; (powerline-default-theme)

(setq which-key-enable-extended-define-key t)

(defcustom my-skippable-buffers '("*Messages*" "*scratch*" "*Help*" "Buffer List*")
  "Buffer names ignored by `my-next-buffer' and `my-previous-buffer'."
  :type '(repeat string))

(global-set-key [remap next-buffer] 'my-next-buffer)
(global-set-key [remap previous-buffer] 'my-previous-buffer)

(setq org-hide-emphasis-markers t)

; (setq dired-omit-extensions '(".hi" ".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".idx" ".lof" ".lot" ".glo" ".blg" ".bbl" ".cp" ".cps" ".fn" ".fns" ".ky" ".kys" ".pg" ".pgs" ".tp" ".tps" ".vr" ".vrs"))


(setq default-directory "~/") 

; dired stuff
(setq ls-lisp-use-insert-directory-program nil)
(require 'ls-lisp)

(setq haskell-process-show-debug-tips nil)
(global-undo-tree-mode 1)
(setq evil-undo-system 'undo-tree)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(ido-mode 1) ; better find-file
(exec-path-from-shell-initialize) ; fix PATH on macos
(set-custom-file-path (expand-file-name "custom.el" user-emacs-directory)) ; move custom set variables/faces out of init.el
(setq init-path (expand-file-name "init.el" user-emacs-directory)) ; assign init.el path to a variable
(tool-bar-mode -1) ; disable toolbar
(scroll-bar-mode -1) ; disable scroll bar
; (tab-bar-mode 1) ; enable tab bar (DOESN'T WORK ON MACOS COOL)
(setq inhibit-splash-screen t) ; disable splash screen
(which-key-mode) ; enable which-key
;; (which-key-setup-side-window-bottom)
(setq which-key-idle-secondary-delay 0)
(when (fboundp 'windmove-default-keybindings) (windmove-default-keybindings)) ; enable windmove
;; (add-to-list 'load-path "~/.emacs.d") ; needed for 'require' to see my other configs
(setq help-window-select t) ; switch to help windows automatically
(load-theme 'solarized-light t) ; best theme fight me
(setq initial-scratch-message "") ; make scratch empty
(setq-default indent-tabs-mode nil) ; use spaces, not tabs
(setq-default tab-width 2)
(setq lua-indent-level 2) ; why
(setq-default evil-shift-width 2) ; whyy
(blink-cursor-mode 0) ; stop the cursor from blinking

;; HOOKS
;; (add-hook 'emacs-startup-hook 'toggle-frame-fullscreen) ; start emacs in fullscreen
(add-hook 'recentf-dialog-mode-hook 'evil-normal-state) ; fix recentf-mode for evil
(add-hook 'org-agenda-mode-hook 'evil-normal-state) ; fix org-agenda-mode for evil (DOESN'T WORK?)
(add-hook 'haskell-mode-hook 'hasklig-mode) ; use ligatures for Haskell
(add-hook 'haskell-mode-hook #'lsp)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)
(add-hook 'interactive-haskell-mode-hook 'hasklig-mode) ; use ligatures for Haskell
(add-hook 'haskell-literate-mode-hook #'lsp)
(add-hook 'error-mode-hook 'evil-emacs-state)

(setq org-agenda-files (list "~/Documents/School/agenda.org"))
;; recent file stuff
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

;; sane text wrapping
(global-visual-line-mode 1)
(define-key evil-normal-state-map "j" 'evil-next-visual-line)
(define-key evil-normal-state-map "k" 'evil-previous-visual-line)
(add-hook 'haskell-mode-hook 'display-fill-column-indicator-mode)
(add-hook 'emacs-lisp-mode-hook 'display-fill-column-indicator-mode)
(setq-default fill-column 80)

;; (setq-default mode-line-format "") ; get rid of status line
(setq ispell-program-name "/opt/local/bin/ispell") ; teach emacs how to spell

;; enable spell check for text-mode
(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))


;; APPEARANCE

(set-face-attribute 'default nil
                    :family "Hasklig"
                    :height 150
                    :weight 'normal
                    :width 'normal)
;; (setq default-frame-alist
      ;; (append (list '(width . 72) '(height . 40))))

; (set-face-attribute 'mode-line nil
                    ; :height 10
                    ; :underline "red"
                    ; :background "black"
		                ; :foreground "white"
                    ; :box nil)
; 
; (set-face-attribute 'mode-line-inactive nil
                    ; :box nil
                    ; :background "black"
                    ; :inherit 'mode-line)

; (set-face-attribute 'minibuffer-prompt nil
                    ; :height 10
                    ; :underline "red"
                    ; :background "red"
		    ; :foreground "blue"
                    ; :box "red")

(pixel-scroll-mode t)

(defvar booted nil)
(unless booted (progn 
  ; (switch-to-buffer "Untitled")
  ; (text-mode) ; needed for spell check
  ; (dired ".")
  (if (file-exists-p (expand-file-name "recentf" user-emacs-directory))
    (recentf-open-files))
  (setq booted t))) 


