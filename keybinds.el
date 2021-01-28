(evil-define-key '(normal emacs) 'global
  (kbd "SPC SPC")   '("run a command" . smex)
  (kbd "SPC TAB")   '("open last buffer" . my-switch-to-buffer)
  (kbd "SPC DEL")   '("go to last location" . pop-global-mark)
  (kbd "SPC f")     '("files")
  (kbd "SPC f f")   '("find a file" . find-file)
  (kbd "SPC f s")   '("save this file" . save-buffer)
  (kbd "SPC f r")   '("recent files" . recentf-open-files)
  (kbd "SPC f b")   '("open file browser" . magit-dired-jump)
  (kbd "SPC f r")   '("recent files" . recentf-open-files)
  (kbd "SPC f c")   '("open a user config file" . find-config-file)
  (kbd "SPC b")     '("buffers")
  (kbd "SPC b s")   '("save this buffer" . save-buffer)
  (kbd "SPC b c")   '("close this buffer" . kill-this-buffer)
  (kbd "SPC b k")   '("kill this buffer" . kill-this-buffer)
  (kbd "SPC b b")   '("open the buffer list" . buffer-menu)
  (kbd "SPC b TAB") '("open last buffer" . my-switch-to-buffer)
  (kbd "SPC b e")   '("eval this buffer" . eval-buffer)
  (kbd "SPC n")     '("narrow")
  (kbd "SPC n s")   '("narrow to selection" . narrow-to-region)
  (kbd "SPC n w")   '("widen" . widen)
  (kbd "SPC s")     '("selection")
  (kbd "SPC s n")   '("narrow to selection" . narrow-to-region)
  (kbd "SPC h f")   '("describe a function" . describe-function)
  (kbd "SPC h k")   '("describe a key" . describe-key)
  (kbd "SPC h v")   '("describe a variable" . describe-variable)
  (kbd "SPC h b")   '("list current key bindings" . describe-bindings)
  (kbd "SPC q")     '("quit")
  (kbd "SPC q q")   '("quit emacs" . save-buffers-kill-terminal)
  (kbd "SPC h S")   '("search everything" . apropos)
  (kbd "SPC h C")   '("search commands" . apropos-command)
  (kbd "SPC h D")   '("search documentation" . apropos-documentation)
  (kbd "SPC h V")   '("search variable" . apropos-variable)
  (kbd "SPC w")     '("window")
  (kbd "SPC w c")   '("close this window" . delete-window)
  (kbd "SPC w f")   '("fullscreen this window" . delete-other-windows)
  (kbd "SPC w H")   '("split this window horizontally" . split-h-and-change-focus)
  (kbd "SPC w V")   '("split this window vertically" . split-window-vertically)
  (kbd "SPC w h")   '("move window focus left" . windmove-left)
  (kbd "SPC w l")   '("move window focus right" . windmove-right)
  (kbd "SPC w k")   '("move window focus up" . windmove-up)
  (kbd "SPC w j")   '("move window focus down" . windmove-down)
  (kbd "SPC j")     '("jump")
  (kbd "SPC j d")   '("jump to definition" . lsp-find-definition)
  (kbd "SPC o")     '("org mode")
  (kbd "SPC o a")   '("open the agenda" . org-agenda)
  )

(evil-define-key 'insert 'global (kbd "TAB") 'dabbrev-expand) ; tab completion in insert mode

; help mode
(evil-set-initial-state 'help-mode 'normal)
(evil-define-key 'normal help-mode-map
  (kbd "q") 'quit-window
  )

; org-mode
(evil-define-key 'normal org-mode-map
  (kbd "SPC n t") '("narrow to subtree" . org-narrow-to-subtree)
  (kbd "SPC s b") '("make bold" . make-bold)
  (kbd "SPC s b") '("make bold" . make-bold)
  (kbd "SPC o s") '("scedule a task" . org-schedule)
  (kbd "SPC o d") '("set a deadline" . org-deadline)
  )
  
(if (eq system-type 'darwin)
    (evil-define-key 'normal org-mode-map
      (kbd "s-i") '("make italic" . make-italic)
      (kbd "s-b") '("make bold" . make-bold)
      (kbd "<s-return>")  'org-insert-heading-respect-content
      )
    (evil-define-key 'normal org-mode-map
      (kbd "C-i") '("make italic" . make-italic)
      (kbd "C-b") '("make bold" . make-bold)
      )
  )

; lsp-mode (doesn't work?)
(evil-define-key 'normal lsp-mode-map
  (kbd "SPC b f") '("format this buffer" . lsp-format-buffer)
  (kbd "SPC s f") '("format selection" . lsp-format-region)
  (kbd "SPC h s") '("describe this session" . lsp-describe-session)
  (kbd "SPC h t") '("describe thing at point" . lsp-describe-thing-at-point)
  )

; buffer menu
(evil-define-key 'motion Buffer-menu-mode-map
  (kbd "RET") 'Buffer-menu-1-window ; rebound this because default behavior breaks my-switch-to-last-buffer
  (kbd "l") 'Buffer-menu-1-window
  )

; recentf-dialog-mode
(evil-define-key 'normal recentf-dialog-mode-map
  (kbd "l") 'widget-button-press
  (kbd "h") 'nop
  (kbd "q") 'recentf-cancel-dialog
  )

; org-agenda stuff
(evil-define-key 'emacs org-agenda-mode-map
  (kbd "j") 'org-agenda-next-line
  (kbd "k") 'org-agenda-previous-line
  (kbd "l") 'org-agenda-later
  (kbd "h") 'org-agenda-earlier
  )

; dired stuff
(evil-set-initial-state 'dired-mode 'emacs) ; needed because normal mode bleeds into other buffers
(evil-define-key 'emacs 'dired-mode-map
  (kbd "h") 'dired-up-directory
  (kbd "j") 'dired-next-line
  (kbd "k") 'dired-previous-line
  (kbd "l") 'dired-find-file
  (kbd "/") 'evil-search-forward
  (kbd "t") 'touch-file
  )

; haskell-interactive
; (evil-set-initial-state 'haskell-interactive-mode 'emacs)
; (general-define-key
  ; :states '(emacs)
  ; :keymaps 'haskell-interactive-mode-map
  ; "j" 'haskell-interactive-mode-history-next
  ; "k" 'haskell-interactive-mode-history-previous
  ; "i" 'evil-insert-state
  ; )

; (general-define-key
  ; :states '(insert)
  ; :keymaps 'haskell-interactive-mode-map
  ; "<ESC>" 'evil-emacs-state
  ; )
; 
  ; )
; (general-define-key
  ; :states '(normal motion emacs insert)
  ; :keymaps 'org-mode-map
  ; "C-b"   '(make-bold            :wk "make bold")
  ; )
; )
; (my-leader-def
  ; :states '(normal motion emacs)
  ; :keymaps 'dired-mode-map
  ; :prefix "SPC"
  ; "."     '(:ignore t                          :wk "dired")
  ; ". f"   '(dired-create-empty-file            :wk "find definition")
  ; )
