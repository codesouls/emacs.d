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

;; Initialise el-get {{{

  (require 'package)
  (package-initialize)

  ;(setq el-get-user-package-directory "~/.emacs.d/el-get-init-files/")
  (add-to-list 'load-path "~/.emacs.d/el-get/el-get")

  (unless (require 'el-get nil 'noerror)
    (with-current-buffer
      (url-retrieve-synchronously
        "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
      (let (el-get-master-branch)
        (goto-char (point-max))
        (eval-print-last-sexp))))

  ;; personal recipes
  (setq el-get-sources
        '((:name el-get :branch "master")))

  ;; my package
  (setq my-packages
        (append
          '(el-get
            org-mode
            autopair
            yasnippet
            auto-complete
            markdown-mode
            solarized-theme
            slim-mode
            web-mode
            sass-mode
            scss-mode
            js2-mode
            jshint-mode
            coffee-mode
            ruby-mode
            inf-ruby
            ruby-compilation
            rhtml-mode
            yaml-mode
            ruby-end
            rinari)

         (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

  (el-get 'sync my-packages)

  ;; my packages setting
  (load "plugin")
;; }}}
