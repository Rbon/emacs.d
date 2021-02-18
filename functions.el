(defun rbon-switch-to-scratch ()
  (interactive)
  (display-buffer-pop-up-frame (goet-buffer-create "scratch")))

(defun rbon-insert-haskell-prompt-start ()
  (interactive)
  (goto-char haskell-interactive-mode-prompt-start)
  (call-interactively 'evil-insert))

(defun rbon-goto-haskell-prompt-start ()
  (interactive)
  (goto-char haskell-interactive-mode-prompt-start))

(defun rbon-center-frame ()
  "Move the current frame to the center of the display.
Why is this not a built-in function?"
  (interactive)
  (let ((h-offset (/ (- (display-pixel-width) (frame-native-width)) 2))
        (v-offset (/ (- (display-pixel-height) (frame-native-height)) 2)))
    (set-frame-position (selected-frame) h-offset v-offset)))

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

(defun nop ()
  "Needed to unbind keys. Yes."
  (interactive))

(defun rbon--local-set-key (state bindings)
  (dolist (b bindings)
    (evil-local-set-key state (kbd (nth 0 b)) (nth 1 b))))

(defun rbon--global-set-key (state binding)
  (let ((key (kbd (nth 0 binding)))
        (def (nth 1 binding)))
    (evil-define-key state 'global key def)))

(defun rbon-define-key (mode state &rest bindings)
  "Define one or more key bindings.
MODE should be a symbol. If it is 'global, then bind keys globally. Otherwise, create buffer-local binds when that mode is activated, which means mode-specific binds will never leave their designated mode.
STATE can either be a symbol or list of symbols, just as you would use with 'evil-define-key'.
BINDINGS should be in the form of '(KEY DEF), where KEY is a string, and DEF is a function.
KEY is automatically applied to `kbd'.

Examples:

  (rbon-define-key 'global 'normal '(\"q\" myfun1))

  (rbon-define-key 'some-mode 'insert
    '(\"TAB\" myfun1)
    '(\"SPC b l\" myfun2))

If `which-key-enable-extended-define-key' is non-nil, then you can optionally add a string to replace the function name when using which-key. In which case, BINDINGS should take the form of '(KEY (REPLACEMENT . DEF)), where REPLACEMENT is a string.

Examples:

  (rbon-define-key 'another-mode '(normal visual emacs)
    '(\"SPC a\" (\"name of function\" . myfun1)))

  (rbon-define-key 'global 'normal
    '(\"k\" (\"make stuff\" . myfun1))
    '(\"j\" (\"do the thing\" . myfun2)))"
  (if (eq mode 'global)
      (mapcar (apply-partially 'rbon--global-set-key state) bindings)
    (add-hook
     (intern (concat (symbol-name mode) "-hook"))
     (apply-partially 'rbon--local-set-key state bindings))))

(defun rbon-haskell-interactive-mode-kill-whole-line ()
  (interactive)
  (call-interactively 'evil-append-line)
  (call-interactively 'haskell-interactive-mode-kill-whole-line)
  (evil-normal-state))

(defun rbon-haskell-interactive-mode-history-previous ()
  "Wraps `haskell-interactive-mode-history-previous' to work with evil."
  (interactive)
  (call-interactively 'evil-append-line)
  (call-interactively 'haskell-interactive-mode-history-previous)
  (evil-normal-state))

(defun rbon-haskell-interactive-mode-history-next ()
  "Wraps `haskell-interactive-mode-history-next' to work with evil."
  (interactive)
  (call-interactively 'evil-append-line)
  (call-interactively 'haskell-interactive-mode-history-next)
  (evil-normal-state))

(defun rbon-insert-heading-respect-content ()
  "Insert a heading and then change to insert state."
  (interactive)
  (org-insert-heading-respect-content)
  (evil-append 0))

(defun rbon-escape ()
  "Get rid of extra cursors while also normally escaping."
  (interactive)
  (evil-mc-undo-all-cursors)
  (evil-force-normal-state))

(defun rbon-add-cursor-move-down ()
  "Add a cursor, and then move down one line."
  (interactive)
  (evil-mc-make-cursor-here) 
  (evil-mc-pause-cursors) 
  (next-line)
  (evil-mc-resume-cursors))

(defun rbon-add-cursor-move-up ()
  "Add a cursor, and then move up one line."
  (interactive)
  (evil-mc-make-cursor-here) 
  (evil-mc-pause-cursors) 
  (previous-line)
  (evil-mc-resume-cursors))

(defun rbon-evil-mc-make-cursor-in-visual-selection-beg ()
  (interactive)
  (call-interactively 'evil-mc-make-cursor-in-visual-selection-beg)
  (call-interactively 'evil-force-normal-state)
  (call-interactively 'evil-next-visual-line)
  ;(call-interactively 'evil-insert-line))
  )

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

(defun run-code ()
  (interactive)
  (haskell-process-load-file)
  (other-window 1)
  (evil-append-line 1))

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
