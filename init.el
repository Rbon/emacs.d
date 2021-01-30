(defun load-user-file (filename)
  "Load a file in current user's configuration directory"
  (interactive "f")
  (unless (file-exists-p (expand-file-name filename user-emacs-directory))
    (write-region "" nil filename))
  (load-file (expand-file-name filename user-emacs-directory)))  

(defun bootstrap ()
  "Run this command on a fresh install to pull down packages and load user configs."
  (interactive)
  (load-user-file "packages.el")
  (sync-all-packages)
  (load-user-file "misc.el")
  (load-user-file "keybinds.el"))

(if (file-directory-p (expand-file-name "elpa" user-emacs-directory))
  (progn 
    (load-user-file "packages.el")
    (load-user-file "misc.el")
    (load-user-file "keybinds.el")))
(put 'narrow-to-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(mini-modeline eyebrowse magit smex exec-path-from-shell solarized-theme lua-mode lsp-haskell lsp-mode hasklig-mode haskell-mode markdown-mode which-key flycheck undo-tree evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
