;;; template.el --- A file with my LaTeX templates & classes. -*- lexical-binding: t; -*-

;;; Commentary:

;; This package provides my most used LaTeX files and other classes
;; I'll try to add over time.

;;; Code:

(require 'ox-latex)

  (add-to-list 'org-latex-classes
	       '("luckypdf"
		 "\\documentclass[french]{article}
\\usepackage{babel}
\\usepackage{minted}
\\usepackage[round]{natbib}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{mathptmx}
\\usepackage{xfrac}
\\usepackage{algorithm2e}
\\SetKwProg{Algo}{algorithm}{}{end}
\\SetKwProg{Class}{class}{}{end}
\\SetKwProg{Private}{private}{ :}{}
\\SetKwProg{Public}{public}{ :}{}
\\usepackage{float}
\\usepackage{booktabs}
\\usepackage{longtable}
\\usepackage[skip=1.\\baselineskip]{caption}
\\usepackage{soul}
\\usepackage[usenames,dvipsnames,svgnames]{xcolor}
\\usepackage{parskip}
\\usepackage[many]{tcolorbox}
\\usepackage{hyperref}
\\usepackage[export]{adjustbox}
\\usepackage{subcaption}

\\usepackage{xcolor}
\\usepackage{framed}

\\definecolor{luckydarkred}{RGB}{142,0,0}
\\colorlet{luckysoftred}{red!20}
\\definecolor{luckydarkgreen}{RGB}{0,142,0}
\\colorlet{luckysoftgreen}{green!20}
\\definecolor{luckydarkblue}{RGB}{0,0,142}
\\colorlet{luckysoftblue}{blue!20}
\\definecolor{luckydarkyellow}{RGB}{142,142,0}
\\colorlet{luckysoftyellow}{yellow!20}
\\definecolor{luckydarkcyan}{RGB}{0,142,142}
\\colorlet{luckysoftcyan}{cyan!20}
\\definecolor{luckydarkpurple}{RGB}{142,0,142}
\\colorlet{luckysoftpurple}{purple!20}
\\definecolor{luckydarkgray}{RGB}{142,142,142}
\\definecolor{luckylightgray}{RGB}{231,231,231}
\\definecolor{luckysoftgray}{RGB}{242,242,242}

\\newcommand{\\luckynote}[2]{
    \\begin{center}
        \\fcolorbox{luckydarkgray}{luckysoftgray}
        {\\begin{minipage}{0.9\\linewidth}
            \\vspace{12pt}
            \\center
            \\begin{minipage}{0.9\\linewidth}\\center{#1}
            \\end{minipage}
            \\break
            \\center
            \\begin{minipage}{0.9\\linewidth}\\center{#2}
            \\end{minipage}
            \\break
        \\end{minipage}}
    \\end{center}}

\\DeclareRobustCommand{\\hlr}[1]{{\\sethlcolor{luckysoftred}\\hl{#1}}}
\\DeclareRobustCommand{\\hlg}[1]{{\\sethlcolor{luckysoftgreen}\\hl{#1}}}
\\DeclareRobustCommand{\\hlb}[1]{{\\sethlcolor{luckysoftblue}\\hl{#1}}}
\\DeclareRobustCommand{\\hly}[1]{{\\sethlcolor{luckysoftyellow}\\hl{#1}}}
\\DeclareRobustCommand{\\hlc}[1]{{\\sethlcolor{luckysoftcyan}\\hl{#1}}}
\\DeclareRobustCommand{\\hlp}[1]{{\\sethlcolor{luckysoftpurple}\\hl{#1}}}

\\hypersetup{
    colorlinks=true,
    linkcolor={luckydarkpurple},
    citecolor={luckydarkgreen},
    urlcolor={luckydarkblue}}
\\usepackage{geometry}
\\geometry{a4paper,left=2.5cm,top=1.2cm,right=2.5cm,bottom=1.5cm,marginparsep=7pt, marginparwidth=.6in}"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
	       '("luckypdf_en"
		 "\\documentclass{article}
\\usepackage{minted}
\\usepackage[round]{natbib}
\\usepackage[utf8]{inputenc}
\\usepackage[T1]{fontenc}
\\usepackage{mathptmx}
\\usepackage{xfrac}
\\usepackage{algorithm2e}
\\SetKwProg{Algo}{algorithm}{}{end}
\\SetKwProg{Class}{class}{}{end}
\\SetKwProg{Private}{private}{ :}{}
\\SetKwProg{Public}{public}{ :}{}
\\usepackage{float}
\\usepackage{booktabs}
\\usepackage{longtable}
\\usepackage[skip=1.\\baselineskip]{caption}
\\usepackage{soul}
\\usepackage[usenames,dvipsnames,svgnames]{xcolor}
\\usepackage{parskip}
\\usepackage[many]{tcolorbox}
\\usepackage{hyperref}
\\usepackage[export]{adjustbox}
\\usepackage{subcaption}

\\usepackage{xcolor}
\\usepackage{framed}

\\definecolor{luckydarkred}{RGB}{142,0,0}
\\colorlet{luckysoftred}{red!20}
\\definecolor{luckydarkgreen}{RGB}{0,142,0}
\\colorlet{luckysoftgreen}{green!20}
\\definecolor{luckydarkblue}{RGB}{0,0,142}
\\colorlet{luckysoftblue}{blue!20}
\\definecolor{luckydarkyellow}{RGB}{142,142,0}
\\colorlet{luckysoftyellow}{yellow!20}
\\definecolor{luckydarkcyan}{RGB}{0,142,142}
\\colorlet{luckysoftcyan}{cyan!20}
\\definecolor{luckydarkpurple}{RGB}{142,0,142}
\\colorlet{luckysoftpurple}{purple!20}
\\definecolor{luckydarkgray}{RGB}{142,142,142}
\\definecolor{luckylightgray}{RGB}{231,231,231}
\\definecolor{luckysoftgray}{RGB}{242,242,242}

\\newcommand{\\luckynote}[2]{
    \\begin{center}
        \\fcolorbox{luckydarkgray}{luckysoftgray}
        {\\begin{minipage}{0.9\\linewidth}
            \\vspace{12pt}
            \\center
            \\begin{minipage}{0.9\\linewidth}\\center{#1}
            \\end{minipage}
            \\break
            \\center
            \\begin{minipage}{0.9\\linewidth}\\center{#2}
            \\end{minipage}
            \\break
        \\end{minipage}}
    \\end{center}}

\\DeclareRobustCommand{\\hlr}[1]{{\\sethlcolor{luckysoftred}\\hl{#1}}}
\\DeclareRobustCommand{\\hlg}[1]{{\\sethlcolor{luckysoftgreen}\\hl{#1}}}
\\DeclareRobustCommand{\\hlb}[1]{{\\sethlcolor{luckysoftblue}\\hl{#1}}}
\\DeclareRobustCommand{\\hly}[1]{{\\sethlcolor{luckysoftyellow}\\hl{#1}}}
\\DeclareRobustCommand{\\hlc}[1]{{\\sethlcolor{luckysoftcyan}\\hl{#1}}}
\\DeclareRobustCommand{\\hlp}[1]{{\\sethlcolor{luckysoftpurple}\\hl{#1}}}

\\hypersetup{
    colorlinks,
    linkcolor={luckydarkpurple},
    citecolor={luckydrakgreen},
    urlcolor={luckydarkblue}}

\\usepackage{geometry}
\\geometry{a4paper,left=2.5cm,top=1.2cm,right=2.5cm,bottom=1.5cm,marginparsep=7pt, marginparwidth=.6in}"
		 ("\\section{%s}" . "\\section*{%s}")
		 ("\\subsection{%s}" . "\\subsection*{%s}")
		 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
		 ("\\paragraph{%s}" . "\\paragraph*{%s}")
		 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

;;; Footer
(provide 'template)
;;; template.el ends here
