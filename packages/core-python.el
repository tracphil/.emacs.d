;;; core-python.el --- python ide setup
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

(use-package python
  :ensure t
  :mode ("\\.py$" . python-mode)
  :config
  (use-package elpy
    :ensure t
    :diminish elpy-mode "☕"
    :bind (:map yas-minor-mode-map
                ("C-c k" . yas-expand)
                )
    (:map python-mode-map
          ("RET" . newline-and-indent)
          )
    :commands elpy-enable
    :config
    (setq elpy-rpc-python-command "python3"
          elpy-rpc-backend "jedi"
          python-check-command "/usr/bin/pyflakes"
          elpy-modules '(elpy-module-sane-defaults
                         elpy-module-company
                         elpy-module-eldoc
                         elpy-module-pyvenv
                         elpy-module-yasnippet
                         elpy-module-flymake
                         )
          )
    )
  (elpy-enable)
  (add-hook 'python-mode-hook #'smartparens-strict-mode)
  )

(use-package py-autopep8
  :ensure t
  :config
  ;; enable autopep8 formatting on save
  ;; ignoring:
  ;; - E501 - Try to make lines fit within --max-line-length characters.
  ;; - W293 - Remove trailing whitespace on blank line.
  ;; - W391 - Remove trailing blank lines.
  ;; - W690 - Fix various deprecated code (via lib2to3).
  (setq py-autopep8-options '("--ignore=E501,W293,W391,W690"))
  (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
  )

;;; core-python.el ends here
