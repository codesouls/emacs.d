(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(setq el-get-user-package-directory "~/.emacs.d/el-get-init")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/custom/recipes")

;; my package
(setq my-packages
      (append
       '(el-get
         company-mode
         company-tern
         yasnippet
         helm
         projectile
         helm-projectile
         neotree
         ;; org-mode
         which-key

         color-theme-sanityinc-tomorrow
         powerline
         ;; tabbar-ruler
         window-numbering

         magit

         flycheck

         markdown-mode

         web-mode
         js2-mode
         tern
         js2-refactor
         jshint-mode
         json-mode
         scss-mode
         ;; less-css-mode
         emmet-mode

         ;; go-mode
         ;; clojure-mode
         rust-mode
         )

       (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

(el-get 'sync my-packages)


(provide 'init-packages)
