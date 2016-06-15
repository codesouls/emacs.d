(require-package 'js2-mode)
(require-package 'json-mode)

(require-package 'tern)
(require-package 'js2-refactor)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

(setq-default js-indent-level 2)
(setq-default js2-basic-offset 2)

;; tern
(add-hook 'js2-mode-hook 'tern-mode)

;; js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)

(js2r-add-keybindings-with-prefix "C-c C-m")


(provide 'init-javascript)
