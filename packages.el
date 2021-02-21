(setq my-packages '(
  evil
  undo-tree
  flycheck
  which-key
  ; general
  ;smooth-scrolling-mode
  helm
  helm-descbinds
  markdown-mode
  haskell-mode
  hasklig-mode
  lsp-mode
  ; lsp-ui
  lsp-haskell
  lua-mode
  solarized-theme
  exec-path-from-shell ; fix path on macos
  smex ; better than M-x
  magit
  eyebrowse ; because tab-bar-mode doesn't work on mac
  ;powerline
  mini-modeline ; put the modeline in the minibuffer added benefit of only having one modeline
  ; multiple-cursors
  evil-mc ; multiple cursors
  evil-surround
  autothemer
 ))

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(defun sync-package (pac)
  (unless (package-installed-p pac)
    (package-install pac)))

(defun sync-all-packages ()
  (interactive)
  (package-refresh-contents)
  (mapcar 'sync-package my-packages))

(defun set-custom-file-path (path)
  (unless (file-exists-p path)
    (write-region "" nil path))
  (setq custom-file path)
  (load custom-file))
