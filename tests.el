(load-file "./Assets/.emacs.d/init.el")

(require 'org)
(require 'ox-latex)

(setq org-use-property-inheritance t)

;; Test org-coursepack-update-lecture-metadata()
(with-current-buffer (find-file-noselect "./Courses/Template/Semester Template/Semester Template.org")
  (progn
    ;; Update lecture metadata
    (beginning-of-buffer)
    (re-search-forward "CALL: org-coursepack-update-lecture-metadata")
    (org-ctrl-c-ctrl-c)

    (save-buffer)
    ))

;; Test exporting syllabus
(with-current-buffer (find-file-noselect "./Courses/Template/Semester Template/Semester Template.org")
  (progn
    (beginning-of-buffer)
    (re-search-forward ":EXPORT_FILE_NAME: ./Syllabus/Syllabus \(Section 1\)")
    (org-latex-export-to-pdf nil t)
    ;; (org-html-export-to-html nil t)
    ))

;; Test exporting lecture
(with-current-buffer (find-file-noselect "./Courses/Template/Semester Template/Semester Template.org")
  (progn
    (beginning-of-buffer)
    (re-search-forward ":EXPORT_FILE_NAME: ./Lectures/01 Course Introduction")
    (org-reveal-export-to-html nil t)
    (org-latex-export-to-pdf nil t)
    ;; (org-html-export-to-html nil t)
    ))

;; Test exporting exam
(with-current-buffer (find-file-noselect "./Courses/Template/Semester Template/Semester Template.org")
  (progn
    (beginning-of-buffer)
    (re-search-forward ":EXPORT_FILE_NAME: ./Exams/Exam_1_01_A")
    (org-latex-export-to-pdf nil t)
    ;; (org-html-export-to-html nil t)
    ))

;; Test exporting assignment
(with-current-buffer (find-file-noselect "./Courses/Template/Semester Template/Semester Template.org")
  (progn
    (beginning-of-buffer)
    (re-search-forward ":EXPORT_FILE_NAME: ./Assignments/Assignment_1")
    (org-latex-export-to-pdf nil t)
    ;; (org-html-export-to-html nil t)
    ))

