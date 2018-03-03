;;; core-json-mode.el --- json-mode setup
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

(use-package json-mode
  :ensure t
  :mode (("\\.json\\'" . json-mode))
  :commands (json-mode)
  :config
  (defun core-json-mode-hook ()
    (interactive)
    (setq js-indent-level 2)
    (rainbow-delimiters-mode))
  (add-hook 'json-mode-hook 'core-json-mode-hook)
  )

;;; core-json-mode.el ends here
