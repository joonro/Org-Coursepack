========================
Class 2: Org Mode Basics
========================


 ORG 0000  Joon H. Ro & Jae-Eun Namkoong  
 Class 2  [2018-08-30 Thu] 

1 Headings
----------

- In Org mode, a heading is denoted by preceding stars (``\*``), and the level of
  a heading is determined by the number of stars.

- For example,

  ::

      * Heading 1
      ** Subheading 1.1
      * Heading 2
      ** Subheading 2.1

- A heading can have tags and properties associated with them, which allows
  very flexible usage that we exploit throughout Org-Coursepack.

1.1 Tags
~~~~~~~~

- A heading can have tags associated with them. They are used in the form of ``:tag:``, on the same line as the heading. For example,

  ::

      * Heading with a tag                       :tag:

.. _Lectures/Org Mode Basics/Properties:

1.2 Properties
~~~~~~~~~~~~~~

- Each heading can have properties associated with it. You can think of
  properties as data specific for the heading, as they consist of
  ``:PROPERTY_NAME:`` and ``PROPERTY VALUE`` pairs.

- For example, a heading for a lecture can have property values for lecture
  number, file name for exports, etc. One of the frequently used properties is
  ``:CUSTOM_ID:``, which can be used to locate the particular heading. See the
  ``Including Content from Another Org file`` section for how it is used in
  Org-Coursepack.

- See the `Org manual <https://orgmode.org/manual/Properties-and-columns.html>`_ for more information.

- For example,

  ::

      * Heading 1
      :PROPERTIES:
      :CUSTOM_ID: Heading 1
      :END:

2 Macros
--------

Org mode provides macro replacement functionality. This can be especially
useful for instructors, as shown in the following cases.

- When defining terms that will be repeated within or across course-related
  materials, or needs to be changed in future semesters.

  Example
      Suppose an instructor were to present a due date for
      "Assignment 1" in three different places (e.g., syllabus,
      lecture, and assignment guideline). By using a macro, an
      instructor can ensure that all documents have the same
      information, and make such updates easily in future
      semesters. Such a macro (named ``DUE_ASSIGNMENT_1``) can be
      defined like the following:

      ::

          #+MACRO: DUE_ASSIGNMENT_1 [2018-09-27 Thu]

      One can then use the macro with ``{{{MACRO_NAME}}}``. For example, all
      areas in documents where it says ``{{{DUE_ASSIGNMENT_1}}}`` will be
      replaced with ``[2018-09-27 Thu]`` upon export.

- When defining terms specific to a subtree (e.g., a specific class) that
  the instructor may want to use in multiple places. This can be useful when
  specifying class orders, class titles, or section numbers. One
  can achieve this by referring to property values of a subtree.

  Example
      An instructor can define a class number property like the following:

      ::

          * Heading
          :PROPERTIES:
          :CLASS:    2
          :END:

      Then ``{{{property(PROPERTY_NAME)}}}`` will be replaced by
      the value of ``PROPERTY_NAME`` property:

      ::

          This is class number {{{property(CLASS)}}}.

- See the `Org manual <https://orgmode.org/manual/Macro-replacement.html>`_ for more information.

3 Including Content from Another Org file
-----------------------------------------

- In Org mode, a user can pull content, without making a copy, from any org file (including
  the current one) via the ``#+INCLUDE:`` statement. See the `Org manual <https://orgmode.org/manual/Include-files.html>`_ fore more information.

- Taking advantage of this functionality, the template is created so that its
  content is modular and can be pulled flexibly as needed. This feature is
  useful when sharing content across different courses or semesters or when
  revisiting past materials (e.g., in exam reviews or when reviewing past
  cases to build on them).

  Example
      This is how an instructor would use the ``#+INCLUDE:`` statement
      to pull content from a subtree with ``:CUSTOM_ID:`` ``R-squared``
      in the file ``Regression.org`` so it is presented across multiple
      courses (i.e., Statistics 101 and Marketing Research).
      ``:only-contents t`` option means only the contents of the
      subtree, not its heading and properties, will be included. To
      visit the included file, press ``C-c '`` while the cursor is on
      the ``#+INCLUDE:`` statement.

      - **``Regression.org``**  

        ::

            * R-squared
            :PROPERTIES:
            :CUSTOM_ID: R-squared
            :END:
            - The definition of \( R^{2} \) is:
              \[ R^{2} = 1 - \dfrac{SS_{\text{res}}}{SS_{\text{tot}}}\]

      - **``Statistics 101.org``**  

        ::

            * Regression
            ** R-squared
            #+INCLUDE: "/Regression.org::#R-squared" :only-contents t

      - **``Marketing Research.org``**  

        ::

            * Regression
            ** R-squared
            #+INCLUDE: "/Regression.org::#R-squared" :only-contents t
