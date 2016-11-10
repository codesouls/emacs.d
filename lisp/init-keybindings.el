;;; init-keybindings.el --- Keybindings customise

;; set mark keymap
(global-set-key (kbd "M-SPC") 'set-mark-command)

;; set goto-line
(define-key ctl-x-map "l" 'goto-line)


(provide 'init-keybindings)
