;; ===========================================
;; FileName: .emacs.d
;; Author: Gao DaoJing (@fatteru)
;; Email: gaodaojing@gmail.com
;; Site: http://gaodaojing.com
;; Version: 1.0
;; ===========================================

(add-to-list 'load-path "~/.emacs.d")

;; Initialise el-get {{{
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
        '((:name el-get :branch "master")

    (:name magit
           :before (global-set-key (kbd "C-x C-z") 'magit-status))

    (:name expand-region
           :before (global-set-key (kbd "C-@") 'er/expand-region))

    (:name descbinds-anything
           :after (progn
        (descbinds-anything-install)
        (global-set-key (kbd "C-h b") 'descbinds-anything)))

    (:name goto-last-change
           :before (global-set-key (kbd "C-x C-/") 'goto-last-change))))

  ;; my package
  (setq el-get-packages
    '(el-get
      autopair
      org-mode
      auto-complete
      yasnippet
      markdown-mode
      color-theme
      color-theme-solarized))

  (el-get 'sync el-get-packages)
;; }}}

;; Load plugins setting {{{
  (add-to-list 'load-path "~/.emacs.d/conf")

  ;; custom setting
  (load "custom")
  ;; plugins setting
  (load "plugins")

;; }}
