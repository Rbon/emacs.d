; (defun foo (leader &rest args)
;   (dolist (a args)
;     (let ((key (concat leader " " (nth 0 a)))
;           (desc (nth 1 a))
;           (f (nth 2 a)))
;       ; (evil-define-key 'normal 'global key f))
;       (progn
;         (define-key evil-normal-state-map (kbd key) f)
;         (which-key-add-keymap-based-replacements evil-normal-state-map
;           key desc)
;         )
;       )
;     )
;   ;; or
;   ;; "f" "foo" (see the docstring))
;   )

(defun rbon/define-key (state keymap key &rest bindings)
  (evil-define-key fdfdfd keymap (kbd key) bindings))

(rbon/define-key 'normal 'global
                 "SPC i" '("do a thing" . baz)
                 )

(defun bar () (interactive) (message "wow"))
(defun baz () (interactive) (message "baz"))

; (define-prefix-command 'bar-map)
; (foo "SPC"
;      '("p" "do a bar" bar-map)
;      '("p i" "do a baz" baz)
;      )

(evil-define-key '(normal visual motion emacs) 'global (kbd "<escape>") 'rbon/escape)

(evil-define-key '(visual) 'global
  (kbd "I")   'evil-mc-make-cursor-in-visual-selection-beg
  (kbd "A")   'evil-mc-make-cursor-in-visual-selection-end
  )

; cursor shortcuts
(evil-define-key '(normal) 'global
  (kbd "J") 'rbon/add-cursor-move-down
  (kbd "K") 'rbon/add-cursor-move-up
  (kbd "N") 'evil-mc-make-and-goto-next-match
  (kbd "M") 'evil-mc-make-all-cursors
  )

(evil-define-key '(normal visual emacs) 'global
  (kbd "SPC SPC")        '("run a command" . smex)
  (kbd "SPC DEL")        '("go to last location" . pop-global-mark)
  (kbd "SPC f")          '("files")
  (kbd "SPC f f")        '("find a file" . find-file)
  (kbd "SPC f s")        '("save this file" . save-buffer)
  (kbd "SPC f r")        '("recent files" . recentf-open-files)
  (kbd "SPC f b")        '("open file browser" . magit-dired-jump)
  (kbd "SPC f r")        '("recent files" . recentf-open-files)
  (kbd "SPC f c")        '("open a user config file" . find-config-file)
  (kbd "SPC b")          '("buffers")
  (kbd "SPC b s")        '("save this buffer" . save-buffer)
  (kbd "SPC b c")        '("close this buffer" . kill-this-buffer)
  (kbd "SPC b k")        '("kill this buffer" . kill-this-buffer)
  (kbd "SPC b b")        '("open the buffer list" . buffer-menu)
  (kbd "SPC b TAB")      '("open last buffer" . my-switch-to-buffer)
  (kbd "SPC b e")        '("eval this buffer" . eval-buffer)
  (kbd "SPC n")          '("narrow")
  (kbd "SPC n s")        '("narrow to selection" . narrow-to-region)
  (kbd "SPC n w")        '("widen" . widen)
  (kbd "SPC s")          '("selection")
  (kbd "SPC s a")        '("select everything" . mark-whole-buffer)
  (kbd "SPC c")          '("cursors")
  (kbd "SPC c a")        '("add all matches" . evil-mc-make-all-cursors) 
  (kbd "SPC c <escape>") '("remove all extra cursors" . evil-mc-undo-all-cursors) 
  (kbd "SPC c j")        '("add and go down a line" . rbon/add-cursor-next-line)
  (kbd "SPC c u")        '("undo last cursor" . evil-mc-undo-last-added-cursor) 
  (kbd "SPC c n")        '("add next match" . evil-mc-make-and-goto-next-match) 
  (kbd "SPC c I")        '("do thing" . "I")
; (kbd "SPC c ?")        'evil-mc-make-and-goto-prev-match
; (kbd "SPC c ?")        'evil-mc-skip-and-goto-next-match
; (kbd "SPC c ?")        'evil-mc-skip-and-goto-prev-match
; (kbd "SPC c ?")        'evil-mc-make-and-goto-prev-cursor
; (kbd "SPC c ?")        'evil-mc-make-and-goto-next-cursor
; (kbd "SPC c ?")        'evil-mc-skip-and-goto-prev-cursor
; (kbd "SPC c ?")        'evil-mc-skip-and-goto-next-cursor
; (kbd "SPC c ?")        'evil-mc-make-and-goto-first-cursor
; (kbd "SPC c ?")        'evil-mc-make-and-goto-last-cursor
; (kbd "SPC c ?")        'evil-mc-make-cursor-here
; (kbd "SPC c ?")        'evil-mc-pause-cursors
; (kbd "SPC c ?")        'evil-mc-resume-cursors
; (kbd "SPC c I")        '("add start of lines" . evil-mc-make-cursor-in-visual-selection-beg) 
; (kbd "SPC c A")        '("add end of lines" . evil-mc-make-cursor-in-visual-selection-end) 
  (kbd "SPC h f")        '("describe a function" . describe-function)
  (kbd "SPC h k")        '("describe a key" . describe-key)
  (kbd "SPC h v")        '("describe a variable" . describe-variable)
  (kbd "SPC h m")        '("describe this mode" . describe-mode)
  (kbd "SPC h b")        '("list current key bindings" . describe-bindings)
  (kbd "SPC q")          '("quit")
  (kbd "SPC q q")        '("quit emacs" . save-buffers-kill-terminal)
  (kbd "SPC h S")        '("search everything" . apropos)
  (kbd "SPC h C")        '("search commands" . apropos-command)
  (kbd "SPC h D")        '("search documentation" . apropos-documentation)
  (kbd "SPC h V")        '("search variable" . apropos-variable)
  (kbd "SPC w")          '("window")
  (kbd "SPC w c")        '("close this window" . delete-window)
  (kbd "SPC w f")        '("fullscreen this window" . delete-other-windows)
  (kbd "SPC w H")        '("split this window horizontally" . split-h-and-change-focus)
  (kbd "SPC w V")        '("split this window vertically" . split-window-vertically)
  (kbd "SPC w h")        '("move window focus left" . windmove-left)
  (kbd "SPC w l")        '("move window focus right" . windmove-right)
  (kbd "SPC w k")        '("move window focus up" . windmove-up)
  (kbd "SPC w j")        '("move window focus down" . windmove-down)
  (kbd "SPC j")          '("jump")
  (kbd "SPC j d")        '("jump to definition" . lsp-find-definition)
  (kbd "SPC o")          '("org mode")
  (kbd "SPC o a")        '("open the agenda" . org-agenda)
  (kbd "SPC `")          '("workspace")
  (kbd "SPC TAB")        '("last used workspace" . eyebrowse-last-window-config)
  (kbd "SPC ` h")        '("previous workspace" . eyebrowse-prev-window-config)
  (kbd "SPC ` l")        '("next workspace" . eyebrowse-next-window-config)
  (kbd "SPC ` TAB")      '("last used workspace" . eyebrowse-last-window-config)
  (kbd "SPC ` c")        '("close workspace" . eyebrowse-close-window-config)
  (kbd "SPC ` r")        '("rename workspace" . eyebrowse-rename-window-config)
  (kbd "SPC ` s")        '("switch to workspace..." . eyebrowse-switch-to-window-config)
  (kbd "SPC ` 0")        '("switch to workspace 0" . eyebrowse-switch-to-window-config-0)
  (kbd "SPC ` 1")        '("switch to workspace 1" . eyebrowse-switch-to-window-config-1)
  (kbd "SPC ` 2")        '("switch to workspace 2" . eyebrowse-switch-to-window-config-2)
  (kbd "SPC ` 3")        '("switch to workspace 3" . eyebrowse-switch-to-window-config-3)
  (kbd "SPC ` 4")        '("switch to workspace 4" . eyebrowse-switch-to-window-config-4)
  (kbd "SPC ` 5")        '("switch to workspace 5" . eyebrowse-switch-to-window-config-5)
  (kbd "SPC ` 6")        '("switch to workspace 6" . eyebrowse-switch-to-window-config-6)
  (kbd "SPC ` 7")        '("switch to workspace 7" . eyebrowse-switch-to-window-config-7)
  (kbd "SPC ` 8")        '("switch to workspace 8" . eyebrowse-switch-to-window-config-8)
  (kbd "SPC ` 9")        '("switch to workspace 9" . eyebrowse-switch-to-window-config-9)
  (kbd "SPC ` n")        '("new workspace" . eyebrowse-create-window-config)
  )

(evil-define-key 'insert 'global (kbd "TAB") 'dabbrev-expand) ; tab completion in insert mode

(evil-set-initial-state 'help-mode 'normal)
(defun rbon/help-bindings ()
  (evil-local-set-key 'normal (kbd "q") 'quit-window)
  )
(add-hook 'help-mode-hook 'rbon/help-bindings)

(defun rbon/org-bindings ()
  (evil-local-set-key 'normal (kbd "SPC n t") '("narrow to subtree" . org-narrow-to-subtree))
  (evil-local-set-key 'normal (kbd "SPC s b") '("make bold" . make-bold))
  (evil-local-set-key 'normal (kbd "SPC s b") '("make bold" . make-bold))
  (evil-local-set-key 'normal (kbd "SPC o s") '("scedule a task" . org-schedule))
  (evil-local-set-key 'normal (kbd "SPC o d") '("set a deadline" . org-deadline))

  (if (eq system-type 'darwin) ; macOS
      (progn
        (evil-local-set-key 'normal (kbd "s-i") '("make italic" . make-italic))
        (evil-local-set-key 'normal (kbd "s-b") '("make bold" . make-bold))
        (evil-local-set-key 'normal (kbd "<s-return>")  'rbon/insert-heading-respect-content)
        )
    (progn
      (evil-local-set-key 'normal (kbd "C-i") '("make italic" . make-italic))
      (evil-local-set-key 'normal (kbd "C-b") '("make bold" . make-bold))
      (evil-local-set-key 'normal (kbd "<C-return>")  'rbon/insert-heading-respect-content)
      )))
(add-hook 'org-mode-hook 'rbon/org-bindings)

(defun rbon/lsp-bindings ()
  (evil-local-set-key 'normal (kbd "SPC b f") '("format this buffer" . lsp-format-buffer))
  (evil-local-set-key 'normal (kbd "SPC s f") '("format selection" . lsp-format-region))
  (evil-local-set-key 'normal (kbd "SPC h s") '("describe this session" . lsp-describe-session))
  (evil-local-set-key 'normal (kbd "SPC h t") '("describe thing at point" . lsp-describe-thing-at-point))
  )
(add-hook 'lsp-mode-hook 'rbon/lsp-bindings)

; FIX LATER
; (evil-set-initial-state 'Buffer-menu-mode 'motion) ; set to motion because normal state is wierd in this mode
; (defun rbon/buffer-menu-bindings ()
  ; (evil-local-set-key 'motion (kbd "l") 'Buffer-menu-1-window)
  ; )
;  add-hook 'recentf-Buffer-menu-mode-hook 'rbon/Buffer-menu-bindings)

(defun rbon/recentf-dialog-bindings ()
  (evil-local-set-key 'normal (kbd "l") 'widget-button-press)
  (evil-local-set-key 'normal (kbd "h") 'nop)
  (evil-local-set-key 'normal (kbd "q") 'recentf-cancel-dialog)
  )
(add-hook 'recentf-dialog-mode-hook 'rbon/recentf-dialog-bindings)

(defun rbon/org-agenda-bindings ()
  (evil-local-set-key 'normal (kbd "j") 'org-agenda-next-line)
  (evil-local-set-key 'normal (kbd "k") 'org-agenda-previous-line)
  (evil-local-set-key 'normal (kbd "l") 'org-agenda-later)
  (evil-local-set-key 'normal (kbd "h") 'org-agenda-earlier)
  )
(add-hook 'org-agenda-mode-hook 'rbon/org-agenda-bindings)

(defun rbon/dired-bindings ()
  (evil-local-set-key 'normal (kbd "h") 'dired-up-directory)
  (evil-local-set-key 'normal (kbd "j") 'dired-next-line)
  (evil-local-set-key 'normal (kbd "k") 'dired-previous-line)
  (evil-local-set-key 'normal (kbd "l") 'dired-find-file)
  (evil-local-set-key 'normal (kbd "/") 'evil-search-forward)
  (evil-local-set-key 'normal (kbd "t") 'touch-file)
  )
(add-hook 'dired-mode-hook 'rbon/dired-bindings)

(evil-set-initial-state 'apropos-mode 'normal)
(defun rbon/apropos-bindings ()
  (evil-local-set-key 'normal (kbd "q") 'quit-window)
  )
(add-hook 'apropos-mode-hook 'rbon/apropos-bindings)

(defun rbon/haskell-bindings ()
  (evil-local-set-key 'normal (kbd "SPC b l") '("load this buffer" . run-code))
  )
(add-hook 'haskell-mode-hook 'rbon/haskell-bindings)

(defun rbon/haskell-interactive-bindings ()
  (evil-local-set-key 'insert (kbd "TAB") 'haskell-interactive-mode-tab)
  (evil-local-set-key 'insert (kbd "SPC") 'haskell-interactive-mode-space)
  (evil-local-set-key 'normal (kbd "J") 'rbon/haskell-interactive-mode-history-next)
  (evil-local-set-key 'normal (kbd "K") 'rbon/haskell-interactive-mode-history-previous)
  (evil-local-set-key 'normal (kbd "<S-backspace>") 'rbon/haskell-interactive-mode-kill-whole-line)
  )
(add-hook 'haskell-interactive-mode-hook 'rbon/haskell-interactive-bindings)

(defun rbon/haskell-error-bindings ()
  (evil-local-set-key 'normal (kbd "q") 'quit-window)
  )
(add-hook 'haskell-error-mode-hook 'rbon/haskell-error-bindings)
