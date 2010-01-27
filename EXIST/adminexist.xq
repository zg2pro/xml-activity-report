xquery version "1.0";   
  
  declare namespace  xdb="http://exist-db.org/xquery/xmldb";   
  declare namespace util="http://exist-db.org/xquery/util";   
    
  
  
  <result>{
  let $isregistered :=
xdb:register-database("org.exist.xmldb.DatabaseImpl", true()),
    $isLoggedIn := xdb:login("xmldb:exist:///db", "guest", ""),
    $out := xdb:create-collection("xmldb:exist:///db/","testCollection")   
  return
    xdb:store($out, "test.xml", "<test><A/></test>")}
  </result>
