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
