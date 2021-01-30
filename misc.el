(defun rbon/escape ()
  "Get rid of extra cursors while also normally escaping."
  (interactive)
  (evil-mc-undo-all-cursors)
  (evil-force-normal-state)
  )

(defun rbon/add-cursor-move-down ()
  (interactive)
  (evil-mc-make-cursor-here) 
  (evil-mc-pause-cursors) 
  (next-line)
  (evil-mc-resume-cursors))

(defun rbon/add-cursor-move-up ()
  (interactive)
  (evil-mc-make-cursor-here) 
  (evil-mc-pause-cursors) 
  (previous-line)
  (evil-mc-resume-cursors))


(defun rbon/make-cursor-in-visual-selection-beg ()
  (interactive)
  (evil-mc-make-cursor-in-visual-selection-beg)
  (evil-mc-make-cursor-in-visual-selection-beg)
  )

(global-evil-mc-mode  1)
(setq-default mini-modeline-enhance-visual nil) ; does the opposite of what I would think
(mini-modeline-mode t)
(eyebrowse-mode t)
(setq-default mode-line-format nil)
(setq mode-line-format nil) ; seems redundant, but isn't. remove this and if you manually eval this file, the mode-line will make a triumphant return
; (setq-default mini-modeline-display-gui-line t)
(setq-default window-divider-default-places t) ; display divider on all sides

(setq-default window-divider-default-bottom-width 1) ; must be defined before the mode is turned on 
(setq-default window-divider-default-right-width 1) ; same
(window-divider-mode t)
; 
(setq-default mini-modeline-r-format
      (list
      '("%e"
        mode-line-buffer-identification
        mode-line-modified) " "
       '(:eval (eyebrowse-mode-line-indicator))))

; (powerline-default-theme)



(defun nop ()
  "Needed to unbind keys. Yes."
  (interactive))

(setq which-key-enable-extended-define-key t)
(defcustom my-skippable-buffers '("*Messages*" "*scratch*" "*Help*" "Buffer List*")
  "Buffer names ignored by `my-next-buffer' and `my-previous-buffer'."
  :type '(repeat string))

(defun my-change-buffer (change-buffer)
  "Call CHANGE-BUFFER until current buffer is not in `my-skippable-buffers'."
  (let ((initial (current-buffer)))
    (funcall change-buffer)
    (let ((first-change (current-buffer)))
      (catch 'loop
        (while (member (buffer-name) my-skippable-buffers)
          (funcall change-buffer)
          (when (eq (current-buffer) first-change)
            (switch-to-buffer initial)
            (throw 'loop t)))))))

(defun my-next-buffer ()
  "Variant of `next-buffer' that skips `my-skippable-buffers'."
  (interactive)
  (my-change-buffer 'next-buffer))

(defun my-previous-buffer ()
  "Variant of `previous-buffer' that skips `my-skippable-buffers'."
  (interactive)
  (my-change-buffer 'previous-buffer))

(global-set-key [remap next-buffer] 'my-next-buffer)
(global-set-key [remap previous-buffer] 'my-previous-buffer)

(setq org-hide-emphasis-markers t)


(defun narrow-and-unfold ()
  (interactive)
  (evil-open-fold)
  (evil-end-of-line)
  (narrow-to-defun)
  (evil-digit-argument-or-evil-beginning-of-line))

(defun widen-and-fold ()
  (interactive)
  (evil-close-folds)
  (widen))


(defun make-bold ()
  (interactive)
  (org-emphasize ?*))

(defun make-italic ()
  (interactive)
  (org-emphasize ?/))

; (setq dired-omit-extensions '(".hi" ".o" "~" ".bin" ".lbin" ".so" ".a" ".ln" ".blg" ".bbl" ".elc" ".lof" ".glo" ".idx" ".lot" ".svn/" ".hg/" ".git/" ".bzr/" "CVS/" "_darcs/" "_MTN/" ".fmt" ".tfm" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".dfsl" ".pfsl" ".d64fsl" ".p64fsl" ".lx64fsl" ".lx32fsl" ".dx64fsl" ".dx32fsl" ".fx64fsl" ".fx32fsl" ".sx64fsl" ".sx32fsl" ".wx64fsl" ".wx32fsl" ".fasl" ".ufsl" ".fsl" ".dxl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".idx" ".lof" ".lot" ".glo" ".blg" ".bbl" ".cp" ".cps" ".fn" ".fns" ".ky" ".kys" ".pg" ".pgs" ".tp" ".tps" ".vr" ".vrs"))

(defun run-code ()
  (interactive)
  (haskell-process-load-file)
  (other-window 1)
  (evil-append-line 1))

(setq default-directory "~/") 

; dired stuff
(setq ls-lisp-use-insert-directory-program nil)
(require 'ls-lisp)

(setq haskell-process-show-debug-tips nil)
(global-undo-tree-mode 1)
(setq evil-undo-system 'undo-tree)
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(ido-mode 1) ; better find-file

(defun my-switch-to-buffer ()
  "Switch buffers, excluding special buffers."
  (interactive)
  (let ((completion-regexp-list '("\\`[^*]"
                                  "\\`\\([^T]\\|T\\($\\|[^A]\\|A\\($\\|[^G]\\|G\\($\\|[^S]\\|S.\\)\\)\\)\\).*")))
    (switch-to-buffer nil)))

(defun touch-file (file)
  "Create a file called FILE.
  If FILE already exists, signal an error."
  (interactive
  (list (read-file-name "Create file: " (dired-current-directory))))
  (let* ((expanded (expand-file-name file))
  (try expanded)
  (dir (directory-file-name (file-name-directory expanded)))
  new)
  (if (file-exists-p expanded)
  (error "Cannot create file %s: file exists" expanded))
  ;; Find the topmost nonexistent parent dir (variable `new')
  (while (and try (not (file-exists-p try)) (not (equal new try)))
  (setq new try
    try (directory-file-name (file-name-directory try))))
  (when (not (file-exists-p dir))
  (make-directory dir t))
  (write-region "" nil expanded t)
  (when new
  (dired-add-file new)
  (dired-move-to-filename))))

(exec-path-from-shell-initialize) ; fix PATH on macos


(set-custom-file-path (expand-file-name "custom.el" user-emacs-directory)) ; move custom set variables/faces out of init.el
(setq init-path (expand-file-name "init.el" user-emacs-directory)) ; assign init.el path to a variable
(tool-bar-mode -1) ; disable toolbar
(scroll-bar-mode -1) ; disable scroll bar
; (tab-bar-mode 1) ; enable tab bar (DOESN'T WORK ON MACOS COOL)
(setq inhibit-splash-screen t) ; disable splash screen
(evil-mode 1) ; enable evil
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
(add-hook 'nteractive-haskell-mode-hook 'hasklig-mode) ; use ligatures for Haskell
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

(defun evil-recentf ()
  (interactive)
  (recentf-open-files)
  (evil-normal-state))

(defun display-startup-echo-area-message ()
  "This function replaces the startup minibuffer message with nil."
  (message nil))

(defun find-init ()
  (interactive)
  (find-file init-path))

(defun find-config-file ()
  (interactive)
  (cd user-emacs-directory)
  (call-interactively 'find-file))

(defun load-init ()
  (interactive)
  (load-user-file "init.el"))

(defun split-h-and-change-focus ()
  (interactive)
  (split-window-horizontally)
  (other-window 1))

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


