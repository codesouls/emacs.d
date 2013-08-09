;; ===========================================
;; FileName: .emacs.d
;; Author: Gao DaoJing (@fatteru)
;; Email: gaodaojing@gmail.com
;; Site: http://gaodaojing.com
;; Version: 1.0
;; ===========================================

(add-to-list 'load-path "~/.emacs.d")

;; Load setting {{{

  (add-to-list 'load-path "~/.emacs.d/conf")

  ;; basic
  (load "basic")
  ;; defun
  (load "defun")

;; }}}

;; Initialise melpa {{{

  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.milkbox.net/packages/") t)
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/") t)
  (package-initialize)

  ;; Work around MELPA server issues
  (setq url-http-attempt-keepalives nil)

  ;; Refreshing the MELPA repo
  (when (not package-archive-contents)
    (package-refresh-contents))

  ;; Making sure melpa.el is around for the other installations
  (unless (require 'melpa nil t)
    (package-install 'melpa)
    (require 'melpa))

  ;; Making sure my packages are installed
  (defvar my-packages '(autopair
                        yasnippet
                        auto-complete
                        markdown-mode
                        color-theme-solarized
                        powerline
                        slim-mode
                        css-mode
                        sass-mode
                        scss-mode
                        js2-mode
                        coffee-mode
                        ruby-mode
                        inf-ruby
                        ruby-compilation
                        rhtml-mode
                        yaml-mode
                        ruby-end)
    "A list of packages to ensure are installed at launch.")

  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p)))

  (add-to-list 'load-path "~/.emacs.d/melpa-init-files")
  (load "setup")

;;; }}}
