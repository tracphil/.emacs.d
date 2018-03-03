;;; core-git-gutter.el --- git-gutter setup
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

(use-package git-gutter
  :ensure t
  :diminish git-gutter-mode
  :init
  (global-git-gutter-mode t)
  :config
  (git-gutter:linum-setup)
  (custom-set-variables
   '(git-gutter:update-interval 1)
   '(git-gutter:added-sign "++")
   '(git-gutter:deleted-sign "--")
   '(git-gutter:modified-sign "+-")
   )
  (set-face-foreground 'git-gutter:modified "#F2C80F")
  (set-face-foreground 'git-gutter:added "#01B8AA")
  (set-face-foreground 'git-gutter:deleted "#FD625E")
)

;;; core-git-gutter.el ends here
