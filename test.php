---
layout: default
title: Test if PHP works
---
<h1>{{ page.title }}</h1>
<ol><?php

    for ($i=0;$i<10;$i++) {
        echo "<li>$i</li>";
    }

?></ol>
