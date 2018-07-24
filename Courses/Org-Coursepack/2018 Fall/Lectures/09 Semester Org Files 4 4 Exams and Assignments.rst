========================================================
Class 9: Semester Org Files (4/4): Exams and Assignments
========================================================


 ORG 0000  Joon H. Ro & Jae-Eun Namkoong  
 Class 9  [2018-09-25 Tue] 

1 ``Exams`` Top-level Tree
--------------------------

Instructors can create content for exams as they wuold for
lectures. Lists can be used to create multiple choice questions. See
the Org mode `manual <https://orgmode.org/manual/Plain-lists.html>`_ for more information. To minimize redundancy,
exams are designed to be modular and common elements are shared as
much as possible. Furthermore, Org mode's property inheritance allows
instructors to conveniently create answer keys to multiple choice
questions and to export the exam with or without the keys.

As shown in the following example, there are two subtrees in the
Org-Coursepack: one for the exam title page and another for the mid-term
exam.

::

    * Exams                                                          :Exams:
    :PROPERTIES:
    ** Title Page
    ** Mid-Term Exam

1.1 ``:PROPERTIES:``
~~~~~~~~~~~~~~~~~~~~

The properties have general information common across exams, such as LaTeX headers.

1.2 ``Title Page`` Subtree
~~~~~~~~~~~~~~~~~~~~~~~~~~

The content of this subtree will be shared across exams via the
``#+INCLUDE`` statement. Instructors can include general information
pertaining to exams (e.g., student code of conduct) in this page. Note
that any information about a specific exam (e.g., exam date, exam
time, number of questions) can be specified by passing property values
to the ``Title Page`` subtree. For example, the exam time information
uses the value of the property ``TIME`` using ``{{{property(TIME)}}}``.

1.3 Exam subtree
~~~~~~~~~~~~~~~~

The mid-term exam subtree in the Org-Coursepack has the following structure:

::

    ** Mid-Term Exam
    :PROPERTIES:
    *** 01
    *** 02
    *** Exam Content

Each exam has a separate subtree for each course section, and they will
share common ``Exam Content``.

1.3.1 ``:Properties:``
^^^^^^^^^^^^^^^^^^^^^^

Each exam subtree has properties containing information common across sections. See example below.

::

    :PROPERTIES:
    :CUSTOM_ID: Exam/1
    :EXPORT_TITLE: Exam 1
    :EXPORT_DATE:  {{{DATE_EXAM_1}}}
    :TIME: 75 Minutes
    :END:

1.4 Section Subtrees
~~~~~~~~~~~~~~~~~~~~

Each exam in the Org-Coursepack has two section subtrees. Instructors
may add additional sections. Each subtree has section-specific
information about the exam in their ``:PROPERTIES:``. Each section can
have multiple versions of the same exam (e.g., ``A`` and ``B`` versions),
with each version beloning to a separate subtree. The exam content
includes a title page, multiple choice questions, and short
answers. See the example and note below.

::

    *** 01
    :PROPERTIES:
    :EXPORT_AUTHOR: {{{COURSE_NUM}}}-01: {{{COURSE}}}
    :ANSWER:
    :END:
    **** A Type
    :PROPERTIES:
    #+INCLUDE: "2018 Fall.org::#Exam/Title Page" :only-contents t
    ***** Multiple Choice                                               :newpage:
    (2 points each, unless otherwise specified)
    #+INCLUDE: "2018 Fall.org::#Exam/1/MC/A" :only-contents t
    ***** Short Answers                                                 :newpage:
    #+INCLUDE: "2018 Fall.org::#Exam/1/Short Answers" :only-contents t

.. note::

    Note that the property ``:ANSWER:`` is empty. This is to hide answers for
    multiple choice questions--see ``Exam Contents/Multiple Choice`` for details.

1.5 ``Exam Content`` Subtree
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The ``Exam Content`` subtree contains exam questions. Its content can be
pulled in section-specific exam subtrees to create exams. The ``Exam Content`` subtree
can also be used to create exam keys by exporting the version subtree
(e.g., ``Type A (Key)``) under ``Exam Content/Multiple Choice``. 

::

    *** Exam Content
    **** Multiple Choice
    :PROPERTIES:
    ***** Type A (Key)
    ***** Type B (Key)
    **** Short Answers                                                  :newpage:
    :PROPERTIES:
    #+INCLUDE: "../../../Topics/Org_Teaching.org::#Question/SA" :only-contents t

1.6 Multiple Choice
~~~~~~~~~~~~~~~~~~~

The Org-Coursepack exams have two versions (type A and B). The two
versions have the same multiple choice questions in the same order,
but the choice options are in different orders. 

.. note::

    To create a new version, an instructor may first create a duplicate of the
    original version subtree and use the ``Alt+Up`` or ``Alt+Down`` keys on the choice
    options to change their orders. Pressing ``C-c C-c`` automatically re-numbers the
    items in the list.

The example below shows a
subset of content in the ``Multiple Choice`` tree.

::

    **** Multiple Choice
    :PROPERTIES:
    :ANSWER: \checkmark
    :END:
    ***** Type A (Key)
    :PROPERTIES:

    1. Which of the following is a vegetable?
       1. Okra
       2. Carrot {{{property(ANSWER)}}}
       3. Eggplant
       4. Pepper

    ***** Type B (Key)
    :PROPERTIES:

    1. Which of the following is a vegetable?
       1. Okra
       2. Pepper
       3. Eggplant
       4. Carrot {{{property(ANSWER)}}}

.. note::

    The answer to each multiple choice question is marked with the macro
    ``{{{property(ANSWER)}}}`` and the ``Multiple Choice`` tree has the property of ``:ANSWER: \checkmark``. Hence, an instructor can export the version subtree (e.g., ``Type A (Key)``) to obtain the answer keys, with correct answers marked by a checkmark symbol.

1.7 Short Answers
~~~~~~~~~~~~~~~~~

Since open-ended questions do not typically require multiple versions,
one can have such questions in the corresponding topic Org file
(e.g., under the ``Questions`` top-level tree) and include them here.

2 ``Assignments`` Top-level Tree
--------------------------------

- Instructors can create assignments as they do lecture content using Org mode.

- Assignment instructions may be created in the ``Assignments`` top-level
  tree of a topic Org file, which are then included here.

- See ``Org_Teaching/2018 Fall/2018 Fall.org`` for an example.

3 ``Local Variables`` Top-level Tree
------------------------------------

``Local variables`` top-level tree has file-local variables. See the
`Emacs manual <https://www.gnu.org/software/emacs/manual/html_node/emacs/Specifying-File-Variables.html#Specifying-File-Variables>`_ for more information. File-local variables include the
options to (a) skip confirmation on running elisp-link functions
(``org-confirm-elisp-link-function: nil``), (b) allow property
inheritance (``org-use-property-inheritance: t``), which is important
for many functionalities of the Org-Coursepack to work properly, and (c)
change the default timestamp format.

The following shows the content of this subtree.

::

    # Local Variables:
    # org-confirm-elisp-link-function: nil
    # org-export-babel-evaluate: 'inline-only
    # org-use-property-inheritance: t
    # org-time-stamp-custom-formats: ("<%a, %b %d, %Y>" . "<%a, %b %d, %Y %l:%M%p>")
    # org-latex-active-timestamp-format: "%s"
    # org-latex-inactive-timestamp-format: "%s"
    # End:
