========================================================
Class 7: Semester Org Files (2/4): Sections and Syllabus
========================================================


 ORG 0000  Joon H. Ro & Jae-Eun Namkoong  
 Class 7  [2018-09-18 Tue] 

1 ``Sections`` Top-level Tree
-----------------------------

An instructor may teach multiple sections of the same course during a
given semester. The ``Sections`` subtree contains a subtree for each
section, which contains section-specific information such as section
number, classroom location and time, and exam dates. It also acts as a
wrapper around the content of the syllabus, which passes on section-specific
information.

::

    * Sections
    :PROPERTIES:
    ** 01
    ** 02
    ** 03

1.1 ``:PROPERTIES:``
~~~~~~~~~~~~~~~~~~~~

- :Properties: of these subtrees have information common across all sections,
  such as LaTeX preamble items via ``EXPORT_LATEX_HEADER``. These will be
  inherited and shared by the subtrees with the
  ``org-use-property-inheritance`` option set to ``t``. For example:

  .. code:: tex

      * Sections
      :PROPERTIES:
      :CUSTOM_ID: Sections
      :EXPORT_LATEX_CLASS: koma-article
      :EXPORT_LATEX_CLASS_OPTIONS: [article,letterpaper,times,10pt,listings-bw,microtype]
      :EXPORT_LATEX_HEADER+: \usepackage[onehalfspacing]{setspace}
      :EXPORT_LATEX_HEADER+: \usepackage[T1]{fontenc}
      :EXPORT_LATEX_HEADER+: \usepackage{mathpazo} \usepackage[scaled=0.85]{helvet} \usepackage{courier}
      :EXPORT_LATEX_HEADER+: \usepackage{geometry} \geometry{left=1in,right=1in,top=1in,bottom=1in}
      :EXPORT_LATEX_HEADER+: \usepackage[framemethod=default]{mdframed}
      :EXPORT_DATE: {{{SEMESTER}}}
      :EXPORT_OPTIONS: num:nil title:nil toc:nil tags:nil
      :END:

1.2 Sections
~~~~~~~~~~~~

- Each section subtree has properties and macros for the section
  information and a subtree for the syllabus of the section:

  ::

      ** 01
      :PROPERTIES:
      :MACROS_Section_Info:
      *** Syllabus

1.2.1 ``:PROPERTIES:``
^^^^^^^^^^^^^^^^^^^^^^

Each section subtree has property items containing section-specific
information such as ``:SECTION:`` (section number), ``:SECTION_LOC:``
(classroom location), ``:SECTION_DATE:`` (class date and time), and
``:SECTION_DATE_FINAL_EXAM:`` (final exam date), which will be used in
the syllabus via the ``{{{property(Property_NAME)}}}`` grammar (e.g.,
``{{{property(SECTION_DATE)}}}``). Note that we created a macro
``{{{DATE_FINAL_EXAM_01}}}`` for ``:SECTION_DATE_FINAL_EXAM:``, so it can be
used in other places, such as class announcements.

::

    ** 01
    :PROPERTIES:
    :SECTION: 01
    :SECTION_DATE: Tue/Thurs, 9:30a-10:45
    :SECTION_DATE_FINAL_EXAM: {{{DATE_FINAL_EXAM_01}}}
    :SECTION_LOC: BLDG 100
    :CUSTOM_ID: Sections/01
    :END:

1.2.2 Macros
^^^^^^^^^^^^

- Instructors can specify the final exam date in the
  ``:MACROS_Section_Info:`` drawer.

- To allow this information to be used in other places (e.g.,
  reminders or announcements), we used a macro instead of a property.

  ::

      ** 01
      :PROPERTIES:
      :MACROS_Section_Info:
      #+MACRO: DATE_FINAL_EXAM_01 [2018-12-16 Sun 13:00] - 4:00PM
      :END:

1.2.3 Syllabus
^^^^^^^^^^^^^^

- The ``Syllabus`` subtree has properties containing section-specific
  information for the section's syllabus. For its body, it pulls content
  from the ``Syllabus`` subtree of the file.

  ::

      *** Syllabus
      :PROPERTIES:
      #+INCLUDE: "./2020 Spring.org::#Syllabus" :only-contents t

- ``:PROPERTIES:`` of this subtree contain export-related information for the
  syllabus, such as ``:EXPORT_FILE_NAME:``.

  ::

      *** Syllabus
      :PROPERTIES:
      :EXPORT_TITLE: {{{COURSE_NUM}}}-{{{property(SECTION)}}} Syllabus
      :EXPORT_FILE_NAME: ./Syllabus/01_Syllabus
      :EXPORT_TO:  LaTeX (Custom Time Format)
      :OUTPUT_VIEW: PDF
      :END:

- The syllabus subtree simply includes in its body the content of the top level ``Syllabus`` tree. Since
  property macros are used for section-specific information in the content,
  the corresponding section-specific information will be included automatically.

  ::

      *** Syllabus
      :PROPERTIES:
      #+INCLUDE: "./2020 Spring.org::#Syllabus" :only-contents t

2 ``Syllabus`` Top-level Tree
-----------------------------

The ``Syllabus`` subtree contains course description, learning
objectives, grading, etc., as shown in the example below. Instructors
can include additional information as they see fit. We now describe each
subtree.

::

    * Syllabus
    ** Tasks [0/1]                                                     :noexport:
    ** Intro                                                            :ignore:
    ** Course Description
    ** Course Prerequisites
    ** Student Learning Objectives
    ** Course Material
    ** Grading
    ** Specific Course Policies
    ** School-Specific Policies
    ** Class Schedule                                                   :newpage:

2.1 Intro
~~~~~~~~~

The Intro has the title page of the Syllabus. The title page contains a blank
school name (the color of the text is defined in the institution Org file) as a
placeholder for the school logo the instructor wishes to use. There is
also a table of course information, which heavily relies on macros
to avoid redundancy.

Some of the macros are in the form of ``property(PROPERTY_NAME)`` (e.g.,
``{{{property(SECTION_DATE)}}}``), which means it will receive the value of the
``:PROPERTY_NAME:`` property of the subtree. When the content is included in
another subtree such as the ``Sections`` subtree, these property macros will pull
the value from the subtree including this content. That is,
``{{{property(SECTION_DATE)}}}`` will get the value from the ``:SECTION_DATE:``
property of the ``01`` (``02``) subtree of the ``Sections`` subtree when
included by the ``01`` (``02``) subtree.

Note that the header of the Intro subtree is assigned an ``:ignore:`` tag, which means the heading (``Intro``)
will be ignored in exporting.

::

    ** Intro                                                            :ignore:
    @@latex:\definecolor{SchoolColor}{RGB}{@@{{{SCHOOL_COLOR}}}@@latex:}@@

    #+BEGIN_CENTER
    #+LATEX: {\color{SchoolColor}{\Large
    *{{{SCHOOL}}}*
    #+LATEX: }}
    #+END_CENTER

    #+BEGIN_CENTER
    #+LATEX: {\color{SchoolColor}{
    *{{{COURSE_NUM}}}-{{{property(SECTION)}}}*

    *{{{COURSE}}}*

    *{{{SEMESTER}}}*
    #+LATEX: }}
    #+END_CENTER

    {{{VSPACE(5)}}}

    | *Instructor:*               | {{{PROFESSOR}}}              | *Office Phone:*   | {{{PHONE}}}                 |
    | *Office:*                   | {{{OFFICE}}}                 | *E-mail:*         | {{{EMAIL}}}                 |
    | *Office Hours:*             | {{{OFFICE_HOURS}}}           | *Course Site:*    | *{{{COURSE_LINK}}}*         |
    | *Class Meeting Day & Time:* | {{{property(SECTION_DATE)}}} | *Class Location:* | {{{property(SECTION_LOC)}}} |

2.2 Course-speific information
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- Since different sections of the same course typically share common elements (e.g.,
  course description, prerequisites, learning objectives), the
  content of most subtrees of ``Syllabus`` are pulled from the course Org
  file on exporting, using ``#+INCLUDE``.

- Note that instructors can use semester-specific information in these subtrees using macros -- see the ``Grading`` subtree for an example.

- School-wide information (e.g., grade cutoff percentages) is imported
  from the institution Org file.

2.3 Class Schedule
~~~~~~~~~~~~~~~~~~

- The ``Class Schedule`` subtree contains the class schedule in a table format.

- The table is dynamically generated using org-mode's `columnview dynamic block <https://orgmode.org/manual/Capturing-column-view.html#Capturing-column-view>`_
  functionality -- it will extract information about each class from the class
  subtree's properties, and automatically create the class schedule table.

- One can use ``C-c C-c`` while the cursor is on the ``#+BEGIN: columnview`` to
  update the columnview dynamic block. Once it is updated, ``#+TBLFM`` is used
  to format the table (e.g., change the third column name from ``ITEM`` to
  ``Topic``) automatically.
