<insertion>{
let $doc := fn:doc('/db/testCollection/test.xml') return
(
for $a in $doc//A return update insert <b/> into $a,
update insert <c nb='{count($doc//b)}'/> following $doc//A[last()]
)
}</insertion>