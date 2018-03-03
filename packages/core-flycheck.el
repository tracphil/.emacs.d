;;; core-flycheck.el --- flycheck setup
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

(use-package flymake :disabled t)

(use-package flycheck-color-mode-line
  :ensure t
  )

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :bind ("<kp-7>" . flycheck-next-error)
  :preface
  (declare-function flycheck-next-error flycheck nil)
  (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)
  (fringe-mode (quote (4 . 0)))
  (global-flycheck-mode 1)
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit)
  (setq flycheck-python-flake8-executable "flake8")
  (setq flycheck-flake8-maximum-line-length 79)
  (setq flycheck-highlighting-mode 'lines)
  )

;;; core-flycheck.el ends here
