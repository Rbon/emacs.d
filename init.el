(setq straight-use-package-by-default t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq use-package-verbose t)
(setq use-package-always-defer t)

(setq gc-cons-threshold (* 100 1000 1000))

(defun load-user-file (filename)
  "Load a file in current user's configuration directory"
  (interactive "f")
  (unless (file-exists-p
           (expand-file-name filename user-emacs-directory))
    (write-region "" nil filename))
  (load-file (expand-file-name filename user-emacs-directory)))  

(defun bootstrap ()
  "Sync and load user configs."
  (interactive)
  (load-user-file "packages.el")
  ;; (sync-all-packages)
  (load-user-file "functions.el")
  (load-user-file "appearance.el")
  (load-user-file "misc.el")
  (load-user-file "keybinds.el"))

(bootstrap)
(put 'narrow-to-region 'disabled nil)

;; (defun goto-config ()
;; "Open emacs.org."
;; (interactive)
;; (find-file "~/.emacs.d/emacs.org")
;; (widen)
;; (evil-goto-first-line)
;; (evil-close-folds))

(defun rbon-center-frame ()
  "Move the current frame to the center of the display.
Why is this not a built-in function?"
  (interactive)
  (let ((h-offset (/ (- (display-pixel-width) (frame-native-width)) 2))
        (v-offset (/ (- (display-pixel-height) (frame-native-height)) 2)))
    (set-frame-position (selected-frame) h-offset v-offset)))
     (eval-after-load "~/.dshdusdhsudh"
       (when window-system (rbon-center-frame)))

;; Make gc pauses faster by decreasing the threshold.
(setq gc-cons-threshold (* 2 1000 1000))

(mapc 'load (file-expand-wildcards "~/.emacs.d/config/*.el"))
