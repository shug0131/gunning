---
---

escapeHtml = (str) ->
  str.replace(/&/g, '&amp;')
     .replace(/</g, '&lt;')
     .replace(/>/g, '&gt;')


calculateFog = (A, B, C) ->
  if A > 0 and B > 0
    ((A / B + 100 * C / A) * 0.4).toFixed(4)
  else
    "Undefined"

countSyllables = (word) ->
  syl = 0
  word2 = word.toLowerCase().replace(/[\W,'`"]/g, '')
  
  m1 = word2.match(/aa|ae|ai|au|ee|ei|eu|oa|oe|oi|oo|ou|[aeiou]y/g)
  syl += m1.length if m1
  word2 = word2.replace(/aa|ae|ai|au|ee|ei|eu|oa|oe|oi|oo|ou|[aeiou]y/g, '')

  m2 = word2.match(/ao|eo|ia|ii|ua|ui|uo|uu/g)
  syl += 2 * m2.length if m2
  word2 = word2.replace(/ao|eo|ia|ii|ua|ui|uo|uu/g, '')

  m3 = word2.match(/ea\w|ion|ies|ie$|ues|ue$/g)
  syl += m3.length if m3
  word2 = word2.replace(/ea\w|ion|ies|ie$|ues|ue$/g, '')

  m4 = word2.match(/ea$|ie\w|ue\w|iou|io[^n]/g)
  syl += 2 * m4.length if m4
  word2 = word2.replace(/ea$|ie\w|ue\w|iou|io[^n]/g, '')

  m5 = word2.match(/[aeiouy]/g)
  syl += m5.length if m5

  m6 = word2.match(/^the$|^[bhmwy]e$/g)
  syl += m6.length if m6

  m7 = word2.match(/es$|ed$|ing$|e$/g)
  syl -= m7.length if m7

  syl

processText = ->
  text = document.getElementById('text-input').value
  words = text.trim().split(/\s+/)
  return if words.length is 0 or words[0] is ""

  A = words.length
  B = 0
  C = 0
  outputHtml = ""
  
  puncRegex = new RegExp("[\\.:;\\?!/]", "g")

  for word in words
    syl = countSyllables(word)
    
    # Check for punctuation markers
    puncMatches = word.match(puncRegex)
    B += puncMatches.length if puncMatches
    
    formattedWord = escapeHtml(word).replace(puncRegex, '<font color="red">[$1]</font>')

    if syl >= 3
      C++
      outputHtml += "<font color=\"blue\">#{formattedWord}</font> "
    else
      outputHtml += "#{formattedWord} "

  document.getElementById('val-A').value = A
  document.getElementById('val-B').value = B
  document.getElementById('val-C').value = C
  document.getElementById('fog-score').innerText = calculateFog(A, B, C)
  document.getElementById('output-text').innerHTML = outputHtml
  document.getElementById('results-section').style.display = 'block'

recalculate = ->
  A = parseFloat(document.getElementById('val-A').value) or 0
  B = parseFloat(document.getElementById('val-B').value) or 0
  C = parseFloat(document.getElementById('val-C').value) or 0
  document.getElementById('fog-score').innerText = calculateFog(A, B, C)

resetForm = (e) ->
  e?.preventDefault()
  document.getElementById('text-input').value = ''
  document.getElementById('results-section').style.display = 'none'

document.getElementById('calc-btn').addEventListener 'click', processText
document.getElementById('recalc-btn').addEventListener 'click', recalculate
document.getElementById('new-scoring').addEventListener 'click', resetForm


