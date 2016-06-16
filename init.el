;;; init.el --- Config init

;; Author: da07ng <me@gaodaojing.com>
;;

;; Path
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Package
(require 'package)

;; (add-to-list 'package-archives
;;              '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives
;;              '("org" . "http://orgmode.org/elpa/") t)

(setq package-archives
      '(("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
        ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
        ("org" . "http://orgmode.org/elpa/")))

;; On-demand installation of packages
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

;; Setting
(require 'init-settings)

(require 'init-defuncs)
(require 'init-keybindings)

(require 'init-complete)
(require 'init-yasnippet)
(require 'init-helm)
(require 'init-projectile)

(require 'init-theme)
(require 'init-powerline)
(require 'init-neotree)
(require 'init-window-numbering)

(require 'init-magit)
(require 'init-flycheck)
(require 'init-which-key)

(require 'init-orgmode)
(require 'init-markdown)

(require 'init-web)
(require 'init-javascript)
(require 'init-python)
(require 'init-clojure)
(require 'init-rust)


(provide 'init)
