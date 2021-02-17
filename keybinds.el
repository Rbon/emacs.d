(rbon-define-key 'global '(normal visual motion emacs)
  '("<escape>" rbon-escape))

(rbon-define-key 'global 'visual
  '("I" evil-mc-make-cursor-in-visual-selection-beg)
  '("A" evil-mc-make-cursor-in-visual-selection-end))

; cursor shortcuts
(rbon-define-key 'global 'normal
  '("J" rbon-add-cursor-move-down)
  '("K" rbon-add-cursor-move-up)
  '("N" evil-mc-make-and-goto-next-match)
  '("M" evil-mc-make-all-cursors))

(rbon-define-key 'global '(normal visual emacs)
  '("SPC SPC"        ("run a command" . smex))
  '("SPC DEL"        ("go to last location" . pop-global-mark))
  '("SPC a"          ("applications"))
  '("SPC a d"        dired)
  '("SPC a m"        magit)
  '("SPC f"          ("files"))
  '("SPC f f"        ("find a file" . find-file))
  '("SPC f s"        ("save this file" . save-buffer))
  '("SPC f r"        ("recent files" . recentf-open-files))
  '("SPC f b"        ("open file browser" . magit-dired-jump))
  '("SPC f r"        ("recent files" . recentf-open-files))
  '("SPC f c"        ("open a user config file" . find-config-file))
  '("SPC F"          ("frame"))
  '("SPC F c"        ("center this frame" . rbon-center-frame))
  '("SPC b"          ("buffers"))
  '("SPC b s"        ("save this buffer" . save-buffer))
  '("SPC b c"        ("close this buffer" . kill-this-buffer))
  '("SPC b k"        ("kill this buffer" . kill-this-buffer))
  '("SPC b b"        ("open the buffer list" . buffer-menu))
  '("SPC b TAB"      ("open last buffer" . my-switch-to-buffer))
  '("SPC b e"        ("eval this buffer" . eval-buffer))
  '("SPC n"          ("narrow"))
  '("SPC n s"        ("narrow to selection" . narrow-to-region))
  '("SPC n w"        ("widen" . widen))
  '("SPC s"          ("selection"))
  '("SPC s a"        ("select everything" . mark-whole-buffer))
  '("SPC c"          ("cursors"))
  '("SPC c a"        ("add all matches" . evil-mc-make-all-cursors))
  '("SPC c <escape>" ("remove all extra cursors" . evil-mc-undo-all-cursors))
  '("SPC c j"        ("add and go down a line" . rbon-add-cursor-next-line))
  '("SPC c u"        ("undo last cursor" . evil-mc-undo-last-added-cursor))
  '("SPC c n"        ("add next match" . evil-mc-make-and-goto-next-match))
  '("SPC c I"        ("do thing" . "I"))
  '("SPC h f"        ("describe a function" . describe-function))
  '("SPC h k"        ("describe a key" . describe-key))
  '("SPC h v"        ("describe a variable" . describe-variable))
  '("SPC h m"        ("describe this mode" . describe-mode))
  '("SPC h b"        ("list current key bindings" . describe-bindings))
  '("SPC q"          ("quit"))
  '("SPC q q"        ("quit emacs" . save-buffers-kill-terminal))
  '("SPC h S"        ("search everything" . apropos))
  '("SPC h C"        ("search commands" . apropos-command))
  '("SPC h D"        ("search documentation" . apropos-documentation))
  '("SPC h V"        ("search variable" . apropos-variable))
  '("SPC w"          ("window"))
  '("SPC w c"        ("close this window" . delete-window))
  '("SPC w f"        ("fullscreen this window" . delete-other-windows))
  '("SPC w H"        ("split this window horizontally" .
                      split-h-and-change-focus))
  '("SPC w V"        ("split this window vertically" . split-window-vertically))
  '("SPC w h"        ("move window focus left" . windmove-left))
  '("SPC w l"        ("move window focus right" . windmove-right))
  '("SPC w k"        ("move window focus up" . windmove-up))
  '("SPC w j"        ("move window focus down" . windmove-down))
  '("SPC j"          ("jump"))
  '("SPC j d"        ("jump to definition" . find-function))
  '("SPC o"          ("org mode"))
  '("SPC o a"        ("open the agenda" . org-agenda))
  '("SPC `"          ("workspace"))
  '("SPC TAB"        ("last used workspace" . eyebrowse-last-window-config))
  '("SPC ` h"        ("previous workspace" . eyebrowse-prev-window-config))
  '("SPC ` l"        ("next workspace" . eyebrowse-next-window-config))
  '("SPC ` TAB"      ("last used workspace" . eyebrowse-last-window-config))
  '("SPC ` c"        ("close workspace" . eyebrowse-close-window-config))
  '("SPC ` r"        ("rename workspace" . eyebrowse-rename-window-config))
  '("SPC ` s"        ("switch to workspace..." .
                      eyebrowse-switch-to-window-config))
  '("SPC ` 0"        ("switch to workspace 0" .
                      eyebrowse-switch-to-window-config-0))
  '("SPC 0"          ("switch to workspace 0" .
                      eyebrowse-switch-to-window-config-0))
  '("SPC ` 1"        ("switch to workspace 1" .
                      eyebrowse-switch-to-window-config-1))
  '("SPC 1"          ("switch to workspace 1" .
                      eyebrowse-switch-to-window-config-1))
  '("SPC ` 2"        ("switch to workspace 2" .
                      eyebrowse-switch-to-window-config-2))
  '("SPC 2"          ("switch to workspace 2" .
                      eyebrowse-switch-to-window-config-2))
  '("SPC ` 3"        ("switch to workspace 3" .
                      eyebrowse-switch-to-window-config-3))
  '("SPC 3"          ("switch to workspace 3" .
                      eyebrowse-switch-to-window-config-3))
  '("SPC ` 4"        ("switch to workspace 4" .
                      eyebrowse-switch-to-window-config-4))
  '("SPC 4"        ("switch to workspace 4" .
                      eyebrowse-switch-to-window-config-4))
  '("SPC ` 5"        ("switch to workspace 5" .
                      eyebrowse-switch-to-window-config-5))
  '("SPC 5"        ("switch to workspace 5" .
                      eyebrowse-switch-to-window-config-5))
  '("SPC ` 6"        ("switch to workspace 6" .
                      eyebrowse-switch-to-window-config-6))
  '("SPC 6"        ("switch to workspace 6" .
                      eyebrowse-switch-to-window-config-6))
  '("SPC ` 7"        ("switch to workspace 7" .
                      eyebrowse-switch-to-window-config-7))
  '("SPC 7"        ("switch to workspace 7" .
                      eyebrowse-switch-to-window-config-7))
  '("SPC ` 8"        ("switch to workspace 8" .
                      eyebrowse-switch-to-window-config-8))
  '("SPC 8"        ("switch to workspace 8" .
                      eyebrowse-switch-to-window-config-8))
  '("SPC ` 9"        ("switch to workspace 9" .
                      eyebrowse-switch-to-window-config-9))
  '("SPC 9"        ("switch to workspace 9" .
                      eyebrowse-switch-to-window-config-9))
  '("SPC ` n"        ("new workspace" . eyebrowse-create-window-config)))

(rbon-define-key 'global 'insert '("TAB" dabbrev-expand))
                                        ; tab completion in insert mode

(evil-set-initial-state 'help-mode 'normal)
(rbon-define-key 'help-mode 'normal '("q" quit-window))

(rbon-define-key 'org-mode 'normal
  '("SPC n t" ("narrow to subtree" . org-narrow-to-subtree))
  '("SPC s b" ("make bold" . make-bold))
  '("SPC s b" ("make bold" . make-bold))
  '("SPC o s" ("scedule a task" . org-schedule))
  '("SPC o d" ("set a deadline" . org-deadline))
  '("SPC RET" ("insert a heading" . rbon-insert-heading-respect-content)))

(if (eq system-type 'darwin) ; macOS
    (rbon-define-key 'org-mode 'normal
      '("s-i" ("make italic" . make-italic))
      '("s-b" ("make bold" . make-bold))
      '("<s-return>" rbon-insert-heading-respect-content))
    (rbon-define-key 'org-mode 'normal
      '("C-i" ("make italic" . make-italic))
      '("C-b" ("make bold" . make-bold))
      '("<C-return>"  rbon-insert-heading-respect-content)))
 
(rbon-define-key 'lsp-mode 'normal
  '("SPC b f" ("format this buffer" . lsp-format-buffer))
  '("SPC s f" ("format selection" . lsp-format-region))
  '("SPC h s" ("describe this session" . lsp-describe-session))
  '("SPC h t" ("describe thing at point" . lsp-describe-thing-at-point))
  '("SPC j d" ("jump to definition" . lsp-find-definition)))

; FIX LATER
; (evil-set-initial-state 'Buffer-menu-mode 'motion) ; set to motion because normal state is wierd in this mode
; (defun rbon-buffer-menu-bindings ()
  ; (evil-local-set-key 'motion (kbd "l") 'Buffer-menu-1-window)
  ; )
;  add-hook 'recentf-Buffer-menu-mode-hook 'rbon-Buffer-menu-bindings)

(rbon-define-key 'recentf-dialog-mode 'normal
  '("l" widget-button-press)
  '("h" nop)
  '("q" recentf-cancel-dialog))

(rbon-define-key 'org-agenda-mode 'normal
  '("j" org-agenda-next-line)
  '("k" org-agenda-previous-line)
  '("l" org-agenda-later)
  '("h" org-agenda-earlier))

(rbon-define-key 'dired-mode 'normal
  '("h" dired-up-directory)
  '("j" dired-next-line)
  '("k" dired-previous-line)
  '("l" dired-find-file)
  '("/" evil-search-forward)
  '("t" touch-file))

(rbon-define-key 'apropos-mode 'normal '("q" quit-window))

(rbon-define-key 'haskell-mode 'normal
  '("SPC b l" ("load this buffer" . run-code)))

(rbon-define-key 'haskell-interactive-mode 'insert
  '("TAB" haskell-interactive-mode-tab)
  '("SPC" haskell-interactive-mode-space))

(rbon-define-key 'haskell-interactive-mode 'normal
  '("J" rbon-haskell-interactive-mode-history-next)
  '("K" rbon-haskell-interactive-mode-history-previous)
  '("<S-backspace>" rbon-haskell-interactive-mode-kill-whole-line)
  '("RET" haskell-interactive-mode-return))

(rbon-define-key 'haskell-error-mode 'normal '("q" quit-window))

(rbon-define-key 'with-editor-mode 'normal
  '("SPC q f" with-editor-finish)
  '("SPC q c" with-editor-cancel))

(rbon-define-key 'magit-mode 'emacs
  '("J"        magit-status-jump)
  '("j"        magit-next-line)
  '("k"        magit-previous-line)
  '("H"        magit-discard)
  '("<escape>" transient-quit-one))
