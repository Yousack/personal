;;; package --- Summary

;;; Commentary:

;;; Code:

(server-start)
;; (mac-translate-from-yen-to-backslash)
(global-linum-mode)
(electric-indent-mode -1)
(disable-theme 'zenburn)
(load-theme 'flatui)
(setq default-input-method "japanese-mozc")
(defvar mozc-helper-program-name "/usr/local/bin/mozc_emacs_helper")
(require 'mozc-popup)
(setq mozc-candidate-style 'popup)

(if window-system
    (progn
      (set-scroll-bar-mode nil)
      (setq inhibit-startup-screen t)
      (set-face-attribute 'default nil
                          :family "Myrica M"
                          :height 180)
      (set-frame-parameter nil 'alpha 90)
))

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)

;; visual regexp
(require 'visual-regexp-steroids)
(define-key global-map (kbd "M-%") 'vr/replace)

;; smart-compile
(require 'smart-compile)
(bind-key "C-c c" 'smart-compile)
(bind-key "C-c C-c" "C-c c C-m")

;; company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

;; Ruby
(add-hook 'ruby-mode-hook 'robe-mode)
(push 'company-robe company-backends)

;; Python
(pyenv-mode)

;; C++
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
(defun my-irony-mode-hook ()
  (define-key irony-mode-map [remap completion-at-point]
    'irony-completion-at-point-async)
  (define-key irony-mode-map [remap complete-symbol]
    'irony-completion-at-point-async))
(add-hook 'irony-mode-hook 'my-irony-mode-hook)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; C#
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(setq omnisharp-server-executable-path "/Users/yousack/src/OmniSharpServer/OmniSharp/bin/Debug/Omnisharp.exe")
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

;; Org
(require 'org)
(setq org-src-fontify-natively t)
(require 'ox-latex)
(require 'ox-bibtex)
(setq org-latex-packages-alist
      '(
        ("" "bm")
        ("" "url")
        ("yu-osx" "luatexja-preset")
        ))
(setq org-latex-classes
      '(("ltjsarticle"
         "\\documentclass{ltjsarticle}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
        ("ltjsarticle_two"
         "\\documentclass[twocolumn]{ltjsarticle}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
        ("beamer"
         "\\documentclass[presentation]{beamer}
\\usefonttheme{professionalfonts}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
        ("ltjbook"
         "\\documentclass{ltjbook}"
         ("\\part{%s}" . "\\part{%s}")
         ("\\chapter{%s}" . "\\chapter{%s}")
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))
(setq org-latex-pdf-process '("lualatex %b" "lualatex %b"))
(setq org-latex-default-class "ltjsarticle")

(provide 'personal)
;;; personal.el ends here
