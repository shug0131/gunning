---
layout: home
title: Home
---


This is a tool that tries to calculate the Gunning Fog Index. It is  a weighted average of the number of words per sentence, and the number of long words per word. An interpretation is that the text can be understood by someone who left full-time education at a later age than the index.

Copy and paste your text into the box below. Make sure you use complete sentences.

<div class="entry" id="input-section"  markdown="0">
 <textarea id="text-input" rows="20" cols="80"></textarea><br><br>
 <button id="calc-btn">Calculate</button>
</div>
<div id="results-section" style="display:none;" markdown="0">
 <div class="post">
  <h2>The Gunning Fog index is <font color="red" id="fog-score"></font></h2>
  <ul>
   <li>The number of major punctuation marks, eg. <font color="red">[.]</font>, was <input type="text" id="val-B" size="5"></li>
   <li>The number of words was <input type="text" id="val-A" size="5"></li>
   <li>The number of 3+ syllable words, <font color="blue">highlighted in blue</font>, was <input type="text" id="val-C" size="5"></li>
  </ul>
  <p>You can edit the numbers above and recalculate<br>
  <button id="recalc-btn">Recalculate</button>
 
 <div class="post">
  <br><hr><h2>Edited Text</h2><br>
  <div id="output-text"></div>
 
</div>  


<script src="/assets/js/gunning2.js"></script>


