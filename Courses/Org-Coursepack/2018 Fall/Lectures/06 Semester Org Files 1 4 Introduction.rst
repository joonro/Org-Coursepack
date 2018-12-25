===============================================
Class 6: Semester Org Files (1/4): Introduction
===============================================


 ORG 0000  Joon H. Ro & Jae-Eun Namkoong  
 Class 6  [2018-09-13 Thu] 

.. _Lecture/Semester Org Files 1 4 Introduction/Agenda:

1 Semester Org Files: Introduction
----------------------------------

A semester Org file is the master file for the course in a given
semester. That is, a semester Org file, which is where
semester-specific information about the course (e.g., classroom
location, course schedule, etc.) is stored, is also where materials
from other Org files are pulled as the instructor contructs the
course to create a syllabus, lectures, exams, assignments, etc. It can
accommodate multiple sections of the same course offered in the semester.

The example below shows the top-level contents of a semester Org file,
with all the trees and drawers collapsed. We will dedicate several
lectures to cover each component, following the order in which they are presented in the example.

::

    #+TITLE:     Org-Coursepack: 2020 Spring
    #+AUTHOR:    Your Name
    #+EMAIL:     Your Email
    #+DESCRIPTION: Org-Coursepack: 2020 Spring
    #+CATEGORY: Teaching

    :LOCALSETUP:

    :SETUP_EXPORT:

    :SEMESTER_INFO:

    * Tasks
    * Sections
    * Syllabus
    * Classes
    * Exams                                                               :Exams:
    * Assignments                                                   :Assignments:
    * Local Variables

2 Export Options and Macros
---------------------------

The file starts with multiple metadata definitions, such as ``TITLE``
and ``AUTHOR``, which also act as global export keywords. This is
followed by three drawers containing various macros and export
options, which will be used across the file.

::

    #+TITLE:     Org-Coursepack: 2020 Spring
    #+AUTHOR:    Your Name
    #+EMAIL:     Your Email
    #+DESCRIPTION: Org-Coursepack: 2020 Spring
    #+CATEGORY: Teaching

    :LOCALSETUP:

    :SETUP_EXPORT:

    :SEMESTER_INFO:

2.1 ``:LOCALSETUP:`` Drawer
~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``:LOCALSETUP:`` drawer has startup options (``#+STARTUP``) for the
Org file as well as a couple of ``#+SETUPFILE``'s which import necessary
macros from the dedicated macro Org file
(``../../../Assets/setup_Macros.org``) and school Org file
(``../../../Assets/Institutions/School.org``). Note that one can visit each
file with ``C-c '``. Absolute paths can be used instead of relative
ones.

::

    :LOCALSETUP:
    #+STARTUP: overview
    #+STARTUP: hidestars
    #+STARTUP: indent

    #+SETUPFILE: ../../../Assets/setup_Macros.org

    #+SETUPFILE: ../../../Institutions/School.org
    :END:

2.2 ``:SETUP_EXPORT:`` Drawer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``:SETUP_EXPORT:`` drawer has export related options, mainly those
related to ``org-reveal`` (e.g., handouts). For example, ``#+REVEAL_ROOT``
should specify the location of ``reveal.js`` (see the `org-reveal
documentation <https://github.com/yjwen/org-reveal/>`_ for more information). The semester Org file for
Org-Coursepack specifies reveal.js 3.6.0 from a CDN. See the `Org manual <https://orgmode.org/manual/Export-settings.html>`_
for more general information about export options.

::

    :SETUP_EXPORT:
    #+REVEAL_ROOT: https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.6.0

    #+REVEAL_PLUGINS: (classList markdown zoom notes highlight)

    #+EXCLUDE_TAGS: noexport
    #+OPTIONS: reveal_history:t tags:nil timestamp:nil todo:nil

    #+REVEAL_THEME: simple
    #+REVEAL_TRANS: linear
    :END:

2.3 ``:SEMESTER_INFO:`` Drawer
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``:SEMESTER_INFO:`` drawer has macros containing information about
the course that is common across sections but specific to the semester.

.. note::

    Course name and number are categorized as semester-specific information, as they may change over time.

::

    :SEMESTER_INFO:
    #+MACRO: COURSE Org Teaching Template
    #+MACRO: COURSE_NUM ORG 0000
    #+MACRO: SEMESTER 2020 Spring
    #+MACRO: OFFICE_HOURS Tue 3:30-4:30pm
    :END:

3 ``Tasks`` Top-level Tree
--------------------------

This is the subtree where users can organize instruction-related tasks
(TODO items) specific to the semester, e.g., reminders to post
announcements or grades. See the `Org manual <https://orgmode.org/manual/TODO-items.html>`_ for more information on
how to use TODO items in Org mode.
