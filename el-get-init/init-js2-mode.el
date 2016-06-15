(require 'js2-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))

(add-hook 'js2-mode-hook 'tern-mode)

(setq-default js-indent-level 2)
(setq-default js2-basic-offset 2)
