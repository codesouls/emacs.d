;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(add-to-list 'load-path user-emacs-directory)

(require 'conf-basic)
(require 'conf-gui)
(require 'conf-font)

(require 'init-theme)
