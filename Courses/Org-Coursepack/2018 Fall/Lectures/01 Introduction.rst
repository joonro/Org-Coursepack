=====================
Class 1: Introduction
=====================


 ORG 0000  Joon H. Ro & Jae-Eun Namkoong  
 Class 1  [2018-08-28 Tue] 

1 Introduction to Org-Coursepack
--------------------------------

The Org-Coursepack provides a template for developing and managing teaching
materials using `Org mode <https://orgmode.org/manual/Export-settings.html>`_, a major mode in `GNU Emacs <https://www.gnu.org/software/emacs/manual/html_node/emacs/Specifying-File-Variables.html#Specifying-File-Variables>`_.

1.1 Advantages for Instructors
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- First, Org mode and modular design allow for more effective and efficient
  content creation.

  - Content updates get propagated across courses, semesters, and sections,
    minimizing the potential for inconsistencies

  - Minimizes redundancy when sharing content across courses, semesters, and
    sections

- Second, instructors can enjoy the benefits of having a flexible export system and an output-specific export option.

  - Consistent content across multiple output formats

    - Slides (e.g., via reveal.js or Beamer backends)

    - Handouts (e.g., via the LaTeX or reStructuredText backends)

  - Selective formatting and presentation of components depending on output
    format

- Third, the template contains a) utility functions written in Emacs Lisp, b)
  shortcuts to Org mode functions, and c) pre-built tree structures, which
  allow automation of many tasks including:

  - Automatic class numbering

  - Automatic creation of key content including (but not limited to)

    - course schedule for syllabi;

    - agenda of lecture materials; and

    - exam keys.

1.2 Advantages for Students
~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Consistent, properly-formatted, and strategically presented course materials add to student engagement

- Availability of materials that are easier to digest and review outside the classroom

1.3 Requirements
~~~~~~~~~~~~~~~~

- Basic knowledge of Emacs

- Basic knowledge of Org mode

2 Overview of the Directory Structure
-------------------------------------

We present the directory structure of Org-Coursepack.

**/Assets**
    This folder contains:

    - Org setup files, which include frequently used macros (e.g., for LaTex
      formatting).

    - Supplementary course materials (if any), such as images, videos, or
      articles, for storage and access.

**/Assets/Institutions**
    This folder contains an institution Org file that
    includes institution-specific information (e.g., university policies);
    may have multiple Org files if teaching across multiple institutions.

**/Courses**
    Each unique course will have a subdirectory under ``Courses``. A
    course is defined as a series of lectures occupying a given
    adademic calendar unit referred to as a semester. Same courses
    may be offered across multiple semesters. Note that a course
    may also have multiple sections in the same semester; for
    example, a Statistics 101 course may be offered to three
    different sets of students per semester.

**/Courses/Course**
    This folder contains:

    - A course Org file that includes permanent information about the course
      that remains consistent across semesters (e.g., syllabus items such as
      learning objectives, grading schemes).

    - A subfolder for each semester this course is taught.

**/Courses/Course/Semester**
    Each semester folder contains:

    - A semester Org file that includes information about the course that varies
      by semester (e.g., classroom location, course schedule, assignment due
      dates). The semester Org file also pulls information from other Org files,
      such as course, topic, and institution Org files, to complete the course
      development for that semester. In other words, this is the master file
      that compiles all course materials for exporting.

    - Subfolders are for exported course materials (if any) and are
      divided by type; i.e., Assignments, Lectures, Exams, and Syllabus.

**/Topics**
    This folder contains a topic Org file for each topic; these
    files are where course content (e.g., lecture slides and notes,
    exam questions, assignment guidelines) about specific topics
    are stored and accessed.

2.1 Example
~~~~~~~~~~~

The following example is the directory structure of this course, Org-Coursepack, as well as the template.

::

    \
    |
    +---Assets
    |   |   setup_Macros.org
    |   |
    |   +---Institutions
    |           JOSE.org
    |           Template.org
    |
    +---Courses
    |   +---Org-Coursepack
    |   |   |   Org-Coursepack.org
    |   |   |
    |   |   +---2018 Fall
    |   |       |   2018 Fall.org
    |   |       |
    |   |       +---Assignments
    |   |       |   |   Assignment 1.pdf
    |   |       |   |   Assignment 1.tex
    |   |       |
    |   |       +---Lectures
    |   |       |   |   01 Introduction.pdf
    |   |       |   |   01 Introduction.tex
    |   |       |
    |   |       +---Exams
    |   |       |   |   Exam 1.pdf
    |   |       |   |   Exam 1.tex
    |   |       |
    |   |       +---Syllabus
    |               |   Syllabus (Section 1).pdf
    |               |   Syllabus (Section 1).tex
    |   |
    |   +---Template
    |       |   Template.org
    |       |   
    |       +---Semester
    |           |   Semester.org
    |           |   
    |           +---Assignments
    |           |   |   Assignment_1.pdf
    |           |   |   Assignment_1.tex
    |           |           
    |           +---Exams
    |           +---Lectures
    |           |   |   01 Introduction.pdf
    |           |   |   01 Introduction.tex
    |           |   |   
    |           |           
    |           +---Syllabus
    |               |   Syllabus (Section 1).pdf
    |               |   Syllabus (Section 1).tex
    |
    +---Topics
        |   Org-Teaching.org
