;;; core-ux.el --- core-ux setup
;;
;; Copyright 2017 Tracy Phillips
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software Foundation,
;; Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301  USA

;;; Commentary:

;;; Code:

;; turn off menu-bar
(menu-bar-mode -1)

;; turn off tool-bar
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1)
  )

;; turn off scroll-bars
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode 0)
  )
(when (fboundp 'horizontal-scroll-bar-mode)
  (horizontal-scroll-bar-mode 0)
  )

;; initial frame (window) size
(setq initial-frame-alist
      '((width . 131)
        (height . 41)
        )
      )

;; default/subsequent window
(setq default-frame-alist
      '((width . 129)
        (height . 39)
        )
      )

;; disable startup screen
(setq inhibit-startup-screen t)

;; set empty scratch buffer at startup
(setq initial-scratch-message "")

;; don't start in lisp interaction mode
(setq initial-major-mode 'fundamental-mode)

;; change echo message.
(defun display-startup-echo-area-message ()
  "Show a welcome message."
  (message "Where to now boss?")
  )

;; focus help window when opened
(setq help-window-select t)

;; include core-fonts.el
(require 'core-fonts)

;; enable global line numbers
(global-linum-mode 1)
(column-number-mode t)
(size-indication-mode t)

;; show proper gutter with whitespace for line numbers
(setq linum-format "%4d \u2502 ")

;; more useful frame title that shows either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                  "%b")
               )))

;; for all that is holy, stop suspending Emacs
(global-unset-key (kbd "C-z"))

;; highlight current line in all buffers
(global-hl-line-mode +1)

;; shorten answers to yes or no
(defalias 'yes-or-no-p 'y-or-n-p)

;; stop closing Emacs by mistake
(setq confirm-kill-emacs 'y-or-n-p)

;; stop blinking the cursor
(blink-cursor-mode -1)

;; disable bell
(setq ring-bell-function 'ignore)

;; automatically insert closing bracket
(electric-pair-mode 1)
(add-hook 'prog-mode-hook (lambda () (electric-pair-mode)))

;; turn on bracket match highlight
;;(show-paren-mode t)
;;(setq show-paren-style 'expression)

;; horizontal splits for temp buffers
(defun split-horizontally-for-temp-buffers ()
  "Split the window horizontally for temp buffers."
  (when (and (one-window-p t)
             (not (active-minibuffer-window)))
    (split-window-horizontally)
    ))
(add-hook 'temp-buffer-setup-hook 'split-horizontally-for-temp-buffers)

;; enable Emacs to follow version controlled symlinks
;;(setq vc-follow-symlinks)

;; OS clipboard integration
(setq select-enable-clipboard t)
(setq select-enable-primary t)
(setq mouse-drag-copy-region t)

;; scroll smoothly rather than by paging
(setq scroll-step 1)

;; make unique buffer names
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; insert point to last location in previous buffer
(save-place-mode 1)

;; scroll one line at a time instead of jumping
(setq scroll-conservatively 100000)

;;
(setq scroll-preserve-screen-position 1)

;; Minimum number of lines between point and top or bottom of window
(setq scroll-margin 5)

;; turn on syntax highlighting for all buffers
(global-font-lock-mode t)

;; when a region is selected and I start typing, delete region automatically
(delete-selection-mode 1)

;; ignore case when using completion for file names
(setq read-file-name-completion-ignore-case t)

;; by default, Emacs thinks a sentence is a full-stop followed by 2 spaces
;; make it full-stop and 1 space
(setq sentence-end-double-space nil)

;; recenter to top instead of middle
(setq recenter-positions '(top middle bottom))

;; syntax highlighting on
(global-font-lock-mode t)

;; make indentation commands use space only (never tab character)
(setq-default indent-tabs-mode nil)

;; suppress ad-handle-definition warnings
(setq ad-redefinition-action 'accept)

;; stop scaling the fucking fonts!!
;; TODO

(provide 'core-ux)
;;; core-ux.el ends here
