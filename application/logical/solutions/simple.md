---
layout: default
title:  "simple"
permalink: /de/simple.html
---

## Ausgangssituation und Ergebnis

{% assign cellpadding = "style='padding: 10px; vertical-align: top'"%}

<table><tr><td {{ cellpadding }}>
<img src="/business/marketing/website/assets/images/visualcube/generic/0000-0_DL2U2L2DL2DB2R2L2U'B2RU2FU2F2R2DLUB_180.png" /><br /> before  </td><td {{ cellpadding }}>  <img src="/business/marketing/website/assets/images/visualcube/generic/0000-0_solved_180.png" /> <br />after
</td></tr></table>

## Schritte ##

{% assign steps = site.data.solutions | where:"solutionID","simple" %}
{% assign lastseenstep = "-1" %}

<table><tr>
{% for step in steps %}
{% if step.stepnumber != lastseenstep %}
{% if lastseenstep != "-1" %}</tr></table> <p /> <table><tr>{% endif %}
{% endif %}
  <td {{ cellpadding }}><img src="/business/marketing/website/assets/images/{{ step.imagegenerator }}/{{ step.solutionID }}/{{step.stepnumber | prepend: '0000' | slice: -4, 4 }}-{{ step.variant | default: 0 }}_{{step.face_definition}}_180.png" /> <br /> {{ step.algo_next_en }} </td>
{% assign lastseenstep = step.stepnumber %}
{% endfor %}
</tr></table>
