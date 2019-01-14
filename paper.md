---
title: 'Org-Coursepack: A Modular and Reusable Teaching Materials Template in Org-mode'
tags:
- emacs
- org-mode
- template
- software
authors:
- name: Joon H. Ro
  orcid: 0000-0002-5895-163X
  affiliation: 1
- name: Jae-Eun Namkoong
  orcid: 0000-0002-8133-5317
  affiliation: 2
affiliations:
- name: Tulane University
  index: 1
- name: University of Nevada, Reno
  index: 2
date: 22 July 2018
bibliography: paper.bib
---

# Summary

The Org-Coursepack provides a template for developing and managing teaching
materials using [Org mode](https://orgmode.org), a major mode in [GNU
Emacs](https://www.gnu.org/software/emacs/). The template is designed to be
self-explanatory since the documentation for it consists of a sample course
developed with this template.

# Statement of Need

Org-Coursepack started as an attempt to solve challenges authors experienced
when creating and managing teaching materials. The key benefits of using the
template as an instructor are summarized below.

First, sharing materials across courses becomes more effective and efficient
with the template than with traditional means of creating lecture slides
(e.g., PowerPoints or Beamer) because the template relies heavily on the file
inclusion functionality of Org mode; thus, it is designed to be as modular as
possible. As a result, a course topic can be used across multiple sections of
the same course or across multiple courses, which means improvements made to
one lecture file will automatically propagate across all sections and courses
covering the topic, reducing redundancy and inconsistency. Thus,
Org-Coursepack would be especially useful for an instructor with multiple
courses that share common course materials.

Second, the flexible export system and output-specific export options in Org
mode allow instructors to generate outputs in multiple formats. Any
course-related material, such as syllabi, exam reviews, or lectures, can be
easily exported in the form of slides (e.g., via reveal.js or Beamer backends)
or handouts (e.g., via LaTeX or reStructuredText backends) while maintaining
consistent content regardless of format. This allows instructors to create
properly formatted, document-like handouts for their lectures, offering better
presentation and legibility compared to scaled-down slides. In addition,
instructors can choose to selectively present certain components (e.g.,
images, charts, or notes) depending on the output format. These features
eliminate the need for instructors to maintain separate files for different
output formats.

Third, the template contains utility functions written in Emacs Lisp,
shortcuts to Org mode functions, and basic class structures, all of which
contribute to automating a variety of instruction-related tasks. The features
include, but are not limited to, automatic class numbering and automatic
creation of key content, such as course schedules for syllabi, summaries of
class materials, and exam keys.

In sum, the template can improve instructors’ efficacy by minimizing
redundancy and automating various tasks. This is important because repetitive,
tedious, tangential tasks―and the psychological distractions associated with
them―can pull instructors’ attention away from core instructional
responsibilities. Removing such elements makes course preparation more
seamless, and redirecting the newly found time and mental resources to
positive educational outlets can enhance instructors’ intrinsic motivation and
creativity [@Csikszentmihalyi2014Book].

We believe students are the ultimate beneficiaries of this approach since
their overall learning experience can be enhanced through consistent, properly
formatted, strategically presented course materials that are more engaging and
easier to comprehend. Such materials are also easier to digest and review
outside the classroom.

Two business courses related to marketing analytics, which share about 60% of
their course materials, were successfully created and managed using this
template. We have received positive feedback from students about the benefits
of having well-organized, high-quality teaching materials, as shown by the
following comments from students’ course evaluations:

> The slides are extremely helpful and I appreciate that because textbooks are
> expensive and unnecessary when the lecture material is of this caliber.

> The teaching materials could not be any better. It was very helpful to expect
> a handout at the beginning of each class, one that was formatted identically
> to the others and was very clear about communicating the content of the
> lecture.

The documentation provided in the Org-Coursepack is designed to be
straightforward so instructors with basic knowledge about Org mode can
customize it to meet their unique needs, whether they are creating new course
content or converting existing courses. Outside a traditional classroom
setting, the tool may be used for a wide range of instructional purposes, such
as employee training sessions, workshops, and consumer
education. Well-organized, effectively presented course materials can enhance
fluency in self-regulated learning; thus, the template may be especially
beneficial for online courses in which independent work and learnercontent
interaction are critical to student satisfaction and success [@Kuo2014].

More broadly, Org mode is useful for not only instructors but also
practitioners across a variety of fields. For instance, businesses can use the
approach when documenting multiple, often overlapping products and services
either for internal recording purposes or for presentations to external
clients. It is also useful to those managing a myriad of legal or other
administrative documents that often refer to one another or contain common
elements. We hope the Org-Coursepack, and Org mode in general, will contribute
to the productivity of both those who use it and those who are served by it.

# References
