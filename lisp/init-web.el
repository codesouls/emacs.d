;;; web.el --- Web develop config

;; web-mode
(require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ejs\\'" . web-mode))

(defun web-mode-hook ()
  (progn
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)

    (setq web-mode-style-padding 1)
    (setq web-mode-script-padding 1)
    (setq web-mode-block-padding 0)
    (local-unset-key (kbd "C-;"))
    )
  )

(add-hook 'web-mode-hook  'web-mode-hook)

;; scss-mode
(require-package 'scss-mode)

(setq css-indent-offset 2)

;; emmet-mode
(require-package 'emmet-mode)

(add-hook 'web-mode-hook  'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)


(provide 'init-web)
