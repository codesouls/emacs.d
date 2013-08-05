(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

;; ELPA
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; El-get
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(setq
 el-get-packages
 '())

(el-get 'sync el-get-packages)

;; Load custom scripts
;;(require 'conf-basic)
;;(require 'conf-theme)
