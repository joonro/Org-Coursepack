===================================
Class 3: Topic and Course Org Files
===================================


ORG 0000   
Joon H. Ro & Jae-Eun Namkoong 

Class 3  
[2018-09-04 Tue]

1 Topic Org Files
-----------------

A topic Org file contains course content (e.g., lecture slides and
notes, exam questions, assignment guidelines) for a given topic. Its
general structure is shown below, using an example of Regression as a
teaching topic. The top section (where lines start with ``#+``) has
metadata for the Org file. Including meta data is optional.

::

    #+TITLE:     Topics: Regression
    #+AUTHOR:    Your Name
    #+EMAIL:     Your Email
    #+DESCRIPTION: Topic Org file for Regression
    #+CATEGORY: TOPIC
    #+STARTUP: overview
    #+STARTUP: hidestars

    * Lectures
    * Assignments
    * Exercises
    * Questions

.. _Lectures/Topic Org Files/Organizing Content:

1.1 Organizing Content in Topic Org Files
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

- In most cases, course content would be created in a topic Org file (e.g., a
  topic Org file that covers Regression), each consisting of multiple
  sub-topics (e.g., subtopics of Regression such as, Estimation, Interpretation, R-squared). Sub-topics are
  organized in the form of a subtree as shown in the example below.

  ::

      * Lectures
      ** Estimation
      :PROPERTIES:
      :CUSTOM_ID: Lectures/Estimation
      :END:
      ** Interpretation
      :PROPERTIES:
      ** R-Squared
      :PROPERTIES:

- Each sub-topic should have a ``:CUSTOM_ID:`` property, as shown in the example
  above, so it can be included in another file, such as a semester Org file.

  .. note::

      On a related note, an important consideration when creating a topic
      Org file is the fact that the content in it has the potential to be
      included in multiple different semester Org files. Hence, an
      instructor who, for instance, plans to teach the same topic (e.g.,
      Regression) or sub-topic (e.g., R-squared) in different courses
      (e.g., Statistics 101 and Marketing Research) would benefit from not
      making references to a specific course in the topic Org file.

- The Org-Coursepacket includes multiple topic Org files located in the the
  ``Topics`` folder.

- A topic org file can contain relevant assignments, exercises, and exam
  questions under corresponding subtrees.

2 Course Org Files
------------------

A course Org file contains permanent information for the corresponding
course, that is, information about the course that remains consistent across semesters
(e.g., learning objectives, grading schemes).

We will now review the structure and contents of the course Org
file. The example below shows the highest-level headings of the course
Org file for Org-Coursepack -- i.e., Courses and Syllabus.

::

    #+TITLE:     Course: Org-Coursepack
    #+AUTHOR:    Your Name
    #+EMAIL:     Your Email
    #+DESCRIPTION: org file for Org-Coursepack
    #+CATEGORY: COURSE
    #+STARTUP: overview
    #+STARTUP: hidestars

    * Courses
    * Syllabus

The ``Courses`` tree can have a subtree for each semester teaching this
course. See example below. Note that, in the actual course Org file,
semester subtrees are links to their respective semester Org files.

::

    * Courses
    ** 2020 Spring

The ``Syllabus`` subtree containts partial content for the syllabus,
specifically, information about the course that remains consistent
across semesters (e.g., ``Course Description``, ``Learning Objectives``, grading scheme). See an example of the ``Syllabus``
tree with only the ``Course Description`` subtree expanded.

::

    * Syllabus
    ** Course Description
    :PROPERTIES:
    :CUSTOM_ID: Syllabus/Course Description
    :END:
    Course description here
    ** Student Learning Objectives
    ** Course Material
    ** Grading
    ** Specific Course Policies
