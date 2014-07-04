; (package-initialize)
(evil-mode 0)
; (shell-command-on-region (region-beginning) (region-end) "pbcopy")
; (smartparens-mode 1)
(smartparens-global-mode +1)



; Personal packages
(prelude-require-packages '(yasnippet))
(require 'yasnippet)
(yas-global-mode 1)

;;; My Mappings
; (global-set-key (kbd "C-h") 'delete-backward-char)
(global-set-key (kbd "C-h") 'sp-backward-delete-char)
(global-set-key (kbd "M-[ }") 'kill-paragraph)
(global-set-key (kbd "M-[ {") 'backward-kill-paragraph)
(global-set-key (kbd "C-x M-[ k") 'backward-kill-line)
(global-set-key (kbd "C-x <deletechar>") 'backward-kill-line)
(global-set-key (kbd "M-:") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "ESC <up>") 'evil-window-up)
(global-set-key (kbd "ESC <down>") 'evil-window-down)
(global-set-key (kbd "ESC <right>") 'evil-window-right)
(global-set-key (kbd "ESC <left>") 'evil-window-left)
; (global-set-key (kbd "M-h") 'help-command)
(global-set-key (kbd "M-h") 'kill-region)
(global-set-key (kbd "s-j") 'prelude-top-join-line)
(global-set-key (kbd "s-d") 'prelude-duplicate-current-line-or-region)
; (global-set-key (kbd "M-h") 'kill-region)
; (global-set-key (kbd "M-w") 'kill-region)
(global-set-key (kbd "M-w") 'kill-ring-save)
(global-set-key (kbd "C-w") 'backward-kill-word)
; (global-set-key (kbd "<escape>") 'keyboard-escape-quit)  ;; c-g
(global-set-key (kbd "M-[ r") 'move-to-window-line)
(global-set-key (kbd "M-[ t") 'start-zsh)
(global-set-key (kbd "C-S-F") 'evil-forward-WORD-end)
; (global-set-key (kbd "C-B") 'evil-backward-WORD-begin)
(defalias 'ETe 'evil-forward-WORD-end)
(defalias 'ETb 'evil-backward-WORD-begin)


; My funcs
; http://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(defun disable-guru-mode ()
  (guru-mode -1)
)
(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)
(menu-bar-mode -1)

(defun start-zsh ()
  (interactive)
  (term "/bin/zsh")
)

; ESS
(load "~/.emacs.d/personal/ESS/lisp/ess-site.el")
; (setq inferior-julia-program-name "/usr/local/bin/julia")
(setq inferior-julia-program-name "/usr/local/bin/julia-basic")

; SHM
(add-to-list 'load-path "/Users/williambeard/repos/edu/hask/yorgey/structured-haskell-mode/elisp")
(require 'shm)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)
