(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; Initialise el-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(setq
 el-get-packages
 '(el-get
   auto-complete
   yasnippet
   markdown-mode
   color-theme-solarized
   ))

(el-get 'sync el-get-packages)

;; Load solarized dark theme
(load-theme 'solarized-dark t)

;; Load setting
(require 'init-basic)
