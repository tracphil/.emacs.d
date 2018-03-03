;;; core-recentf-mode.el --- recentf-mode setup
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

;;; Code:

(use-package recentf
  :config
  (setq recentf-save-file (expand-file-name (concat "recentf-" (core/short-hostname)) core-data-dir))
  (setq recentf-exclude '("/tmp/" "/elpa/" "/xkcd/" "/data/" "/ssh:" "ido.last"))
  (setq recentf-max-saved-items 500)
  (setq recentf-max-menu-items 15)
  (setq recentf-auto-cleanup 'never)
  (recentf-mode +1)
  )

;;; core-recentf-mode.el ends here
