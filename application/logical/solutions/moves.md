---
layout: default
title:  "moves"
permalink: /en/moves.html
lang: "en"
---

{% assign cellpadding = "style='padding: 10px; vertical-align: top'"%}


## Moves ##

{% assign steps = site.data.solutions | where:"solutionID","moves" %}
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
