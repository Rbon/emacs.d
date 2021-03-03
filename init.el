(defun goto-config ()
  "Open emacs.org."
  (interactive)
  (find-file "~/.emacs.d/emacs.org")
  (widen)
  (evil-goto-first-line)
  (evil-close-folds))

(defun load-user-file (filename)
  "Load a file in current user's configuration directory"
  (interactive "f")
  (unless (file-exists-p (expand-file-name filename user-emacs-directory))
    (write-region "" nil filename))
  (load-file (expand-file-name filename user-emacs-directory)))  

(defun rbon-load-evil ()
  (unless (package-installed-p 'evil)
    (package-install 'evil))
  (require 'evil)
  (evil-mode 1))

(defun bootstrap ()
  "Run this command on a fresh install to pull down packages and load user configs."
  (interactive)
  (org-babel-tangle-file "~/.emacs.d/keybinds.org")
  (rbon-load-evil)
  (load-user-file "packages.el")
  (sync-all-packages)
  (load-user-file "functions.el")
  (load-user-file "appearance.el")
  (load-user-file "misc.el")
  (load-user-file "keybinds.el"))

(defun rbon-load-config ()
  (interactive)
  (rbon-load-evil)
  ; (org-babel-tangle-file "~/.emacs.d/keybinds.org")
  (load-user-file "packages.el")
  (load-user-file "functions.el")
  (load-user-file "appearance.el")
  (load-user-file "misc.el")
  (load-user-file "keybinds.el"))

(if (file-directory-p (expand-file-name "elpa" user-emacs-directory))
    (rbon-load-config))
(put 'narrow-to-region 'disabled nil)

(eval-after-load "~/.dshdusdhsudh"
  (when window-system (rbon-center-frame)))
