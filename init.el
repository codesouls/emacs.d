;;; init.el --- Config init

;; Author: da07ng <me@gaodaojing.com>
;; Keywords:

;; Path

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Config

(require 'init-settings)
(require 'init-packages)
(require 'init-theme)
(require 'init-keys)
(require 'init-funcs)


(provide 'init)
;;; init.el ends here
