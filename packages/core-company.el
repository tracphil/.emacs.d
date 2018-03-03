;;; core-company.el --- company setup
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
;; Company configuration

;;; Code:

(use-package company
  :ensure t
  :defer t
  :diminish company-mode
  :bind (:map company-active-map
              ("M-n" . nil)                     ;; unset company-select-next
              ("M-p" . nil)                     ;; unset company-select-previous
              ("C-n" . company-select-next)     ;; uses Emacs normal binding for next
              ("C-p" . company-select-previous) ;; uses Emacs normal binding for previous
;;             ("<tab>" . company-complete-selection)
              )
  :init
  (global-company-mode 1)
  :config
  (add-to-list 'company-transformers 'delete-consecutive-dups t)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  (setq company-show-numbers t)
  (setq company-dabbrev-ingore-case nil)
  (setq company-dabbrev-code-ignore-case nil)
  (setq company-dabbrev-downcase nil)
  (setq company-transformers '(company-sort-by-occurrence))
  (setq company-tooltip-flip-when-above t)
  (setq company-tooltip-limit 10)
  ;; https://www.reddit.com/r/emacs/comments/5jvawj/select_the_company_completion_candidate_by
  ;; use numbers 0-9 to select company completion candidates
  (let ((map company-active-map))
  (mapc (lambda (x) (define-key map (format "%d" x)
                 `(lambda () (interactive) (company-complete-number ,x))))
        (number-sequence 0 9)))
  ;; http://emacs.stackexchange.com/questions/9835/how-can-i-prevent-company-mode-completing-numbers
  (push (apply-partially #'cl-remove-if
                        (lambda (c)
                          (or (string-match-p "[^\x00-\x7F]+" c)
                              (string-match-p "[0-9]+" c)
                              (if (equal major-mode "org")
                                  (>= (length c) 15)))))
        company-transformers)
  ;;; Prevent suggestions from being triggered automatically. In particular,
  ;;; this makes it so that:
  ;;; - TAB will always complete the current selection.
  ;;; - RET will only complete the current selection if the user has explicitly
  ;;;   interacted with Company.
  ;;; - SPC will never complete the current selection.
  ;;;
  ;;; Based on:
  ;;; - https://github.com/company-mode/company-mode/issues/530#issuecomment-226566961
  ;;; - http://emacs.stackexchange.com/a/13290/12534
  ;;; - http://stackoverflow.com/a/22863701/3538165
  ;;;
  ;;; See also:
  ;;; - http://emacs.stackexchange.com/a/24800/12534
  ;;; - http://emacs.stackexchange.com/q/27459/12534
  ;; <return> is for windowed Emacs; RET is for terminal Emacs
  (dolist (key '("<return>" "RET"))
    ;; Here we are using an advanced feature of define-key that lets
    ;; us pass an "extended menu item" instead of an interactive
    ;; function. Doing this allows RET to regain its usual
    ;; functionality when the user has not explicitly interacted with
    ;; Company.
    (define-key company-active-map (kbd key)
      `(menu-item nil company-complete
                  :filter ,(lambda (cmd)
                             (when (company-explicit-action-p)
                               cmd)))))
  (define-key company-active-map (kbd "TAB") #'company-complete-selection)
  (define-key company-active-map (kbd "SPC") nil)
  ;; Company appears to override the above keymap based on company-auto-complete-chars.
  ;; Turning it off ensures we have full control.
  (setq company-auto-complete-chars nil)
  (setq company-global-modes '(not neotree-mode))
  )

(use-package company-shell
  :ensure t
  :config
  (add-to-list 'company-backends 'company-shell)
  )

;;; core-company.el ends here
