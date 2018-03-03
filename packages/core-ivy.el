;;; core-ivy.el --- ivy setup
;;
;; Copyright 2017 Tracy Phillips <tracphil@outlook.com>
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

(use-package swiper
  :ensure t
  :diminish (ivy-mode . "")         ;; does not display ivy in the modeline
  :bind (:map ivy-mode-map          ;; bind in the ivy buffer
              ("C-'" . ivy-avy))    ;; C-' to ivy-avy
  :init
  (ivy-mode 1)
  :config
  ;; Use Enter on a directory to navigate into the directory, not open it with dired.
  (define-key ivy-minibuffer-map (kbd "C-m") 'ivy-alt-done)
  (setq ivy-use-virtual-buffers t)    ;; add 'recentf-mode' and bookmarks to 'ivy-switch-buffer'
  (setq ivy-count-format "(%d/%d) ")  ;;
  (setq ivy-display-style 'fancy)     ;;
  (setq ivy-height 20)                ;; number of result lines to display
  (setq ivy-set-count-format "")      ;; does not count candidates
  (setq ivy-initial-inputs-alist nil) ;; no regexp by default
  (setq ivy-re-builders-alist         ;; configure regexp engine
        '((t   . ivy--regex-ignore-order)))  ;; allow input not in order
  )

(use-package counsel
  :ensure t
  :bind*                              ;; load counsel when pressed
  (("C-s"     . swiper)               ;;
   ("M-x"     . counsel-M-x)          ;; M-x use counsel
   ("C-x C-f" . counsel-find-file)    ;; C-x C-f use counsel-find-file
   ("C-x C-r" . counsel-recentf)      ;; search recently edited files
   ("C-c f"   . counsel-git)          ;; search for files in git repo
   ("C-c s"   . counsel-git-grep)     ;; search for regexp in git repo
   ("C-c /"   . counsel-ag)           ;; search for regexp in get repo using ag
   ("C-c l"   . counsel-locate)      ;; search for files or else using locate
   ("C-S-0"   . counsel-rhythmbox)
   )
  )

(use-package counsel-projectile
  :ensure t
  :config
  (setq counsel-projectile-mode t)
  )

;; Keymap used in the minibuffer used in minibuffer per ivy.el
;; (define-key map (kbd "C-m") 'ivy-done)
;; (define-key map (kbd "C-j") 'ivy-alt-done)
;; (define-key map (kbd "C-n") 'ivy-next-line)
;; (define-key map (kbd "C-p") 'ivy-previous-line)
;; (define-key map (kbd "C-s") 'ivy-next-line-or-history)
;; (define-key map (kbd "C-r") 'ivy-previous-line-or-history)
;; (define-key map (kbd "SPC") 'self-insert-command)
;; (define-key map (kbd "DEL") 'ivy-backward-delete-char)
;; (define-key map (kbd "M-<") 'ivy-beginning-of-buffer)
;; (define-key map (kbd "M->") 'ivy-end-of-buffer)
;; (define-key map (kbd "M-n") 'ivy-next-history-element)
;; (define-key map (kbd "M-p") 'ivy-previous-history-element)
;; (define-key map (kbd "C-g") 'minibuffer-keyboard-quit)

;;; core-ivy.el ends here
