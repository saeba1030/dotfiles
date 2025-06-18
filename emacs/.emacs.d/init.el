(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq make-backup-files nil)

(set-frame-font "JetBrains Mono NL 12" nil t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'tango-dark)

(global-display-line-numbers-mode t)

;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(package-refresh-contents)

;; Download Evil
;;(unless (package-installed-p 'evil)
;;  (package-install 'evil))

;; Enable Evil
;;(require 'evil)
;;(evil-mode 0)
