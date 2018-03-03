;;; core-fonts.el --- Emacs core font setup
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

;; Fedora: sudo dnf install adobe-source-code-pro-fonts

;; Test char and monospace:
;; 0123456789abcdefghijklmnopqrstuvwxyz [] () :;,. !@#$^&*
;; 0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ {} <> "'`  ~-_/|\?

;;; Code:

;; use utf-8
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(cond
 ((find-font (font-spec :name "Source Code Pro"))
  (setq default-frame-alist '((font . "Source Code Pro-11"))))
 ((find-font (font-spec :name "Consolas"))
  (setq default-frame-alist '((font . "Consolas-11"))))
 ((find-font (font-spec :name "Hack"))
  (setq default-frame-alist '((font . "Hack-10"))))
 ((find-font (font-spec :name "Inconsolata"))
  (setq default-frame-alist '((font . "Inconsolata-11"))))
 ((find-font (font-spec :name "Overpass Mono"))
  (setq default-frame-alist '((font . "Overpass Mono-10"))))
 ((find-font (font-spec :name "DejaVu Sans Mono"))
  (setq default-frame-alist '((font . "DejaVu Sans Mono-10"))))
 )

(provide 'core-fonts)

;;; core-fonts.el ends here
