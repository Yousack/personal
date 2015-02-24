;;; package --- Summary

;;; Commentary:

;;; Code:

(server-start)
(mac-translate-from-yen-to-backslash)
(global-linum-mode)
(electric-indent-mode -1)
(disable-theme 'zenburn)
(load-theme 'atom-dark)
(setq default-input-method "japanese-mozc")
(defvar mozc-helper-program-name "/usr/local/bin/mozc_emacs_helper")
(require 'mozc-popup)
(setq mozc-candidate-style 'popup)

(if window-system
    (progn
      (set-scroll-bar-mode nil)
      (setq inhibit-startup-screen t)
      (set-face-attribute 'default nil
                          :family "Inconsolata"
                          :height 180)
      (set-fontset-font
       nil 'japanese-jisx0208
       (font-spec :family "Hiragino Kaku Gothic ProN"))
      (setq face-font-rescale-alist
            '((".*Hiragino_Kaku_Gothic_ProN.*" . 1.2)))
      (set-frame-parameter nil 'alpha 90)
))

(require 'org)
(require 'ox-latex)
(setq org-latex-packages-alist
      '(("" "bm")
        ("" "authblk")))
(setq org-latex-classes
      '(("ltjsarticle"
         "\\documentclass{ltjsarticle}"
         ("\\section{%s}" . "\\section*{%s}")
         ("\\subsection{%s}" . "\\subsection*{%s}")
         ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
         ("\\paragraph{%s}" . "\\paragraph*{%s}")
         ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
        ("beamer"
         "\\documentclass[presentation]{beamer}"
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
