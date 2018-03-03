;;; core-rainbow-mode.el --- rainbow-mode setup
;;
;; Copyright 2017 Tracy Phillips <reavon@yahoo.com>
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
;; rainbow-mode colorizes names in buffers

;;; Code:

(use-package rainbow-mode
  :ensure t
  :diminish rainbow-mode
  :config
  (rainbow-mode 1)
  ;; (add-hook 'css-mode-hook (lambda () (rainbow-mode 1)))
  ;; (add-hook 'html-mode-hook (lambda () (rainbow-mode 1)))
  ;; (add-hook 'emacs-lisp-mode-hook (lambda () (rainbow-mode 1)))
  )

;;; core-rainbow-mode.el ends here
