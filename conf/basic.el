;; 设置个人信息
(setq user-full-name "Gao DaoJing")
(setq user-mail-address "gaodaojing@gmail.com")

;; 初始化设置
(setq-default inhibit-startup-screen t)
(setq-default initial-scratch-message nil)
(setq-default initial-major-mode 'emacs-lisp-mode)

;; 显示行号
(global-linum-mode t)

;; 显示匹配的括号
(show-paren-mode t)

;; 设置时间格式
(setq-default display-time-24hr-format t)
(setq-default display-time-day-and-date nil)

;; 在状态栏显示行列号
(setq-default line-number-mode t)
(setq-default column-number-mode t)

;; 关闭烦人的出错时的提示声
(setq-default visible-bell t)

;; 使用 "y/n" 代替 "yes/no"
(fset 'yes-or-no-p 'y-or-n-p)

;; 制表符
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq x-stretch-cursor t)

;; 立即在回显区显示按键
(setq-default echo-keystrokes -1)

;; 在保存之前删除行末空白
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; 总是以一个换行符结束文件
(setq-default require-final-newline t)

;; 由菜单修改配置的东西将会保存在 custom-file 里
(setq-default custom-file "~/.emacs.d/.custom-file.el")
(if (file-exists-p custom-file) (load custom-file))

;; 备份设置
(setq-default make-backup-file t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
(setq backup-by-copying t)

;; 支持emacs和外部程序的粘贴
(setq-default x-select-enable-clipboard t)

;; 括号匹配时显示另外一边的括号，而不是跳转到另一个括号
(when (fboundp 'show-paren-mode)
  (show-paren-mode t)
  (setq-default show-paren-style 'parentheses))

;; 光标靠近时，鼠标不动
(mouse-avoidance-mode 'none)

;; 禁止光标和屏幕闪烁
(when (fboundp 'blink-cursor-mode)
  (blink-cursor-mode -1)
  (setq-default visible-bell nil))

;; 不要在鼠标点击的那个地方插入剪贴板内容
(setq-default mouse-yank-at-point t)

;; 递归使用 minibuffer
(setq-default enable-recursive-minibuffers t)

;; 在标题栏显示 buffer 的名字
(setq-default frame-title-format '(buffer-file-name "%f" ("%b")))

;; 加载默认的库，default.el
(setq-default inhibit-default-init t)

;; 并且使 text-mode 每 80 个字符自动缩进
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default fill-column 80)

;; 比较差异文件时启动 -u 模式
(setq-default diff-switches "-u")

;; 显示行尾的空白字符
(setq-default show-trailing-whitespace 1)

;; 提示文件结尾的空行
(setq-default indicate-empty-lines 1)

;; 取消原本不开启的命令
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'erase-buffer 'disabled nil)

;; 字体配置
(set-face-attribute
  'default nil :font "Source Code Pro 12")

(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
    charset
    (font-spec :family "Microsoft YaHei" :size 14)))
