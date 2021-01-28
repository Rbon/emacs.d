; (general-def :states '(normal motion emacs) "SPC" nil) ; unbind SPC
; (general-def :states '(insert) "TAB" 'dabbrev-expand) ; tab completion in insert mode

(evil-define-key 'normal 'global
  (kbd "SPC SPC")   '("run a command" . smex)
  (kbd "SPC TAB")   '("open last buffer" . my-switch-to-buffer)
  (kbd "SPC DEL")   '("go to last location" . pop-global-mark)
  (kbd "SPC f")     '("files")
  (kbd "SPC f f")   '("find a file" . find-file)
  (kbd "SPC f s")   '("save this file" . save-buffer)
  (kbd "SPC f r")   '("recent files" . recentf-open-files)
  (kbd "SPC f b")   '("open file browser" . dired-jump)
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
  (kbd "SPC h")     '("help")
  (kbd "SPC h f")   '("describe a function" . describe-function)
  (kbd "SPC h k")   '("describe a key" . describe-key)
  (kbd "SPC h v")   '("describe a variable" . describe-variable)
  (kbd "SPC h b")   '("list current key bindings" . describe-bindings)
  (kbd "SPC o")     '("org mode")
  (kbd "SPC o s")   '("scedule a task" . org-schedul)
  (kbd "SPC q q")   '("quit emacs" . save-buffers-kill-terminal)
  ; "o d"   '(org-deadline                       :wk "set a deadline")
  ; "o a"   '(org-agenda                         :wk "open the agenda")
  )

; org-mode
(evil-define-key 'normal org-mode-map
  (kbd "SPC n t") '("narrow to subtree" . org-narrow-to-subtree)
  (kbd "SPC s b") '("make bold" . make-bold)
  (kbd "SPC s b") '("make bold" . make-bold)
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
; ;; org-mode
; (general-define-key
  ; :states '(normal motion emacs insert)
  ; :keymaps 'org-mode-map
  ; "s-b"   '(make-bold            :wk "make bold")

; lsp-mode (doesn't work?)
(evil-define-key 'normal lsp-mode-map
  (kbd "SPC b f") '("format this buffer" . lsp-format-buffer)
  (kbd "SPC s f") '("format selection" . lsp-format-region)
  )

(evil-define-key 'motion Buffer-menu-mode-map
  (kbd "RET") 'Buffer-menu-1-window ; rebound this because default behavior breaks my-switch-to-last-buffer
  (kbd "l") 'Buffer-menu-1-window
  )

; THIS WILL BLEED INTO OTHER MODES WHYYYYYY
;(evil-define-key 'normal recentf-mode-map
;  (kbd "l") 'widget-button-press
;  (kbd "q") 'recentf-cancel-dialog
; )
  ; "r"     '(:ignore t                          :wk "REPL")
  ; "r r"   '(haskell-process-restart            :wk "restart REPL")
  ; "b l"   '(run-code                           :wk "load buffer in REPL")
  ; "l"     '(:ignore t                          :wk "LSP")
  ; "l f"   '(:ignore t                          :wk "format this buffer")
  ; ; "l f r" '(lsp-format-region                  :wk "format this buffer")
  ; "l f b" '(lsp-format-buffer                  :wk "format this buffer")
  ; ; "h r"   '(lsp-find-references                :wk "find references")
  ; "h s"   '(lsp-describe-session               :wk "describe this session")
  ; "h t"   '(lsp-describe-thing-at-point        :wk "describe thing at point")
  ; "h S"   '(apropos                            :wk "search everything")
  ; "h C"   '(apropos-command                    :wk "search commands")
  ; "h D"   '(apropos-documentation              :wk "search documentation")
  ; "h V"   '(apropos-variable                   :wk "search variable")
  ; "j"     '(:ignore t                          :wk "jump")
  ; "j d"   '(lsp-find-definition                :wk "jump to definition")
  ; "e b"   '(eval-buffer                        :wk "eval this buffer")
  ; "e c"   '(load-init                          :wk "eval all user configs")
  ; "f"     '(:ignore t                          :wk "files")
  ; "w"     '(:ignore t                          :wk "windows")
  ; "w c"   '(delete-window                      :wk "close this window")
  ; "w f"   '(delete-other-windows               :wk "fullscreen this window")
  ; "w H"   '(split-h-and-change-focus           :wk "split this window horizontally")
  ; "w V"   '(split-window-vertically            :wk "split this window vertically")
  ; "w h"   '(windmove-left                      :wk "move window focus left")
  ; "w l"   '(windmove-right                     :wk "move window focus right")
  ; "w k"   '(windmove-up                        :wk "move window focus up")
  ; "w j"   '(windmove-down                      :wk "move window focus down")
  ; "q"     '(:ignore t                          :wk "quit")
  ; "q q"   '(save-buffers-kill-terminal         :wk "quit emacs")

; org-agenda stuff
; (general-define-key
  ; :keymaps 'org-agenda-mode-map
  ; "j" 'org-agenda-next-line
  ; "k" 'org-agenda-previous-line
  ; "l" 'org-agenda-later
  ; "h" 'org-agenda-earlier
  ; )

; ; dired stuff
; (evil-set-initial-state 'dired-mode 'emacs)
; (general-define-key
 ; :keymaps 'dired-mode-map
  ; "h" 'dired-up-directory
  ; "j" 'dired-next-line
  ; "k" 'dired-previous-line
  ; "l" 'dired-find-file
  ; "/" 'evil-search-forward
  ; "t" 'touch-file
  ; )



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


; (evil-set-initial-state 'error-mode 'emacs)

; (my-leader-def
  ; :states '(normal motion emacs)
  ; :prefix "SPC"
  ; ; :keymaps 'override
  ; ; "SPC"   '(execute-extended-command           :wk "run a command")
  ; "SPC"   '(smex                               :wk "run a command")
  ; "TAB"   '(my-switch-to-buffer                :wk "open last buffer")
  ; "DEL"   '(pop-global-mark                    :wk "go to last location")
  ; "n"     '(:ignore t                          :wk "narrow to...")
  ; "n w"   '(widen                              :wk "widen")
  ; "n s"   '(org-narrow-to-subtree              :wk "narrow to subtree")
  ; "s"     '(:ignore t                          :wk "selection")
  ; "s f"   '(lsp-format-region                  :wk "format selection")
  ; "r"     '(:ignore t                          :wk "REPL")
  ; "r r"   '(haskell-process-restart            :wk "restart REPL")
  ; "b l"   '(run-code                           :wk "load buffer in REPL")
  ; "l"     '(:ignore t                          :wk "LSP")
  ; "l f"   '(:ignore t                          :wk "format this buffer")
  ; ; "l f r" '(lsp-format-region                  :wk "format this buffer")
  ; "l f b" '(lsp-format-buffer                  :wk "format this buffer")
  ; "h"     '(:ignore t                          :wk "help")
  ; "h f"   '(describe-function                  :wk "describe a function")
  ; "h k"   '(describe-key                       :wk "describe a key")
  ; "h v"   '(describe-variable                  :wk "describe a variable")
  ; "h b"   '(describe-bindings                  :wk "list current key bindings")
  ; ; "h r"   '(lsp-find-references                :wk "find references")
  ; "h s"   '(lsp-describe-session               :wk "describe this session")
  ; "h t"   '(lsp-describe-thing-at-point        :wk "describe thing at point")
  ; "h S"   '(apropos                            :wk "search everything")
  ; "h C"   '(apropos-command                    :wk "search commands")
  ; "h D"   '(apropos-documentation              :wk "search documentation")
  ; "h V"   '(apropos-variable                   :wk "search variable")
  ; "j"     '(:ignore t                          :wk "jump")
  ; "j d"   '(lsp-find-definition                :wk "jump to definition")
  ; "e b"   '(eval-buffer                        :wk "eval this buffer")
  ; "e c"   '(load-init                          :wk "eval all user configs")
  ; "f"     '(:ignore t                          :wk "files")
  ; "f f"   '(find-file                          :wk "find a file")
  ; "f s"   '(save-buffer                        :wk "save this file")
  ; "f r"   '(recentf-open-files                 :wk "recent files")
  ; "f b"   '(dired-jump                         :wk "open file browser")
  ; "b"     '(:ignore t                          :wk "buffers")
  ; "b s"   '(save-buffer                        :wk "save this buffer")
  ; "b c"   '(kill-this-buffer                   :wk "close this buffer")
  ; "b k"   '(kill-this-buffer                   :wk "kill this buffer")
  ; "b b"   '(buffer-menu                        :wk "open the buffer list")
  ; "b f"   '(lsp-format-buffer                  :wk "format this buffer")
  ; "b TAB" '(my-switch-to-buffer                :wk "open last buffer")
  ; "o"     '(:ignore t                          :wk "open / org")
  ; "o s"   '(org-schedule                       :wk "scedule a task")
  ; "o d"   '(org-deadline                       :wk "set a deadline")
  ; "o a"   '(org-agenda                         :wk "open the agenda")
  ; "o f"   '(find-file                          :wk "open a file")
  ; "o c"   '(find-config-file                   :wk "open a user config file")
  ; "w"     '(:ignore t                          :wk "windows")
  ; "w c"   '(delete-window                      :wk "close this window")
  ; "w f"   '(delete-other-windows               :wk "fullscreen this window")
  ; "w H"   '(split-h-and-change-focus           :wk "split this window horizontally")
  ; "w V"   '(split-window-vertically            :wk "split this window vertically")
  ; "w h"   '(windmove-left                      :wk "move window focus left")
  ; "w l"   '(windmove-right                     :wk "move window focus right")
  ; "w k"   '(windmove-up                        :wk "move window focus up")
  ; "w j"   '(windmove-down                      :wk "move window focus down")
  ; "q"     '(:ignore t                          :wk "quit")
  ; )
  
